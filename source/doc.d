module doc;

import std.conv;
import std.string;
import std.string : startsWith;
import std.string : fromStringz, toStringz; 
import std.algorithm.searching : canFind;
import std.algorithm.searching : countUntil;
import std.algorithm.searching : find;
import std.process : executeShell;
import bindbc.sdl;
import bindbc.sdl.image;
import bindbc.sdl.ttf;
import tstring;
import etree;
import klass;
import e;
import types;
import events;
import draws : get_text_size;
import std.stdio : writeln;
import std.stdio : write;
import pix : open_font;
import pix : Window;
import pix : IMGException;
import pix : redraw_window;
import draws : e_pos, e_size, content_pos;
import klasses.e : global_font_files;
import field : Field;
import pix : redraw;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;

alias DOC_EVENT_FN  = int    function (Doc* doc, Event* ev);
alias DOC_UPDATE_FN = void   function (Doc* Doc);
alias DOC_DRAW_FN   = void   function (Doc* Doc,SDL_Renderer* renderer, ETree* t);
alias DOC_DUP_FN    = DocPtr function (DocPtr _this);
alias DocPtr = Doc*;

struct
Doc {
    Klass*   hotkeys;
    Window*  window;
    Size     size = Size (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H);
    ETree*   focused;
    ETree*   tree;
    Klass*[] klasses;

    DOC_EVENT_FN  event  = &.event;
    DOC_UPDATE_FN update = &.update;
    DOC_DRAW_FN   draw   = &.draw;
    DOC_DUP_FN    dup    = &._dup;
}

void
add_child (Doc* doc, ETree* t) {
    doc.tree.add_child (t);
}

void
add_child (Doc* doc, Klass* kls) {
    doc.klasses ~= kls;
}

ETree*
find_e_at_pos (Doc* doc, Pos pos) {
    ETree* found;

    bool 
    valid_e (ETree* t) {
        return pos_in_rect (pos, t.e.pos, t.e.size);
    }

    import etree : WalkChilds;
    import etree : FindDeepest;
    foreach (_e_tree; doc.tree.childs) {
        foreach (t; FindDeepest (_e_tree,&valid_e)) {
            found = t;
        }
    }

    return found;
}

Klass*
find_klass_or_create (Doc* doc, string s) {
    auto kls = find_klass (doc,s);
    if (kls is null)
        kls = create_klass (doc,s);
    return kls;
}

Klass*
find_klass (Doc* doc, string s) {
    foreach (kls; doc.klasses)
        if (kls.name == s)
            return kls;

    return null;
}

Field*
find_field (Klass* kls, string s) {
    foreach (field; WalkFields (kls))
        if (field.name == s)
            return field;

    return null;
}

Klass*
create_klass (Doc* doc, string s) {
    Klass* kls = new Klass (s);
    add_klass (doc,kls);
    return kls;
}


void
add_klass (Doc* doc, Klass* kls) {
    doc.klasses ~= kls;
}


void
add_e (Doc* doc, ETree* t) {
    if (doc.tree is null)
        doc.tree = t;
    else
        doc.tree.add_child (t);
}


auto
new_e (Doc* doc) {
    return etree.new_e ();
}


void
send_event_in_deep (Event* ev, ETree* t, Pos pos, SDL_Window* window, SDL_Renderer* renderer) {
    bool 
    valid_e (ETree* t) {
        return (
            pos_in_rect (pos, t.e.pos, t.e.size)
        );
    }

    // klass event
    foreach (_t; etree.FindDeepest (t,&valid_e)) {
        foreach (kls; _t.e.klasses)
            if (kls.event !is null)
                kls.event (kls,ev,_t);
    }
}

void
send_click_in_deep (Event* ev, ETree* t, Pos down_pos, Pos up_pos, ref ETree* deepest) {
    bool 
    valid_e (ETree* t) {
        return (
            pos_in_rect (down_pos, t.e.pos, t.e.size) &&
            pos_in_rect (up_pos,   t.e.pos, t.e.size)
        );
    }

    // klass event
    foreach (_t; FindDeepest (t,&valid_e)) {
        foreach (kls; _t.e.klasses)
            if (kls.event !is null)
                kls.event (kls,ev,_t);
        deepest = _t;
    }
}

void
send_mouse_event_in_deep (Event* ev, ETree* t, Pos pos, ref ETree* deepest) {
    bool 
    valid_e (ETree* t) {
        return (
            pos_in_rect (pos, t.e.pos, t.e.size)
        );
    }

    // klass event
    foreach (_t; FindDeepest (t,&valid_e)) {
        //writeln (*_t);
        foreach (kls; _t.e.klasses)
            if (kls.event !is null)
                kls.event (kls,ev,_t);
        deepest = _t;
    }
}

void
send_event_in_tree (Event* ev) {
    // klass event
    foreach (_t; WalkTree (ev.doc)) {
        foreach (kls; _t.e.klasses)
            if (kls.event !is null)
                kls.event (kls,ev,_t);
    }
}

void
add_class (E* e, Doc* doc, string s) {
    Klass* kls = doc.find_klass_or_create (s);
    if (!e.klasses.canFind (kls))
        e.klasses ~= kls;
}

bool
has_class (E* e, Doc* doc, string s) {
    Klass* kls = doc.find_klass (s);
    assert (kls !is null);
    return (!e.klasses.canFind (kls));
}

void
trigger_class (E* e, Doc* doc, string s) {
    if (e.has_class (doc,"check.pressed"))
        e.remove_class (doc,"check.pressed");
    else
        e.add_class (doc,"check.pressed");
}


void
remove_class_from_all (Doc* doc, string s) {
    Klass* kls = doc.find_klass (s);
    if (kls !is null)
        foreach (t; WalkTree (doc))
            remove_class (&t.e, kls);
}

void
remove_class (E* e, Doc* doc, string s) {
    auto kls = doc.find_klass (s);
    if (kls !is null)
        e.remove_class (kls);
}

void
remove_class (E* e, Klass* kls) {
    import std.algorithm.searching : countUntil;
    import std.algorithm : remove;

    auto i = e.klasses.countUntil (kls);
    if (i != -1)
        e.klasses = e.klasses.remove (i);
}

void
doc_apply_klasses (Doc* doc) {
    foreach (t; WalkTree (doc)) 
        apply_klasses (doc,t);
}

void
apply_klasses (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.on.length = 0;
    global_font_files.length = 0;

    // remove e added from klass
    ETree*[] for_remove;
    foreach (_t; WalkChilds (t))
        if (_t.e.from_klass !is null)
            for_remove ~= _t;
    foreach (_t; for_remove)
        t.remove_child (_t);

    // set . each e klass
    foreach (kls; e.klasses)
        apply_klass (doc,t,kls);

    write (format!"%60s" (e.toString)); time_step ("",0);
}

// WIDGET_APPLY_KLASS_FN
void
apply_klass (Doc* doc, ETree* t, Klass* kls) {
    E* e = &t.e;

    // each field
    // each sub tree
    foreach (field; WalkFields (kls)) {
        switch (field.name) {
            case "e"      : add_sub_tree (doc,t,field); break; // add e
            case "switch" : set_switch   (doc,t,field); break; // set field
            default       : set_field    (doc,t,field); break; // set field
        }
    }
}

void
set_field (Doc* doc, ETree* t, Field* field) {
    E* e = &t.e;

    // `command` -> exec command -> output
    auto values = extract_quoted (doc,field.values);

    // klasses set
    foreach (kls; e.klasses) {
        if (kls.set !is null)
            kls.set (kls,doc,t,field.name,values);
    }
}

void
add_sub_tree (Doc* doc, ETree* dest_t, Field* field) {
    // clone each t
    // add in dest_t
    auto t = doc.new_child_e (field.values);
    dest_t.add_child (t);

    // recursive
    foreach (_field; WalkFields (field)) {
        switch (_field.name) {
            case "e"      : add_sub_tree (doc,t,_field); break; // add e
            case "switch" : set_switch   (doc,t,_field); break; // set field
            default       : set_field    (doc,t,_field); break; // set field
        }
    }
}

void
set_switch (Doc* doc, ETree* dest_t, Field* field) {
    auto evaluated = evaluate_switch_cond (doc,field.values);

    // switch value
    //   case value1
    //     field values
    //   case value2
    //     field values

    // each child case
    if (evaluated.length >= 1)
    foreach (_field; WalkFields (field)) {
        if (_field.name == evaluated[0].s) {
            set_case (doc,dest_t,_field);
            return;
        }
    }

    // default
    foreach (_field; WalkFields (field)) {
        if (_field.name == "default") {
            set_case (doc,dest_t,_field);
            return;
        }
    }
}

void
set_case (Doc* doc, ETree* dest_t, Field* field) {
    apply_case (doc,dest_t,field);
}

void
apply_case (Doc* doc, ETree* t, Field* field) {
    E* e = &t.e;

    // each field
    // each sub tree
    foreach (field; WalkFields (field)) {
        switch (field.name) {
            case "e"      : add_sub_tree (doc,t,field); break; // add e
            case "switch" : set_switch   (doc,t,field); break; // set field
            default       : set_field    (doc,t,field); break; // set field
        }
    }
}


auto
new_child_e (Doc* doc, TString[] values) {
    // sub e
    // find parent e  in tree  from last e
    //   create sub e
    //   add classes

    auto t = doc.new_e ();
    E*   e = &t.e;

    .e.add_klass (e, doc.find_klass_or_create ("e"));

    // klasses
    foreach (ts; values)
        switch (ts.type) {
            case TString.Type.name   : 
            case TString.Type.string : 
                .e.add_klass (e, doc.find_klass_or_create (ts.s));
                break;
            default:
        }

    return t;
}


auto
evaluate_switch_cond (Doc* doc, TString[] cond) {
    // 'shell_command.sh -with -args'
    // "double-quoted string"
    // klass.field
    // strings a b c
    return extract_quoted (doc,cond);
}


ETree*
clone_tree (ETree* t) {
    ETree* cloned;

    //final
    //switch (t.type) {
    //    case Uni.Type.doc     : cloned = new UTree (Uni (t.doc.clone  )); break;
    //    case Uni.Type.e       : cloned = new UTree (Uni (t.e.clone    )); break;
    //    case Uni.Type.klass   : cloned = new UTree (Uni (t.klass.clone)); break;
    //    case Uni.Type.field   : cloned = new UTree (Uni (t.field.clone)); break;
    //    case Uni.Type.switch_ : cloned = new UTree (Uni (t.switch_.clone)); break;
    //    case Uni.Type.case_   : cloned = new UTree (Uni (t.case_.clone)); break;
    //}

    return cloned;
}


TString[]
extract_quoted (Doc* doc, TString[] values) {
    TString[] vs;
    vs.reserve (values.length);
    foreach (v; values) 
        if (v.type == TString.Type.bquoted) 
            vs ~= TString (TString.Type.string, extract_value (doc,v.s));
        else
            vs ~= v;

    return vs;
}

//void
//_on_start (Doc* doc, E* e) {
//    foreach (_on; e.on)
//        if (_on.event == "start")
//            exec_action (doc, _on.action);
//}


alias FONTPTR = TTF_Font*;
static
FONTPTR[string] global_fonts;
static
FONTPTR default_ptr;

void
load_fonts (Doc* doc) {
    auto default_file = DEFAULT_FONT_FILE;
    auto default_size = DEFAULT_FONT_SIZE;
    if (default_ptr is null)
        default_ptr  = open_font (default_file,default_size);

    foreach (t; WalkTree (doc)) {
        if (t.e.content.text.s.length) {
            string  font_file = t.e.content.text.font.file;
            ubyte   font_size = t.e.content.text.font.size;
            FONTPTR font_ptr  = t.e.content.text.font.ptr;
            FONTPTR* _ptr = font_file in global_fonts;

            if (font_file.length >= 1) {
                if (_ptr is null || font_ptr != *_ptr) {
                    auto ptr = open_font (font_file,font_size);
                    if (ptr is null)
                        throw new Exception ("open_font");

                    global_fonts[font_file] = ptr;
                    t.e.content.text.font.ptr = ptr;
                }
            }
        }
    }

    foreach (t; WalkTree (doc))
        if (t.e.content.text.s.length) {
            if (t.e.content.text.font.file.length)
                t.e.content.text.font.ptr = global_fonts[t.e.content.text.font.file];
            else
                t.e.content.text.font.ptr = default_ptr;
        }
}

void
load_colors (Doc* doc) {
    // after load all classes, because able color 'class.field'
}

void
load_childs (Doc* doc) {
    foreach (ETree* t; WalkTree (doc))
        final
        switch (t.e.childs_src.type) {
            case E.ChildsSrc.Type.none : break;
            case E.ChildsSrc.Type.cmd  : load_childs_cmd (doc,t); break;
            case E.ChildsSrc.Type.fs   : break;
            case E.ChildsSrc.Type.csv  : break;
        }
}

void
load_childs_cmd (Doc* doc, ETree* t) {
    auto cmd = t.e.childs_src.cmd.command.s;
    auto dlm = t.e.childs_src.cmd.delimiter.s;
    auto skp = t.e.childs_src.cmd.skip;

    if (cmd.length) {
        auto converted = extract_class_field_value (doc,cmd);
        auto ret = executeShell (converted);
        writeln ("RET: ", ret);
        
        load_childs_add_lines:
        foreach (line; ret.output.splitLines) {
            if (skp > 0) {
                skp--;
                continue;
            }

            auto splits = line.split (dlm);
            TString[] values;
            foreach (s; splits) {
                values ~= TString (TString.Type.string,s);
            }

            // map
            //   to template
            auto tpl_klass = t.e.childs_src.tpl.klass;
            auto tpl_src   = t.e.childs_src.tpl.src;
            auto tpl_dst   = t.e.childs_src.tpl.dst;

            // tpl
            auto kls = find_klass (doc,tpl_klass);
            if (kls !is null) {
                ETree*[] e_line;

                load_childs_add_fields:
                foreach (field; WalkFields (kls)) {
                    if (field.name == "e") {
                        auto _t = doc.new_child_e (field.values);
                        t.add_child (_t);
                        e_line ~= _t;

                        //
                        apply_klasses (doc,_t);

                        // set text
                        foreach (_kls; _t.e.klasses)
                            _kls.set (_kls,doc,_t,"text",values);

                        // images
                        if (_t.e.content.image.src.length)
                            load_e_image (&_t.e);

                        // fonts
                        load_fonts (doc);

                        // text
                        if (_t.e.content.text.s.length)
                            load_e_text (&_t.e);

                        // size
                        update_size (doc,_t); // recursive

                        // pos
                        update_pos (doc,_t);

                        // limit height
                        if (_t.e.pos.y > t.e.pos.y + t.e.size.h)
                            break load_childs_add_lines;
                    }
                }

                // set fields
                //foreach (i; tpl_src) {
                //    auto field_name = tpl_dst[i];
                //    auto _t = e_line[i];
                //    foreach (_kls; _t.e.klasses)
                //        _kls.set (_kls,doc,_t,field_name,values);
                //}
            }
        }
    }
}

void
load_images (Doc* doc) {
    foreach (ETree* t; WalkTree (doc))
        if (t.e.content.image.src.length)
            load_e_image (&t.e);
}

alias IMGPTR = SDL_Surface*;
static
IMGPTR[string] global_images;

void
load_e_image (E* e) {
    string img_file = e.content.image.src;
    IMGPTR* ptr = img_file in global_images;

    if (ptr is null || e.content.image.ptr != *ptr) {
        IMGPTR img_surface;
        if (ptr is null) {
            img_surface = IMG_Load (img_file.toStringz);
            if (img_surface is null)
                throw new IMGException ("IMG_Load");
            global_images[img_file] = img_surface;
        }
        else {
            img_surface = *ptr;
        }

        e.content.image.ptr = img_surface;
        e.content.image.size = Size (
                cast(ushort)img_surface.w,
                cast(ushort)img_surface.h
            );
    }
}

void
load_texts (Doc* doc) {
    foreach (t; WalkTree (doc))
        if (t.e.content.text.s.length)
            load_e_text (&t.e);
}

void
load_e_text (E* e) {
    e.content.text.rects.length = 0;
    e.content.text.rects.reserve (e.content.text.s.length);

    int w, h, max_h;
    X _x = 0;
    Y _y = 0;

    foreach (dchar c; e.content.text.s) {
        auto ret = TTF_SizeUTF8 (e.content.text.font.ptr, c.to!string.toStringz, &w, &h);

        e.content.text.rects ~= E.Content.Text.TextRect (
            Pos  (_x,_y), 
            Size (w.to!W,h.to!H), 
            c.to!string
        );

        _x += w;
        max_h = max (max_h,h);
    }

    e.content.text.size.w = _x;
    e.content.text.size.h = max_h.to!H;
}

void
update_text_size (Doc* doc) {
    //foreach (ETree* t; WalkTree (doc.tree))
    //    if (t.e.content.text.s.length)
    //        update_e_text_size (t.e);
}

//void
//update_e_text_size (E* e) {
//    foreach (ref rec; e.content.text.rects)
//        rec.pos
//}

void
update_sizes (Doc* doc) {
    update_size (doc,doc.tree); // recursive
}

void
update_poses (Doc* doc) {
    foreach (ETree* t; WalkTree (doc))
        update_pos (doc,t);
}

void
dump_sizes (Doc* doc) {
    foreach (ETree* t; WalkChilds (doc.tree))
        dump_size (doc,t); // recursive
}

void
dump_size (Doc* doc, ETree* t, int level=0) {
    E* e = &t.e;

    for (auto i=0; i<level; i++) write ("  ");
    writeln (*e);

    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  pos                 : ", e.pos);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  size                : ", e.size);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  content.size        : ", e.content.size);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  size_w_type         : ", e.size_w_type);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  content.size_w_type : ", e.content.size_w_type);

    // recursive
    foreach (tc; WalkChilds (t))
        dump_size (doc,tc,level+1);
}



// e.size       <--
//   fixed         |
//   content       |
//   parent        |
//   content.size -   <--
//     e                 |
//     fixed             |
//     image             |
//     text              |
//     childs            |
//     max               |
//     childs.size    ---
//       ...             |   [e..]
//     image.size     ---
//       fixed           |
//       image           |
//       text            |
//       content         |
//     text.size      ---
//       fixed
//       text
//       image
//       content
void
update_size (Doc* doc, ETree* t) {
    E* e = &t.e;

    final
    switch (e.size_w_type) {
        case E.SizeType.fixed   : e_size_w_fixed   (doc,t); break;
        case E.SizeType.content : e_size_w_content (doc,t); break;
        case E.SizeType.parent  : e_size_w_parent  (doc,t); break;
        case E.SizeType.window  : e_size_w_window  (doc,t); break;
        case E.SizeType.max     : e_size_w_max     (doc,t); break;
    }

    final
    switch (e.size_h_type) {
        case E.SizeType.fixed   : e_size_h_fixed   (doc,t); break;
        case E.SizeType.content : e_size_h_content (doc,t); break;
        case E.SizeType.parent  : e_size_h_parent  (doc,t); break;
        case E.SizeType.window  : e_size_h_window  (doc,t); break;
        case E.SizeType.max     : e_size_h_max     (doc,t); break;
    }

    // recursive
    foreach (_t; WalkChilds (t))
        update_size (doc,_t);

    // fix size`s
    e_fix_size_w (doc,t);
}

void
e_fix_size_w (Doc* doc, ETree* t) {
    W parent_w;
    W other_w;
    size_t max_cnt;

    // total
    foreach (_t; WalkChilds (t)) {
        if (_t.e.size_w_type == E.SizeType.max)
            max_cnt ++;
        else
            other_w += _t.e.size.w;
    }

    // has max
    if (max_cnt >= 1) {
        // divide
        assert (t.parent !is null);
        auto total_w = t.e.content.size.w;

        auto one_max_w = ((total_w - other_w) / max_cnt).to!W;
        foreach (_t; WalkChilds (t)) {
            if (_t.e.size_w_type == E.SizeType.max)  {
                _t.e.size.w = one_max_w;
                _t.e.content.size.w = (-_t.e.borders.l.w - _t.e.pad.l + _t.e.size.w - _t.e.borders.r.w - _t.e.pad.r).to!W;
                //writeln ("XXX: ", _t.e, ": ", one_max_w);
                //writeln ("   : ", max_cnt);
                //writeln ("   : ", total_w);
                //writeln ("   : ", other_w);
                //writeln ("   : ", one_max_w); // 456

                // recursive update childs
                foreach (__t; WalkChilds (_t))
                    update_size (doc,__t);
            }
        }
    }
}

void
e_size_w_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    //e.size.w = e.size.w;
    if ((-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r) > 0)
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    else
        e.content.size.w = 0;
}

void
e_size_w_content (Doc* doc, ETree* t) {
    E* e = &t.e;
    e_content_size_w (doc,t);
    update_pos (doc,t);
    e.size.w = (e.borders.l.w + e.pad.l + e.content.size.w + e.pad.r + e.borders.r.w).to!W;
}

void
e_size_w_parent (Doc* doc, ETree* t) {
    E* e = &t.e;
    if (t.parent !is null) {
        e.size.w = t.parent.e.content.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
    else
    if (t.parent is null) {
        e.size.w = doc.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
}

void
e_size_w_window (Doc* doc, ETree* t) {
    E* e = &t.e;
    if (doc.window !is null) {
        e.size.w = doc.window.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
    else {
        e.size.w = DEFAULT_WINDOW_W;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
}

void
e_size_w_max (Doc* doc, ETree* t) {
    E* e = &t.e;

    //e.size.w = 0;
    //e.content.size.w = 0;
    //W all_left;
    //foreach (_t; WalkLeft (t))
    //    all_left += _t.e.size.w;

    //if (t.parent.e.content.size.w > all_left) {
    //    e.size.w = (t.parent.e.content.size.w - all_left).to!W;
    //    e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    //}
    //else {
    //    e.size.w = 0;
    //    e.content.size.w = 0;
    //}
}

void
e_size_h_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    //e.size.h = e.size.h;
    if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
        e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
    else
        e.content.size.h = 0;
}

void
e_size_h_content (Doc* doc, ETree* t) {
    E* e = &t.e;
    e_content_size_h (doc,t);
    update_pos (doc,t);
    e.size.h = (e.borders.t.w + e.pad.t + e.content.size.h + e.pad.b + e.borders.b.w).to!H;
}

void
e_size_h_parent (Doc* doc, ETree* t) {
    E* e = &t.e;
    if (t.parent !is null) {
        e.size.h = t.parent.e.content.size.h;
        if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
            e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
        else
            e.content.size.h = 0;
    }
    else
    if (t.parent is null) {
        e.size.h = doc.size.h;
        if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
            e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
        else
            e.content.size.h = 0;
    }
}

void
e_size_h_window (Doc* doc, ETree* t) {
    E* e = &t.e;
    if (doc.window !is null) {
        e.size.h = doc.window.size.h;
        e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
    }
    else {
        e.size.h = DEFAULT_WINDOW_H;
        e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
    }
}

void
e_size_h_max (Doc* doc, ETree* t) {
    E* e = &t.e;
    // e.size.h = 
    // e.content.size.h = ;
}

void
e_content_size_w (Doc* doc, ETree* t) {
    E* e = &t.e;

    final
    switch (e.content.size_w_type) {
        case E.Content.SizeType.e      : e_content_size_w_e      (doc,t); break;
        case E.Content.SizeType.fixed  : e_content_size_w_fixed  (doc,t); break;
        case E.Content.SizeType.image  : e_content_size_w_image  (doc,t); break;
        case E.Content.SizeType.text   : e_content_size_w_text   (doc,t); break;
        case E.Content.SizeType.childs : e_content_size_w_childs (doc,t); break;
        case E.Content.SizeType.max    : e_content_size_w_max    (doc,t); break;
    }
}

void
e_content_size_w_e (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.w = e.size.w;
}

void
e_content_size_w_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    //e.content.size.w = e.content.size.w;
}

void
e_content_size_w_image (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.w = e.content.image.size.w;
}

void
e_content_size_w_text (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.w = e.content.text.size.w;
}

void
e_content_size_w_childs (Doc* doc, ETree* t) {
    E* e = &t.e;
    e_content_childs_size (doc,t);
    e.content.size.w = e.content.childs_size.w;
}

void
e_content_childs_size (Doc* doc, ETree* t) {
    E* e = &t.e;

    Size max_sz;
    foreach (tc; WalkChilds (t)) {
        update_size (doc,tc);
        max_sz.w = max (max_sz.w, tc.e.pos.x + tc.e.size.w).to!W;
        max_sz.h = max (max_sz.h, tc.e.pos.y + tc.e.size.h).to!H;
    }

    if (max_sz.w > e.content.pos.x)
        e.content.childs_size.w = (max_sz.w - e.content.pos.x).to!W;
    else
        e.content.childs_size.w = 0;

    if (max_sz.h > e.content.pos.y)
        e.content.childs_size.h = (max_sz.h - e.content.pos.y).to!H;
    else
        e.content.childs_size.h = 0;
}



void
e_content_size_w_max (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.w = max (e.content.image.size.w, e.content.text.size.w);
}

void
e_content_size_h (Doc* doc, ETree* t) {
    E* e = &t.e;

    final
    switch (e.content.size_h_type) {
        case E.Content.SizeType.e      : e_content_size_h_e      (doc,t); break;
        case E.Content.SizeType.fixed  : e_content_size_h_fixed  (doc,t); break;
        case E.Content.SizeType.image  : e_content_size_h_image  (doc,t); break;
        case E.Content.SizeType.text   : e_content_size_h_text   (doc,t); break;
        case E.Content.SizeType.childs : e_content_size_h_childs (doc,t); break;
        case E.Content.SizeType.max    : e_content_size_h_max    (doc,t); break;
    }
}

void
e_content_size_h_e (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.h = e.size.h;
}

void
e_content_size_h_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    //e.content.size.w = e.content.size.w;
}

void
e_content_size_h_image (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.h = e.content.image.size.h;
}

void
e_content_size_h_text (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.h = e.content.text.size.h;
}

void
e_content_size_h_childs (Doc* doc, ETree* t) {
    E* e = &t.e;
    e_content_childs_size (doc,t);
    e.content.size.h = e.content.childs_size.h;
}

void
e_content_size_h_max (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.size.h = max (e.content.image.size.h, e.content.text.size.h);
}

void
e_content_image_size_w (Doc* doc, ETree* t) {
    E* e = &t.e;

    final
    switch (e.content.image.size_w_type) {
        case E.Content.Image.SizeType.fixed   : e_content_image_size_w_fixed   (doc,t); break;
        case E.Content.Image.SizeType.image   : e_content_image_size_w_image   (doc,t); break;
        case E.Content.Image.SizeType.text    : e_content_image_size_w_text    (doc,t); break;
        case E.Content.Image.SizeType.content : e_content_image_size_w_content (doc,t); break;
    }
}

void 
e_content_image_size_w_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.image.size.w = e.content.image.size.w;
}

void 
e_content_image_size_w_image (Doc* doc, ETree* t) {
    E* e = &t.e;
    if (e.content.image.ptr !is null) {
        auto img_surface = e.content.image.ptr;
        e.content.image.size.w = cast(ushort)img_surface.w;
    }
    else {
        //e.cached.content_image_size = e.cached.content_image_size;
        assert (0, "Image ptr is null");
    }
}

void 
e_content_image_size_w_text (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.image.size.w = e.content.text.size.w;
}

void 
e_content_image_size_w_content (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.image.size.w = e.content.size.w;
}

void
e_content_image_size_h (Doc* doc, ETree* t) {
    E* e = &t.e;

    final
    switch (e.content.image.size_h_type) {
        case E.Content.Image.SizeType.fixed   : e_content_image_size_h_fixed   (doc,t); break;
        case E.Content.Image.SizeType.image   : e_content_image_size_h_image   (doc,t); break;
        case E.Content.Image.SizeType.text    : e_content_image_size_h_text    (doc,t); break;
        case E.Content.Image.SizeType.content : e_content_image_size_h_content (doc,t); break;
    }
}

void 
e_content_image_size_h_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.image.size.h = e.content.image.size.h;
}

void 
e_content_image_size_h_image (Doc* doc, ETree* t) {
    E* e = &t.e;
    if (e.content.image.ptr !is null) {
        auto img_surface = e.content.image.ptr;
        e.content.image.size.h = cast(ushort)img_surface.h;
    }
    else {
        //e.cached.content_image_size = e.cached.content_image_size;
        assert (0, "Image ptr is null");
    }
}

void 
e_content_image_size_h_text (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.image.size.h = e.content.text.size.h;
}

void 
e_content_image_size_h_content (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.image.size.h = e.content.size.h;
}


void
e_content_text_size_w (Doc* doc, ETree* t) {
    E* e = &t.e;

    final
    switch (e.content.text.size_w_type) {
        case E.Content.Text.SizeType.fixed   : e_content_text_size_w_fixed   (doc,t); break;
        case E.Content.Text.SizeType.text    : e_content_text_size_w_text    (doc,t); break;
        case E.Content.Text.SizeType.image   : e_content_text_size_w_image   (doc,t); break;
        case E.Content.Text.SizeType.content : e_content_text_size_w_content (doc,t); break;
    }
}

void 
e_content_text_size_w_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_w_image (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.text.size.w = e.content.image.size.w;
}

void 
e_content_text_size_w_text (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.text.size.w = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).w;
}

void 
e_content_text_size_w_content (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.text.size.w = e.content.size.w;
}

void
e_content_text_size_h (Doc* doc, ETree* t) {
    E* e = &t.e;

    final
    switch (e.content.text.size_h_type) {
        case E.Content.Text.SizeType.fixed   : e_content_text_size_h_fixed   (doc,t); break;
        case E.Content.Text.SizeType.text    : e_content_text_size_h_text    (doc,t); break;
        case E.Content.Text.SizeType.image   : e_content_text_size_h_image   (doc,t); break;
        case E.Content.Text.SizeType.content : e_content_text_size_h_content (doc,t); break;
    }
}

void 
e_content_text_size_h_fixed (Doc* doc, ETree* t) {
    E* e = &t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_h_image (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.text.size.h = e.content.image.size.h;
}

void 
e_content_text_size_h_text (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.text.size.h = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).h;
}

void 
e_content_text_size_h_content (Doc* doc, ETree* t) {
    E* e = &t.e;
    e.content.text.size.h = e.content.size.h;
}




void
update_pos (Doc* doc, ETree* t) {
    E* e = &t.e;

    //
    final
    switch (e.pos_type) {
        case E.PosType.t9      : pos_type_t9   (t); break;
        case E.PosType.t3      : pos_type_t3   (t); break;
        case E.PosType.grid    : pos_type_grid (t); break;
        case E.PosType.vbox    : pos_type_vbox (t); break;
        case E.PosType.hbox    : pos_type_hbox (t); break;
        case E.PosType.percent : pos_type_percent (t); break;
        case E.PosType.none    : pos_type_none (t); break;
   }

    //e.pos         = Pos (0,0);
    e.borders.pos = e.pos;
    e.pad.pos     = e.borders.pos + Pos (e.borders.l.w, e.borders.t.w);
    e.content.pos = e.pad.pos + Pos (e.pad.l, e.pad.t);
}

//void
//update_text_rects_pos (E* e) {
//    foreach (ref rec; e.content.text.rects) {
//        if (rec.s.length)
//            rec.pos += e.pos;
//    }
//}


void
pos_type_t9 (ETree* t) {
    // 1 2 3 
    // 8 9 4 
    // 7 6 5 
    E* e = &t.e;

    if (e.pos_group == 1) {
        ETree* prev = find_last_in_group (t, e.pos_group);
        if (prev !is null) {
            if (e.pos_dir == E.PosDir.r) {
                e.pos.x = (prev.e.pos.x + prev.e.size.w).to!X;
                e.pos.y = prev.e.pos.y;
            }
        }
        else {
            X parent_x;
            Y parent_y;
            if (t.parent !is null) {
                parent_x = t.parent.e.content.pos.x;
                parent_y = t.parent.e.content.pos.y;
            }

            e.pos.x = parent_x;
            e.pos.y = parent_y;
        }
    }
    if (e.pos_group == 9) {
        // Pass 1
        //   pos = Pos (0,0)
        //   _x += w
        //   _w += w
        //   _h = max (_h,h)
        //   pos = Pos (_x,0)
        // Pass 2
        //   dx = (content.w - _w) / 2
        //   dy = (content.h - _h) / 2
        //   each (c; WalkLeft)
        //     c.pos.x += dx
        //     c.pos.y += dy
    }
}

void
pos_type_t3 (ETree* t) {
    // 1 2 3 
    E* e = &t.e;

    if (e.pos_group == 1) {
        ETree* prev = find_last_in_group (t, e.pos_group);
        if (prev !is null) {
            final
            switch (e.pos_dir) {
                case E.PosDir.r:
                    e.pos.x = (prev.e.pos.x + prev.e.size.w).to!X;
                    e.pos.y = prev.e.pos.y;
                    break;
                case E.PosDir.l: break;
                case E.PosDir.t: break;
                case E.PosDir.b: break;
            }
        }
        else {
            if (t.parent !is null) {
                e.pos.x = t.parent.e.content.pos.x;
                e.pos.y = t.parent.e.content.pos.y;
            }
            else {
                e.pos.x = 0;
                e.pos.y = 0;
            }
        }
    }
    else
    if (e.pos_group == 2) {
        //
    }
    else
    if (e.pos_group == 3) {
        final
        switch (e.pos_dir) {
            case E.PosDir.r:
                if (t.parent !is null) {
                    auto parent_e = t.parent.e;
                    e.pos.x = 
                        (parent_e.content.pos.x + parent_e.content.size.w > e.size.w) ? 
                            (parent_e.content.pos.x + parent_e.content.size.w - e.size.w).to!X :
                            0; 
                    e.pos.y = parent_e.content.pos.y;
                }
                else {
                    e.pos.x = 0;
                    e.pos.y = 0;
                }
                // update prev posed
                for (ETree* _t = find_last_in_group (t, e.pos_group); 
                    _t !is null; 
                    _t = find_last_in_group (_t, e.pos_group)) 
                {
                    _t.e.pos.x         -= e.size.w;
                    _t.e.borders.pos.x -= e.size.w;
                    _t.e.pad.pos.x     -= e.size.w;
                    _t.e.content.pos.x -= e.size.w;
                }
                break;
            case E.PosDir.l: break;
            case E.PosDir.t: break;
            case E.PosDir.b: break;
        }
    }
}

void
pos_type_grid (ETree* t) {
    // e e e
    // e e e
    // e e e
}

void
pos_type_vbox (ETree* t) {
    // e
    // e 
    // e
    E* e = &t.e;

    ETree* prev = find_last_with_type (t, e.pos_type);
    if (prev !is null) {
        final
        switch (e.pos_dir) {
            case E.PosDir.r: break;
            case E.PosDir.l: break;
            case E.PosDir.b: 
                auto prev_pos  = e_pos  (&prev.e);
                auto prev_size = e_size (&prev.e);
                e.pos.x = prev_pos.x;
                e.pos.y = (prev_pos.y + prev_size.h).to!Y;
                break;
            case E.PosDir.t: break;
        }
    }
    else {
        if (t.parent !is null) {
            auto parent_content_pos = content_pos (&t.parent.e);
            e.pos.x = parent_content_pos.x;
            e.pos.y = parent_content_pos.y;
        }
        else {
            e.pos.x = 0;
            e.pos.y = 0;
        }
    }
}

void
pos_type_hbox (ETree* t) {
    // e e e
    E* e = &t.e;

    ETree* prev = find_last_with_type (t, e.pos_type);
    if (prev !is null) {
        final
        switch (e.pos_dir) {
            case E.PosDir.r:
                auto prev_pos  = e_pos  (&prev.e);
                auto prev_size = e_size (&prev.e);
                e.pos.x = (prev_pos.x + prev_size.w).to!X;
                e.pos.y =  prev_pos.y;
                break;
            case E.PosDir.l: break;
            case E.PosDir.b: break;
            case E.PosDir.t: break;
        }
    }
    else {
        if (t.parent !is null) {
            auto parent_content_pos = content_pos (&t.parent.e);
            //writeln ("parent_content_pos: ", parent_content_pos);
            e.pos.x = parent_content_pos.x;
            e.pos.y = parent_content_pos.y;
        }
        else {
            e.pos.x = 0;
            e.pos.y = 0;
        }
    }
}

void
pos_type_percent (ETree* t) {
    // e e e
    E* e = &t.e;
    if (t.parent !is null) {
        auto parent_content_pos = content_pos (&t.parent.e);
        auto parent_w = t.parent.e.size.w;
        auto percent = e.pos_percent;
        e.pos.x = (parent_content_pos.x + (cast(float)parent_w * percent / 100)).to!X;
        e.pos.y = parent_content_pos.y;
    }
    else {
        e.pos.x = 0;
        e.pos.y = 0;
    }
}

void
pos_type_none (ETree* t) {
    E* e = &t.e;
    e.pos = Pos (0,0);
}

ETree*
find_last_in_group (ETree* t, ubyte pos_group) {
    foreach (ETree* _t; WalkLeft (t))
        if (_t.e.pos_group == pos_group)
            return _t;

    return null;
}


ETree*
find_last_with_type (ETree* t, E.PosType pos_type) {
    foreach (ETree* _t; WalkLeft (t))
        if (_t.e.pos_type == pos_type)
            return _t;

    return null;
}


void
go_on_event (Doc* doc, ETree* t, string user_event_name, string[string] env=null) {
    foreach (_on; t.e.on)
        if (_on.event == user_event_name) // start, click
            exec_action (doc, _on.action, env);
}

void
go_event_action (Doc* doc, E* e, TString[] action, string[string] env=null) {
    exec_action (doc,action,env);
}

void
exec_action (Doc* doc, TString[] action, string[string] env=null) {
    import std.process;
    
    if (action.length) {
        writeln ("action: ", action);
        TString[] cmd = doc_get_klass_field_value (doc,action[0].s);
        if (cmd.length)
            goto exec;
        else
            cmd = action;
        
        //
    exec:
        if (cmd.length) {
            //
            string[] s_cmd;
            foreach (s; cmd)
                if (s.type == TString.Type.string)
                    s_cmd ~= s.s;
            // raw exec
            writeln ("  exec: ", s_cmd, " ", env);
            if (env !is null) 
                auto pid = spawnProcess (s_cmd,env);
            else
                auto pid = spawnProcess (s_cmd);
        }    
    }
}

TString[] 
doc_get_klass_field_value (Doc* doc, string s) {
    auto dot = s.indexOf ('.');
    if (dot != -1) {
        // class field
        auto klass_name  = s[0..dot];
        auto klass_field = s[dot+1..$];

        auto kls_t = doc.find_klass (klass_name);
        if (kls_t !is null) {
            auto fret = find_field (kls_t, klass_field);
            if (fret)
                return fret.values;// OK
        }
    }

    return [];
}

string
extract_value (Doc* doc, string bquoted) {
    //writeln ("extract_value: ", bquoted);

    auto stripped  = bquoted.strip ("`");
    auto converted = extract_class_field_value (doc,stripped);
    //writeln ("converted: ", converted);
    auto ret = executeShell (converted);  // (int status, string output)

    //writeln (ret.status);
    //writeln ("ret.output: ", ret.output);

   return ret.output.stripRight ();
}


string
extract_class_field_value (Doc* doc, string s) {
    TString[] cmd = doc_get_klass_field_value (doc,s);
    if (cmd.length)
        return cmd.join (" ");
    else
        return s;
}

//status
//  ? audtool playback-status
//    plaing
//      fg green
//    paused
//      fg yellow
//    stopped
//      fg red

void
on_click (Event* ev) {
    auto click_ev = cast (ClickUserEvent*) ev;
    _on_click (
        ev,
        click_ev.down_pos, 
        click_ev.up_pos, 
    );
}

void
_on_click (Event* ev, Pos down_pos, Pos up_pos) {
    //
    ETree* deepest;
    foreach (ETree* _e_tree; WalkChilds (ev.doc.tree)) {
        send_click_in_deep (
            ev, 
            _e_tree, 
            down_pos,
            up_pos,
            deepest);

            // focused
            //remove_class_from_all (_e_tree,"focused");
            //if (deepest !is null)
                //deepest.e.add_class (ev.doc,"focused");
    }

    //
    ev.doc.update (ev.doc);
    writeln ("deepest: ", *deepest);
    writeln ("deepest: ", deepest.e.content.image);
    if (deepest !is null)
        deepest.redraw ();
}

bool
pos_in_rect (Pos pos, Pos rect_pos, Size rect_size) {
    if (rect_pos.x <= pos.x && rect_pos.x + rect_size.w > pos.x)
    if (rect_pos.y <= pos.y && rect_pos.y + rect_size.h > pos.y)
        return true;

    return false;
}


void
dump_klasses (Doc* doc) {
    foreach (kls; doc.klasses) {
        writeln (*kls);
    }
}


int
event (Doc* doc, Event* ev) {
    // event
    //   KEYS  --> focused
    //   CLICK --> if in x,y e.rect -> send -> in deep
    //   MOUSE --> if in x,y e.rect -> send -> in deep
    //   *     --> all
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("DOC.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                ETree* deepest;
                send_mouse_event_in_deep (ev, ev.doc.tree, Pos (ev.button.x.to!X,ev.button.y.to!Y), deepest);
                //ev.doc.update (ev.doc);
                //redraw_window (ev.app_window);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED) {
                ETree* deepest;
                send_mouse_event_in_deep (ev, ev.doc.tree, Pos (ev.button.x.to!X,ev.button.y.to!Y), deepest);
                //remove_class_from_all (doc,"button-pressed");
                //ev.doc.update (ev.doc);
                //redraw_window (ev.app_window);
            }
            break;
        case SDL_KEYDOWN: break;// SDL_KeyboardEvent
        case SDL_KEYUP: break;
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.start : send_event_in_tree (ev); break;
                case USER_EVENT.click : on_click (ev); break;
                default:
            }
            break;
        case SDL_QUIT:
            return 1;
            break;
        default:
    }

    return 0;
}

void
update (Doc* doc) {
    time_step ();

    // 0
    if (doc.window !is null)
        doc.size = doc.window.size;
    time_step ();
    // 1
    doc.doc_apply_klasses ();
    time_step ();
    // 2
    doc.load_images ();
    time_step ();
    // 3
    doc.load_fonts ();
    time_step ();
    // 4
    doc.load_colors ();
    time_step ();
    // 5
    doc.load_texts ();
    time_step ();
    // 6
    doc.update_sizes ();
    time_step ();
    // 7
    doc.update_poses ();
    time_step ();
    // 8
    doc.load_childs ();
    time_step ();
    // 9
}

void
time_step (string file_name=__FILE__, size_t line=__LINE__) {
    import core.time;
    static MonoTime last_time;
    auto cur = MonoTime.currTime ();
    auto dur = cur - last_time;
    if (file_name.length != 0)
        writeln (file_name, ": ", line, ": ", dur);
    else
        writeln (dur);
    last_time = cur;
}

void
draw (Doc* doc, SDL_Renderer* renderer, ETree* t) {
    time_step ();

    auto e_tree = 
        (t is null) ? 
            doc.tree : 
            t;

    foreach (_t; WalkTree (e_tree))
        _draw_one (renderer,_t);
    time_step ();
}

void
_draw_one (SDL_Renderer* renderer, ETree* t) {
    foreach (Klass* kls; t.e.klasses) {
        if (kls.draw !is null)
            kls.draw (kls,renderer,t);
    }
    if (t.e.draw !is null)
        t.e.draw (&t.e,renderer);    
}


DocPtr
_dup (DocPtr _this) {
    auto cloned = new Doc ();

    cloned.hotkeys = _this.hotkeys;
    cloned.window  = _this.window;
    cloned.size    = _this.size;
    cloned.focused = _this.focused;
    cloned.event   = _this.event;
    cloned.update  = _this.update;
    cloned.draw    = _this.draw;

    return cloned;
}


auto
max (A,B) (A a, B b) {
    if (a >= b)
        return a;
    else
        return b;
}

auto
min (A,B) (A a, B b) {
    if (a <= b)
        return a;
    else
        return b;
}
