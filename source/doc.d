module doc;

import std.conv;
import std.string;
import std.string : startsWith;
import std.string : fromStringz, toStringz; 
import std.algorithm.searching : canFind;
import std.algorithm.searching : countUntil;
import std.algorithm.searching : find;
import bindbc.sdl;
import bindbc.sdl.image;
import bindbc.sdl.ttf;
import tstring;
import utree;
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
import klasses.e : extract_value;
import field : Field;
import pix : redraw;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;

alias DOC_EVENT_FN  = int  function (UTree* t, Event* ev);
alias DOC_UPDATE_FN = void function (UTree* t);
alias DOC_DRAW_FN   = void function (UTree* t,SDL_Renderer* renderer, UTree* t);

struct
Doc {
    Klass*  hotkeys;
    Window* window;
    Size    size = Size (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H);
    UTree*  focused;

    DOC_EVENT_FN  event  = &.event;
    DOC_UPDATE_FN update = &.update;
    DOC_DRAW_FN   draw   = &.draw;

    Doc*
    clone () {
        return new Doc ();
    }
}

UTree*
find_e_at_pos (UTree* doc_t, Pos pos) {
    UTree* found;

    bool 
    valid_e (UTree* t) {
        return (pos_in_rect (pos, t.e.pos, t.e.size));
    }

    import utree : WalkChilds;
    import utree : FindDeepest;
    foreach (_e_tree; WalkChilds (doc_t)) {
        if (_e_tree.uni.type == Uni.Type.e)
            foreach (t; FindDeepest (_e_tree,&valid_e)) {
                found = t;
            }
    }

    return found;
}

UTree*[]
klasses (UTree* doc_t) {
    UTree*[] klasses;

    foreach (_t; utree.WalkKlasses (doc_t))
        klasses ~= _t;

    return klasses;
}

UTree*
find_klass_or_create (UTree* doc_t, string s) {
    auto t = find_klass (doc_t,s);
    if (t is null)
        t = create_klass (doc_t,s);
    return t;
}

UTree*
find_klass (UTree* doc_t, string s) {
    foreach (kls_t; WalkKlasses (doc_t))
        if (kls_t.klass.name == s)
            return kls_t;

    return null;
}

UTree*
find_field (UTree* kls_t, string s) {
    foreach (field_t; WalkFields (kls_t))
        if (field_t.field.name == s)
            return field_t;

    return null;
}

UTree*
create_klass (UTree* doc_t, string s) {
    UTree* kls_t = new UTree (Uni (Klass (s)));
    doc_t.add_child (kls_t);
    return kls_t;
}


void
send_event_in_deep (Event* ev, UTree* t, Pos pos, SDL_Window* window, SDL_Renderer* renderer) {
    bool 
    valid_e (UTree* t) {
        return (
            (t.uni.type == Uni.type.e) && 
            pos_in_rect (pos, t.e.pos, t.e.size)
        );
    }

    // klass event
    foreach (_t; utree.FindDeepest (t,&valid_e)) {
        foreach (kls_t; _t.e.klasses)
            if (kls_t.klass.event !is null)
                kls_t.klass.event (kls_t,ev,_t);
    }
}

void
send_click_in_deep (Event* ev, UTree* t, Pos down_pos, Pos up_pos, ref UTree* deepest) {
    bool 
    valid_e (UTree* t) {
        return (
            (t.uni.type == Uni.Type.e) && 
            pos_in_rect (down_pos, t.e.pos, t.e.size) &&
            pos_in_rect (up_pos,   t.e.pos, t.e.size)
        );
    }

    // klass event
    foreach (_t; FindDeepest (t,&valid_e)) {
        foreach (kls_t; _t.e.klasses)
            if (kls_t.klass.event !is null)
                kls_t.klass.event (kls_t,ev,_t);
        deepest = _t;
    }
}

void
send_mouse_event_in_deep (Event* ev, UTree* t, Pos pos, ref UTree* deepest) {
    bool 
    valid_e (UTree* t) {
        return (
            (t.uni.type == Uni.Type.e) && 
            pos_in_rect (pos, t.e.pos, t.e.size)
        );
    }

    // klass event
    foreach (_e_tree; WalkChilds (t))
        if (_e_tree.uni.type == Uni.Type.e) {

            foreach (_t; FindDeepest (_e_tree,&valid_e)) {
                //writeln (*_t);
                foreach (kls_t; _t.e.klasses)
                    if (kls_t.klass.event !is null)
                        kls_t.klass.event (kls_t,ev,_t);
                deepest = _t;
            }
            
        }
}

void
send_event_in_tree (Event* ev) {
    // klass event
    foreach (_t; WalkE (ev.doc_t)) {
        foreach (kls_t; _t.e.klasses)
            if (kls_t.klass.event !is null)
                kls_t.klass.event (kls_t,ev,_t);
    }
}

void
add_class (E* e, UTree* doc_t, string s) {
    UTree* kls_t = doc_t.find_klass_or_create (s);
    if (!e.klasses.canFind (kls_t))
        e.klasses ~= kls_t;
}

bool
has_class (E* e, UTree* doc_t, string s) {
    UTree* kls_t = doc_t.find_klass (s);
    return (!e.klasses.canFind (kls_t));
}

void
trigger_class (E* e, UTree* doc_t, string s) {
    if (e.has_class (doc_t,"check.pressed"))
        e.remove_class (doc_t,"check.pressed");
    else
        e.add_class (doc_t,"check.pressed");
}


void
remove_class_from_all (UTree* doc_t, string s) {
    UTree* kls_t = doc_t.find_klass (s);
    if (kls_t !is null)
        foreach (t; WalkE (doc_t))
            remove_class (t.e, kls_t);
}

void
remove_class (E* e, UTree* doc_t, string s) {
    auto kls = doc_t.find_klass (s);
    if (kls !is null)
        e.remove_class (kls);
}

void
remove_class (E* e, UTree* kls_t) {
    import std.algorithm.searching : countUntil;
    import std.algorithm : remove;

    auto i = e.klasses.countUntil (kls_t);
    if (i != -1)
        e.klasses = e.klasses.remove (i);
}

void
doc_apply_klasses (UTree* doc_t) {
    foreach (_t; utree.WalkE (doc_t)) 
        apply_klasses (doc_t,_t);
}

void
apply_klasses (UTree* doc_t, UTree* t) {
    E* e = t.uni.e;
    e.on.length = 0;
    global_font_files.length = 0;

    // remove e added from klass
    UTree*[] for_remove;
    foreach (_t; WalkChilds (t))
        if (_t.e.added_from !is null)
            for_remove ~= _t;
    foreach (_t; for_remove)
        t.remove_child (_t);

    // set . each e klass
    foreach (kls_t; e.klasses)
        apply_klass (doc_t,t,kls_t);
}

// WIDGET_APPLY_KLASS_FN
void
apply_klass (UTree* doc_t, UTree* t, UTree* kls_t) {
    E* e = t.uni.e;

    // each field
    // each sub tree
    foreach (_t; utree.WalkFields (kls_t)) {
        switch (_t.uni.type) {
            case Uni.Type.field   : set_field    (doc_t,t,_t); break; // set field
            case Uni.Type.e       : add_sub_tree (doc_t,t,_t); break; // add e
            case Uni.Type.switch_ : set_switch   (doc_t,t,_t); break; // set field
            default:
        }
    }
}

void
set_field (UTree* doc_t, UTree* dest_t, UTree* field_t) {
    auto e = dest_t.uni.e;

    // `command` -> exec command -> output
    auto values = extract_quoted (doc_t,field_t.field.values);

    // klasses set
    foreach (kls_t; e.klasses) {
        if (kls_t.klass.set !is null)
            kls_t.klass.set (kls_t,doc_t,dest_t,field_t.field.name,values);
    }
}

void
add_sub_tree (UTree* doc_t, UTree* dest_t, UTree* source_t) {
    // clone each t
    // add in dest_t
    //auto cloned = clone_tree (source_t);
    //dest_t.add_child (cloned);
}

void
set_switch (UTree* doc_t, UTree* dest_t, UTree* swicth_t) {
    auto cond = swicth_t.uni.switch_.cond;

    auto evaluated = evaluate_switch_cond (doc_t,cond);

    // switch value
    //   case value1
    //     field values
    //   case value2
    //     field values

    // each child case
    foreach (case_t; swicth_t.childs)
        if (case_t.uni.type == Uni.Type.case_)
        if (case_t.uni.case_.values == evaluated)
            set_case (doc_t,dest_t,case_t);
}

void
set_case (UTree* doc_t, UTree* dest_t, UTree* case_t) {
    apply_klass (doc_t,dest_t,case_t);
}

auto
evaluate_switch_cond (UTree* doc_t, TString[] cond) {
    // 'shell_command.sh -with -args'
    // "double-quoted string"
    // klass.field
    // strings a b c
    return extract_quoted (doc_t,cond);
}


UTree*
clone_tree (UTree* t) {
    UTree* cloned;

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
extract_quoted (UTree* doc_t, TString[] values) {
    TString[] vs;
    vs.reserve (values.length);
    foreach (v; values) 
        if (v.type == TString.Type.bquoted) 
            vs ~= TString (TString.Type.string, extract_value (doc_t,v.s));
        else
            vs ~= v;

    return vs;
}

//void
//_on_start (UTree* doc_t, E* e) {
//    foreach (_on; e.on)
//        if (_on.event == "start")
//            exec_action (doc_t, _on.action);
//}


alias PTR = TTF_Font*;
static
PTR[string] global_fonts;
static
PTR default_ptr;

void
load_fonts (UTree* doc_t) {
    auto default_file = DEFAULT_FONT_FILE;
    auto default_size = DEFAULT_FONT_SIZE;
    if (default_ptr is null)
        default_ptr  = open_font (default_file,default_size);

    foreach (t; utree.WalkE (doc_t)) {
        if (t.e.content.text.s.length) {
            string font_file = t.e.content.text.font.file;
            ubyte  font_size = t.e.content.text.font.size;

            if (font_file.length >= 1 && !(font_file in global_fonts)) {
                PTR ptr = open_font (font_file,font_size);
                if (ptr is null)
                    throw new Exception ("open_font");

                global_fonts[font_file] = ptr;
            }
        }
    }

    foreach (t; utree.WalkE (doc_t))
        if (t.e.content.text.s.length) {
            if (t.e.content.text.font.file.length)
                t.e.content.text.font.ptr = global_fonts[t.e.content.text.font.file];
            else
                t.e.content.text.font.ptr = default_ptr;
        }
}

void
load_colors (UTree* doc_t) {
    // after load all classes, because able color 'class.field'
}

void
load_images (UTree* doc_t) {
    foreach (UTree* t; utree.WalkE (doc_t))
        if (t.e.content.image.src.length)
            load_e_image (t.e);
}

alias IMGPTR = SDL_Surface*;
static
IMGPTR[string] global_images;

void
load_e_image (E* e) {
    if (e.content.image.ptr is null) {
        IMGPTR img_surface;
        if (!(e.content.image.src in global_images)) {
            string img_file = e.content.image.src;
            img_surface = IMG_Load (img_file.toStringz);
            if (img_surface is null)
                throw new IMGException ("IMG_Load");
            global_images[img_file] = img_surface;
        }
        else {
            img_surface = global_images[e.content.image.src];
        }

        e.content.image.ptr = img_surface;
        e.content.image.size = Size (
                cast(ushort)img_surface.w,
                cast(ushort)img_surface.h
            );
    }
}

void
load_texts (UTree* doc_t) {
    foreach (t; WalkE (doc_t))
        if (t.e.content.text.s.length)
            load_e_text (t.e);
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
    //foreach (UTree* t; WalkTree (doc.tree))
    //    if (t.e.content.text.s.length)
    //        update_e_text_size (t.e);
}

//void
//update_e_text_size (E* e) {
//    foreach (ref rec; e.content.text.rects)
//        rec.pos
//}

void
update_sizes (UTree* doc_t) {
    foreach (t; WalkE (doc_t))
        update_size (doc_t,t); // recursive
}

void
update_poses (UTree* doc_t) {
    foreach (UTree* _e_tree; WalkChilds (doc_t))
        if (_e_tree.uni.type == Uni.Type.e)
            foreach (UTree* _t; WalkE (_e_tree))
                update_pos (doc_t,_t);
}

void
dump_sizes (UTree* doc_t) {
    foreach (UTree* _e_tree; WalkChilds (doc_t))
        if (_e_tree.uni.type == Uni.Type.e)
            dump_size (doc_t,_e_tree); // recursive
}

void
dump_size (UTree* doc_t, UTree* t, int level=0) {
    E* e = t.e;

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
        dump_size (doc_t,tc,level+1);
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
update_size (UTree* doc_t, UTree* t) {
    E* e = t.e;

    final
    switch (e.size_w_type) {
        case E.SizeType.fixed   : e_size_w_fixed   (doc_t,t); break;
        case E.SizeType.content : e_size_w_content (doc_t,t); break;
        case E.SizeType.parent  : e_size_w_parent  (doc_t,t); break;
        case E.SizeType.window  : e_size_w_window  (doc_t,t); break;
        case E.SizeType.max     : e_size_w_max     (doc_t,t); break;
    }

    final
    switch (e.size_h_type) {
        case E.SizeType.fixed   : e_size_h_fixed   (doc_t,t); break;
        case E.SizeType.content : e_size_h_content (doc_t,t); break;
        case E.SizeType.parent  : e_size_h_parent  (doc_t,t); break;
        case E.SizeType.window  : e_size_h_window  (doc_t,t); break;
        case E.SizeType.max     : e_size_h_max     (doc_t,t); break;
    }

    // recursive
    foreach (_t; WalkChilds (t))
        update_size (doc_t,_t);

    // fix size`s
    e_fix_size_w (doc_t,t);
}

void
e_fix_size_w (UTree* doc_t, UTree* t) {
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
            if (_t.uni.type == Uni.Type.e) 
            if (_t.e.size_w_type == E.SizeType.max)  {
                _t.e.size.w = one_max_w;
                _t.e.content.size.w = (-_t.e.borders.l.w - _t.e.pad.l + _t.e.size.w - _t.e.borders.r.w - _t.e.pad.r).to!W;
                writeln ("XXX: ", *_t.e, ": ", one_max_w);
                writeln ("   : ", max_cnt);
                writeln ("   : ", total_w);
                writeln ("   : ", other_w);
                writeln ("   : ", one_max_w); // 456

                // recursive update childs
                foreach (__t; WalkChilds (_t))
                    if (__t.uni.type == Uni.Type.e) 
                        update_size (doc_t,__t);
            }
        }
    }
}

void
e_size_w_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    //e.size.w = e.size.w;
    if ((-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r) > 0)
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    else
        e.content.size.w = 0;
}

void
e_size_w_content (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e_content_size_w (doc_t,t);
    update_pos (doc_t,t);
    e.size.w = (e.borders.l.w + e.pad.l + e.content.size.w + e.pad.r + e.borders.r.w).to!W;
}

void
e_size_w_parent (UTree* doc_t, UTree* t) {
    auto e = t.e;
    if (t.parent !is null && t.parent.type == Uni.Type.e) {
        e.size.w = t.parent.e.content.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
    else
    if (t.parent !is null && t.parent.type == Uni.Type.doc) {
        e.size.w = doc_t.doc.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
}

void
e_size_w_window (UTree* doc_t, UTree* t) {
    auto e = t.e;
    if (doc_t.doc.window !is null) {
        e.size.w = doc_t.doc.window.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
    else {
        e.size.w = DEFAULT_WINDOW_W;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
}

void
e_size_w_max (UTree* doc_t, UTree* t) {
    auto e = t.e;

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
e_size_h_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    //e.size.h = e.size.h;
    if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
        e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
    else
        e.content.size.h = 0;
}

void
e_size_h_content (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e_content_size_h (doc_t,t);
    update_pos (doc_t,t);
    e.size.h = (e.borders.t.w + e.pad.t + e.content.size.h + e.pad.b + e.borders.b.w).to!H;
}

void
e_size_h_parent (UTree* doc_t, UTree* t) {
    auto e = t.e;
    if (t.parent !is null && t.parent.type == Uni.Type.e) {
        e.size.h = t.parent.e.content.size.h;
        if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
            e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
        else
            e.content.size.h = 0;
    }
    else
    if (t.parent !is null && t.parent.type == Uni.Type.doc) {
        e.size.h = doc_t.doc.size.h;
        if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
            e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
        else
            e.content.size.h = 0;
    }
}

void
e_size_h_window (UTree* doc_t, UTree* t) {
    auto e = t.e;
    if (doc_t.doc.window !is null) {
        e.size.h = doc_t.doc.window.size.h;
        e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
    }
    else {
        e.size.h = DEFAULT_WINDOW_H;
        e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
    }
}

void
e_size_h_max (UTree* doc_t, UTree* t) {
    auto e = t.e;
    // e.size.h = 
    // e.content.size.h = ;
}

void
e_content_size_w (UTree* doc_t, UTree* t) {
    auto e = t.e;

    final
    switch (e.content.size_w_type) {
        case E.Content.SizeType.e      : e_content_size_w_e      (doc_t,t); break;
        case E.Content.SizeType.fixed  : e_content_size_w_fixed  (doc_t,t); break;
        case E.Content.SizeType.image  : e_content_size_w_image  (doc_t,t); break;
        case E.Content.SizeType.text   : e_content_size_w_text   (doc_t,t); break;
        case E.Content.SizeType.childs : e_content_size_w_childs (doc_t,t); break;
        case E.Content.SizeType.max    : e_content_size_w_max    (doc_t,t); break;
    }
}

void
e_content_size_w_e (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.w = e.size.w;
}

void
e_content_size_w_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    //e.content.size.w = e.content.size.w;
}

void
e_content_size_w_image (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.w = e.content.image.size.w;
}

void
e_content_size_w_text (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.w = e.content.text.size.w;
}

void
e_content_size_w_childs (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e_content_childs_size (doc_t,t);
    e.content.size.w = e.content.childs_size.w;
}

void
e_content_childs_size (UTree* doc_t, UTree* t) {
    auto e = t.e;

    Size max_sz;
    foreach (tc; WalkChilds (t)) {
        update_size (doc_t,tc);
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
e_content_size_w_max (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.w = max (e.content.image.size.w, e.content.text.size.w);
}

void
e_content_size_h (UTree* doc_t, UTree* t) {
    auto e = t.e;

    final
    switch (e.content.size_h_type) {
        case E.Content.SizeType.e      : e_content_size_h_e      (doc_t,t); break;
        case E.Content.SizeType.fixed  : e_content_size_h_fixed  (doc_t,t); break;
        case E.Content.SizeType.image  : e_content_size_h_image  (doc_t,t); break;
        case E.Content.SizeType.text   : e_content_size_h_text   (doc_t,t); break;
        case E.Content.SizeType.childs : e_content_size_h_childs (doc_t,t); break;
        case E.Content.SizeType.max    : e_content_size_h_max    (doc_t,t); break;
    }
}

void
e_content_size_h_e (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.h = e.size.h;
}

void
e_content_size_h_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    //e.content.size.w = e.content.size.w;
}

void
e_content_size_h_image (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.h = e.content.image.size.h;
}

void
e_content_size_h_text (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.h = e.content.text.size.h;
}

void
e_content_size_h_childs (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e_content_childs_size (doc_t,t);
    e.content.size.h = e.content.childs_size.h;
}

void
e_content_size_h_max (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.size.h = max (e.content.image.size.h, e.content.text.size.h);
}

void
e_content_image_size_w (UTree* doc_t, UTree* t) {
    auto e = t.e;

    final
    switch (e.content.image.size_w_type) {
        case E.Content.Image.SizeType.fixed   : e_content_image_size_w_fixed   (doc_t,t); break;
        case E.Content.Image.SizeType.image   : e_content_image_size_w_image   (doc_t,t); break;
        case E.Content.Image.SizeType.text    : e_content_image_size_w_text    (doc_t,t); break;
        case E.Content.Image.SizeType.content : e_content_image_size_w_content (doc_t,t); break;
    }
}

void 
e_content_image_size_w_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.image.size.w;
}

void 
e_content_image_size_w_image (UTree* doc_t, UTree* t) {
    auto e = t.e;
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
e_content_image_size_w_text (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.text.size.w;
}

void 
e_content_image_size_w_content (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.size.w;
}

void
e_content_image_size_h (UTree* doc_t, UTree* t) {
    auto e = t.e;

    final
    switch (e.content.image.size_h_type) {
        case E.Content.Image.SizeType.fixed   : e_content_image_size_h_fixed   (doc_t,t); break;
        case E.Content.Image.SizeType.image   : e_content_image_size_h_image   (doc_t,t); break;
        case E.Content.Image.SizeType.text    : e_content_image_size_h_text    (doc_t,t); break;
        case E.Content.Image.SizeType.content : e_content_image_size_h_content (doc_t,t); break;
    }
}

void 
e_content_image_size_h_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.image.size.h;
}

void 
e_content_image_size_h_image (UTree* doc_t, UTree* t) {
    auto e = t.e;
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
e_content_image_size_h_text (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.text.size.h;
}

void 
e_content_image_size_h_content (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.size.h;
}


void
e_content_text_size_w (UTree* doc_t, UTree* t) {
    auto e = t.e;

    final
    switch (e.content.text.size_w_type) {
        case E.Content.Text.SizeType.fixed   : e_content_text_size_w_fixed   (doc_t,t); break;
        case E.Content.Text.SizeType.text    : e_content_text_size_w_text    (doc_t,t); break;
        case E.Content.Text.SizeType.image   : e_content_text_size_w_image   (doc_t,t); break;
        case E.Content.Text.SizeType.content : e_content_text_size_w_content (doc_t,t); break;
    }
}

void 
e_content_text_size_w_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_w_image (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.text.size.w = e.content.image.size.w;
}

void 
e_content_text_size_w_text (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.text.size.w = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).w;
}

void 
e_content_text_size_w_content (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.text.size.w = e.content.size.w;
}

void
e_content_text_size_h (UTree* doc_t, UTree* t) {
    auto e = t.e;

    final
    switch (e.content.text.size_h_type) {
        case E.Content.Text.SizeType.fixed   : e_content_text_size_h_fixed   (doc_t,t); break;
        case E.Content.Text.SizeType.text    : e_content_text_size_h_text    (doc_t,t); break;
        case E.Content.Text.SizeType.image   : e_content_text_size_h_image   (doc_t,t); break;
        case E.Content.Text.SizeType.content : e_content_text_size_h_content (doc_t,t); break;
    }
}

void 
e_content_text_size_h_fixed (UTree* doc_t, UTree* t) {
    auto e = t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_h_image (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.text.size.h = e.content.image.size.h;
}

void 
e_content_text_size_h_text (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.text.size.h = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).h;
}

void 
e_content_text_size_h_content (UTree* doc_t, UTree* t) {
    auto e = t.e;
    e.content.text.size.h = e.content.size.h;
}




void
update_pos (UTree* doc_t, UTree* t) {
    E* e = t.e;

    if (t.e is null)
        return;

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
pos_type_t9 (UTree* t) {
    // 1 2 3 
    // 8 9 4 
    // 7 6 5 
    E* e = t.e;

    if (e.pos_group == 1) {
        UTree* prev = find_last_in_group (t, e.pos_group);
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
pos_type_t3 (UTree* t) {
    // 1 2 3 
    E* e = t.e;

    if (e.pos_group == 1) {
        UTree* prev = find_last_in_group (t, e.pos_group);
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
                for (UTree* _t = find_last_in_group (t, e.pos_group); 
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
pos_type_grid (UTree* t) {
    // e e e
    // e e e
    // e e e
}

void
pos_type_vbox (UTree* t) {
    // e
    // e 
    // e
    E* e = t.e;

    UTree* prev = find_last_with_type (t, e.pos_type);
    if (prev !is null) {
        final
        switch (e.pos_dir) {
            case E.PosDir.r: break;
            case E.PosDir.l: break;
            case E.PosDir.b: 
                auto prev_pos  = e_pos  (prev.e);
                auto prev_size = e_size (prev.e);
                e.pos.x = prev_pos.x;
                e.pos.y = (prev_pos.y + prev_size.h).to!Y;
                break;
            case E.PosDir.t: break;
        }
    }
    else {
        if (t.parent !is null) {
            auto parent_content_pos = content_pos (t.parent.e);
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
pos_type_hbox (UTree* t) {
    // e e e
    E* e = t.e;

    UTree* prev = find_last_with_type (t, e.pos_type);
    if (prev !is null) {
        final
        switch (e.pos_dir) {
            case E.PosDir.r:
                auto prev_pos  = e_pos  (prev.e);
                auto prev_size = e_size (prev.e);
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
            auto parent_content_pos = content_pos (t.parent.e);
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
pos_type_percent (UTree* t) {
    // e e e
    E* e = t.e;
    if (t.parent !is null) {
        auto parent_content_pos = content_pos (t.parent.e);
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
pos_type_none (UTree* t) {
    E* e = t.e;
    e.pos = Pos (0,0);
}

UTree*
find_last_in_group (UTree* t, ubyte pos_group) {
    foreach (UTree* _t; WalkLeft (t))
        if (_t.e.pos_group == pos_group)
            return _t;

    return null;
}


UTree*
find_last_with_type (UTree* t, E.PosType pos_type) {
    foreach (UTree* _t; WalkLeft (t))
        if (_t.e.pos_type == pos_type)
            return _t;

    return null;
}


void
go_on_event (UTree* doc_t, UTree* t, string user_event_name, string[string] env=null) {
    foreach (_on; t.e.on)
        if (_on.event == user_event_name) // start, click
            exec_action (doc_t, _on.action, env);
}

void
go_event_action (UTree* doc_t, E* e, TString[] action, string[string] env=null) {
    exec_action (doc_t,action,env);
}

void
exec_action (UTree* doc_t, TString[] action, string[string] env=null) {
    import std.process;
    
    if (action.length) {
        writeln ("action: ", action);
        TString[] cmd = doc_get_klass_field_value (doc_t,action[0].s);
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
doc_get_klass_field_value (UTree* doc_t, string s) {
    auto dot = s.indexOf ('.');
    if (dot != -1) {
        // class field
        auto klass_name  = s[0..dot];
        auto klass_field = s[dot+1..$];

        auto kls_t = doc_t.find_klass (klass_name);
        if (kls_t !is null) {
            auto fret = find_field (kls_t, klass_field);
            if (fret)
                return fret.field.values;// OK
        }
    }

    return [];
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
    UTree* deepest;
    foreach (UTree* _e_tree; utree.WalkChilds (ev.doc_t)) {
        if (_e_tree.uni.type == Uni.Type.e) {
            send_click_in_deep (
                ev, 
                _e_tree, 
                down_pos,
                up_pos,
                deepest);

            // focused
            //remove_class_from_all (_e_tree,"focused");
            //if (deepest !is null)
                //deepest.e.add_class (ev.doc_t,"focused");
        }
    }

    //
    ev.doc_t.doc.update (ev.doc_t);
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


int
event (UTree* doc_t, Event* ev) {
    // event
    //   KEYS  --> focused
    //   CLICK --> if in x,y e.rect -> send -> in deep
    //   MOUSE --> if in x,y e.rect -> send -> in deep
    //   *     --> all
    Doc* doc = doc_t.doc;

    if (ev.type != SDL_MOUSEMOTION)
        writeln ("DOC.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                UTree* deepest;
                send_mouse_event_in_deep (ev, ev.doc_t, Pos (ev.button.x.to!X,ev.button.y.to!Y), deepest);
                //ev.doc_t.doc.update (ev.doc_t);
                //redraw_window (ev.app_window);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED) {
                UTree* deepest;
                send_mouse_event_in_deep (ev, ev.doc_t, Pos (ev.button.x.to!X,ev.button.y.to!Y), deepest);
                //remove_class_from_all (doc_t,"button-pressed");
                //ev.doc_t.doc.update (ev.doc_t);
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
update (UTree* doc_t) {
    Doc* doc = doc_t.doc;

    // 0
    if (doc.window !is null)
        doc.size = doc.window.size;
    // 1
    doc_t.doc_apply_klasses ();

    // 2
    doc_t.load_images ();
    // 3
    doc_t.load_fonts ();
    // 4
    doc_t.load_colors ();
    // 5
    doc_t.load_texts ();
    // 6
    // 7
    doc_t.update_sizes ();
    //doc.dump_sizes ();
    // ...
    // 8
    // 9
    doc_t.update_poses ();
}

void
draw (UTree* doc_t, SDL_Renderer* renderer, UTree* t) {
    Doc* doc = doc_t.doc;

    if (t !is null) {
        foreach (_t; WalkE (t)) {
            _draw_one (renderer,_t);
        }
    }
    else {
        foreach (_t; WalkE (doc_t)) {
            _draw_one (renderer,_t);
        }
    }
}

void
_draw_one (SDL_Renderer* renderer, UTree* t) {
    foreach (UTree* kls_t; t.e.klasses) {
        if (kls_t.klass.draw !is null)
            kls_t.klass.draw (kls_t,renderer,t);
    }
    if (t.e.draw !is null)
        t.e.draw (t.e,renderer);    
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
