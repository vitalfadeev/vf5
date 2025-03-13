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
import std.stdio : writefln;
import std.stdio : write;
import pix : open_font;
import pix : Window;
import pix : IMGException;
import pix : redraw_window;
import draws : e_pos, e_size, content_pos;
import field : Field;
import pix : redraw;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;

alias DOC_EVENT_FN  = void   function (E* root, Event* ev);
alias DOC_UPDATE_FN = void   function (E* root);

Klass*
find_klass_or_create (E* root, string s) {
    auto kls = find_klass (root,s);
    if (kls is null)
        kls = create_klass (root,s);
    return kls;
}

Klass*
find_klass (E* root, string s) {
    for (auto _e=root; _e !is null; _e = _e.parent) {
        foreach (kls; _e.defined_klasses)
            if (kls.name == s)
                return kls;
    }

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
create_klass (E* root, string s) {
    Klass* kls = new Klass (s);
    add_defined_klass (root,kls);
    return kls;
}


void
add_defined_klass (E* root, Klass* kls) {
    root.defined_klasses ~= kls;
}


void
send_event_in_deep (Event* ev, E* e, Pos pos, SDL_Window* window, SDL_Renderer* renderer) {
    bool 
    valid_e (E* e) {
        return (
            pos_in_rect (pos, e.pos, e.size)
        );
    }

    // klass event
    foreach (_e; etree.FindDeepest (e,&valid_e)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
    }
}

void
send_click_in_deep (Event* ev, E* e, Pos down_pos, Pos up_pos, ref E* deepest) {
    bool 
    valid_e (E* e) {
        return (
            pos_in_rect (down_pos, e.pos, e.size) &&
            pos_in_rect (up_pos,   e.pos, e.size)
        );
    }

    // klass event
    foreach (_e; FindDeepest (e,&valid_e)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
        deepest = _e;
    }
}

void
send_mouse_event_in_deep (Event* ev, E* e, Pos pos, ref E* deepest) {
    bool 
    valid_e (E* e) {
        return (
            pos_in_rect (pos, e.pos, e.size)
        );
    }

    // klass event
    foreach (_e; FindDeepest (e,&valid_e)) {
        //writeln (*_t);
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
        deepest = _e;
    }
}

void
send_event_in_tree (Event* ev) {
    // klass event
    foreach (_e; WalkTree (ev.e)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
    }
}

void
add_class (E* e, string s) {
    Klass* kls = e.find_klass_or_create (s);
    if (!e.klasses.canFind (kls))
        e.klasses ~= kls;
}

bool
has_class (E* e, string s) {
    Klass* kls = e.find_klass (s);
    assert (kls !is null);
    return (!e.klasses.canFind (kls));
}

void
trigger_class (E* e, string s) {
    if (e.has_class ("check.pressed"))
        e.remove_class ("check.pressed");
    else
        e.add_class ("check.pressed");
}


void
remove_class_from_all (E* root, string s) {
    Klass* kls = root.find_klass (s);
    if (kls !is null)
        foreach (e; WalkTree (root))
            remove_class (e, kls);
}

void
remove_class (E* e, string s) {
    auto kls = e.find_klass (s);
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
apply_e_klasses (E* e) {
    // set . each e klass
    foreach (kls; e.klasses)
        apply_klass (e,kls);

    //write (format!"%-60s " (e.toString)); time_step ("",0);
}

// WIDGET_APPLY_KLASS_FN
void
apply_klass (E* e, Klass* kls) {
    // each field
    // each sub tree
    foreach (field; WalkFields (kls)) {
        switch (field.name) {
            case "e"      : add_sub_tree (e,field); break; // add e
            case "switch" : set_switch   (e,field); break; // set field
            default       : set_field    (e,field); break; // set field
        }
    }
}

void
set_field (E* e, Field* field) {
    // `command` -> exec command -> output
    auto values = extract_quoted (e,field.values);

    // klasses set
    foreach (kls; e.klasses) {
            kls.set (e,field.name,values);
    }
}

void
add_sub_tree (E* dest_t, Field* field) {
    // clone each t
    // add in dest_t
    auto e = dest_t.new_child_e (field.values);
    dest_t.childs ~= e;

    // recursive
    foreach (_field; WalkFields (field)) {
        switch (_field.name) {
            case "e"      : add_sub_tree (e,_field); break; // add e
            case "switch" : set_switch   (e,_field); break; // set field
            default       : set_field    (e,_field); break; // set field
        }
    }
}

void
set_switch (E* dest_t, Field* field) {
    auto evaluated = evaluate_switch_cond (dest_t,field.values);

    // switch value
    //   case value1
    //     field values
    //   case value2
    //     field values

    // each child case
    if (evaluated.length >= 1)
    foreach (_field; WalkFields (field)) {
        if (_field.name == evaluated[0].s) {
            set_case (dest_t,_field);
            return;
        }
    }

    // default
    foreach (_field; WalkFields (field)) {
        if (_field.name == "default") {
            set_case (dest_t,_field);
            return;
        }
    }
}

void
set_case (E* dest_t, Field* field) {
    apply_case (dest_t,field);
}

void
apply_case (E* e, Field* field) {
    // each field
    // each sub tree
    foreach (field; WalkFields (field)) {
        switch (field.name) {
            case "e"      : add_sub_tree (e,field); break; // add e
            case "switch" : set_switch   (e,field); break; // set field
            default       : set_field    (e,field); break; // set field
        }
    }
}


auto
new_child_e (E* root, TString[] values) {
    // sub e
    // find parent e  in tree  from last e
    //   create sub e
    //   add classes

    auto e = etree.new_e ();

    e.add_klass (root.find_klass_or_create ("e"));

    // klasses
    foreach (ts; values)
        switch (ts.type) {
            case TString.Type.name   : 
            case TString.Type.string : 
                e.add_klass (root.find_klass_or_create (ts.s));
                break;
            default:
        }

    return e;
}


auto
evaluate_switch_cond (E* e, TString[] cond) {
    // 'shell_command.sh -with -args'
    // "double-quoted string"
    // klass.field
    // strings a b c
    return extract_quoted (e,cond);
}


E*
clone_tree (E* e) {
    E* cloned;

    //final
    //switch (t.type) {
    //    case Uni.Type.doc     : cloned = new UTree (Uni (t.doc.clone  )); break;
    //    case Uni.Type.e       : cloned = new UTree (Uni (e.clone    )); break;
    //    case Uni.Type.klass   : cloned = new UTree (Uni (t.klass.clone)); break;
    //    case Uni.Type.field   : cloned = new UTree (Uni (t.field.clone)); break;
    //    case Uni.Type.switch_ : cloned = new UTree (Uni (t.switch_.clone)); break;
    //    case Uni.Type.case_   : cloned = new UTree (Uni (t.case_.clone)); break;
    //}

    return cloned;
}


TString[]
extract_quoted (E* root, TString[] values) {
    TString[] vs;
    vs.reserve (values.length);
    foreach (v; values) 
        if (v.type == TString.Type.bquoted) 
            vs ~= TString (TString.Type.string, extract_value (root,v.s));
        else
            vs ~= v;

    return vs;
}


alias FONTPTR = TTF_Font*;
static
FONTPTR[string] global_fonts;
static
FONTPTR default_ptr;

void
load_e_font (E* e) {
    auto default_file = DEFAULT_FONT_FILE;
    auto default_size = DEFAULT_FONT_SIZE;
    if (default_ptr is null)
        default_ptr  = open_font (default_file,default_size);

    if (e.content.text.s.length) {
        string  font_file = e.content.text.font.file;
        ubyte   font_size = e.content.text.font.size;
        FONTPTR font_ptr  = e.content.text.font.ptr;
        FONTPTR* _ptr = font_file in global_fonts;

        if (font_file.length >= 1) {
            if (_ptr is null || font_ptr != *_ptr) {
                auto ptr = open_font (font_file,font_size);
                if (ptr is null)
                    throw new Exception ("open_font");

                global_fonts[font_file] = ptr;
                e.content.text.font.ptr = ptr;
            }
        }
    }    

    if (e.content.text.s.length) {
        if (e.content.text.font.file.length)
            e.content.text.font.ptr = global_fonts[e.content.text.font.file];
        else
            e.content.text.font.ptr = default_ptr;
    }
}

void
load_e_colors (E* root) {
    // after load all classes, because able color 'class.field'
}

void
load_e_childs (E* e) {
    final
    switch (e.generator.type) {
        case E._Generator.Type.none : break;
        case E._Generator.Type.cmd  : load_childs_cmd (e); break;
        case E._Generator.Type.fs   : break;
        case E._Generator.Type.csv  : break;
    }
}

void
load_childs_cmd (E* e) {
    import generator;
    import generators.cmd;

    if (e.generator.ptr !is null) {
        e.generator.ptr = cast (Generator*) new CmdGenerator ();
        generator.Template t;

        foreach (_e; GenTree (e.generator.ptr,&t))
            e.childs ~= _e;
    }
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
dump_sizes (E* root) {
    foreach (E* e; WalkChilds (root))
        dump_size (e); // recursive
}
void
dump_size (E* e, int level=0) {
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
    foreach (_e; WalkChilds (e))
        dump_size (_e,level+1);
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
update_e_size (E* e) {
    final
    switch (e.size_w_type) {
        case E.SizeType.fixed   : update_size_w_fixed   (e); break;
        case E.SizeType.content : update_size_w_content (e); break;
        case E.SizeType.parent  : update_size_w_parent  (e); break;
        case E.SizeType.window  : update_size_w_window  (e); break;
        case E.SizeType.max     : update_size_w_max     (e); break;
    }

    final
    switch (e.size_h_type) {
        case E.SizeType.fixed   : update_size_h_fixed   (e); break;
        case E.SizeType.content : update_size_h_content (e); break;
        case E.SizeType.parent  : update_size_h_parent  (e); break;
        case E.SizeType.window  : update_size_h_window  (e); break;
        case E.SizeType.max     : update_size_h_max     (e); break;
    }

    // recursive
    //foreach (_e; WalkChilds (e))
        //update_size (_e);

    // fix size`s
    update_fix_size_w (e);
}

void
update_fix_size_w (E* e) {
    W parent_w;
    W other_w;
    size_t max_cnt;

    // total
    foreach (_e; WalkChilds (e)) {
        if (_e.size_w_type == E.SizeType.max)
            max_cnt ++;
        else
            other_w += _e.size.w;
    }

    // has max
    if (max_cnt >= 1) {
        // divide
        assert (e.parent !is null);
        auto total_w = e.content.size.w;

        W one_max_w = (total_w - other_w) / max_cnt;
        foreach (_e; WalkChilds (e)) {
            if (_e.size_w_type == E.SizeType.max)  {
                _e.size.w = one_max_w;
                _e.content.size.w = _e.size.w - _e.aura.size.w - _e.aura.size.w;
                //writeln ("XXX: ", _t.e, ": ", one_max_w);
                //writeln ("   : ", max_cnt);
                //writeln ("   : ", total_w);
                //writeln ("   : ", other_w);
                //writeln ("   : ", one_max_w); // 456

                // recursive update childs
                foreach (__e; WalkChilds (_e))
                    update_e_size (__e);
            }
        }
    }
}

//void
//update_content_size_w_from_size_w (E* e, int w) {
//    w = (w > 0) ? w : 0;
//    e.size.w = w;
//    e.content.size.w = w - e.aura.size.w - e.aura.size.w;
//}

//void
//update_size_w_from_content_size_w (E* e, int w) {
//    w = (w > 0) ? w : 0;
//    e.size.w = w + e.aura.size.w + e.aura.size.w;
//    e.content.size.w = w;
//}

void
update_size_w_fixed (E* e) {
    auto ew = e.size.w;
    auto cw = ew - e.aura.size.w - e.aura.size.w;
    e.size.w         = (ew > 0) ? ew : 0;
    e.content.size.w = (cw > 0) ? cw : 0;
}

void
update_size_w_content (E* e) {
    update_content_size_w (e);  // update content.size.w

    auto ew = e.content.size.w + e.aura.size.w + e.aura.size.w;
    auto cw = e.content.size.w;
    e.size.w         = (ew > 0) ? ew : 0;
    e.content.size.w = (cw > 0) ? cw : 0;
}

void
update_size_w_parent (E* e) {
    if (e.parent !is null) {
        auto ew = e.parent.content.size.w;
        auto cw = ew - e.aura.size.w - e.aura.size.w;
        e.size.w         = (ew > 0) ? ew : 0;
        e.content.size.w = (cw > 0) ? cw : 0;
    }
    else {
        update_size_w_window (e);
    }
}

void
update_size_w_window (E* e) {
    auto window = e.find_window ();
    if (window !is null) {
        auto ew = window.size.w;
        auto cw = ew - e.aura.size.w - e.aura.size.w;
        e.size.w         = (ew > 0) ? ew : 0;
        e.content.size.w = (cw > 0) ? cw : 0;
    }
    else {
        auto ew = DEFAULT_WINDOW_W;
        auto cw = ew - e.aura.size.w - e.aura.size.w;
        e.size.w         = (ew > 0) ? ew : 0;
        e.content.size.w = (cw > 0) ? cw : 0;
    }
}

void
update_size_w_max (E* e) {
    //e.size.w = 0;
    //e.content.size.w = 0;
    //W all_left;
    //foreach (_t; WalkLeft (t))
    //    all_left += _e.size.w;

    //if (e.parent.content.size.w > all_left) {
    //    e.size.w = (e.parent.content.size.w - all_left).to!W;
    //    e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    //}
    //else {
    //    e.size.w = 0;
    //    e.content.size.w = 0;
    //}
}

auto
find_window (E* e) {
    for (auto _e=e; _e !is null; _e = _e.parent)
        if (_e.window !is null)
            return _e.window;
    return null;
}


void
update_size_h_fixed (E* e) {
    auto eh = e.size.h;
    auto ch = eh - e.aura.size.h - e.aura.size.h;
    e.size.h         = (eh > 0) ? eh : 0;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_size_h_content (E* e) {
    update_content_size_h (e);

    auto eh = e.content.size.h + e.aura.size.h + e.aura.size.h;
    auto ch = e.content.size.h;
    e.size.h         = (eh > 0) ? eh : 0;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_size_h_parent (E* e) {
    if (e.parent !is null) {
        auto eh = e.parent.content.size.h;
        auto ch = eh - e.aura.size.h - e.aura.size.h;
        e.size.h         = (eh > 0) ? eh : 0;
        e.content.size.h = (ch > 0) ? ch : 0;
    }
    else {
        update_size_h_window (e);
    }
}

void
update_size_h_window (E* e) {
    auto window = e.find_window ();
    if (window !is null) {
        auto eh = window.size.h;
        auto ch = eh - e.aura.size.h - e.aura.size.h;
        e.size.h         = (eh > 0) ? eh : 0;
        e.content.size.h = (ch > 0) ? ch : 0;
    }
    else {
        auto eh = DEFAULT_WINDOW_H;
        auto ch = eh - e.aura.size.h - e.aura.size.h;
        e.size.h         = (eh > 0) ? eh : 0;
        e.content.size.h = (ch > 0) ? ch : 0;
    }
}

void
update_size_h_max (E* e) {    
    // e.size.h = 
    // e.content.size.h = ;
}

void
update_content_size_w (E* e) {
    final
    switch (e.content.size_w_type) {
        case E.Content.SizeType.e      : update_content_size_w_e      (e); break;
        case E.Content.SizeType.fixed  : update_content_size_w_fixed  (e); break;
        case E.Content.SizeType.image  : update_content_size_w_image  (e); break;
        case E.Content.SizeType.text   : update_content_size_w_text   (e); break;
        case E.Content.SizeType.childs : update_content_size_w_childs (e); break;
        case E.Content.SizeType.max    : update_content_size_w_max    (e); break;
    }

    update_e_pos (e);
}

void
update_content_size_w_e (E* e) {
    auto cw = e.size.w;
    e.content.size.w = (cw > 0) ? cw : 0;
}

void
update_content_size_w_fixed (E* e) {
    auto cw = e.content.size.w;
    e.content.size.w = (cw > 0) ? cw : 0;
}

void
update_content_size_w_image (E* e) {
    update_content_image_size_w (e);

    auto cw = e.content.image.size.w;
    e.content.size.w = (cw > 0) ? cw : 0;
}

void
update_content_size_w_text (E* e) {
    update_content_text_size_w (e);

    auto cw = e.content.text.size.w;
    e.content.size.w = (cw > 0) ? cw : 0;
}

// e.size = content
// e.size = childs
//   update childs
//   
// content.size = e
//   update parent e
void
update_content_size_w_childs (E* e) {
    update_content_childs_size (e);

    auto cw = e.content.childs_size.w;
    e.content.size.w = (cw > 0) ? cw : 0;
}

void
update_content_childs_size (E* e) {
    Size max_sz;
    foreach (_e; WalkChilds (e)) {
        _e.update ();
        max_sz.w = max (max_sz.w, _e.pos.x + _e.size.w);
        max_sz.h = max (max_sz.h, _e.pos.y + _e.size.h);
    }

    if (max_sz.w > e.content.pos.x)
        e.content.childs_size.w = max_sz.w - e.content.pos.x;
    else
        e.content.childs_size.w = 0;

    if (max_sz.h > e.content.pos.y)
        e.content.childs_size.h = max_sz.h - e.content.pos.y;
    else
        e.content.childs_size.h = 0;
}


void
update_content_size_w_max (E* e) {
    e.content.size.w = max (e.content.image.size.w, e.content.text.size.w);
}

void
update_content_size_h (E* e) {
    final
    switch (e.content.size_h_type) {
        case E.Content.SizeType.e      : update_content_size_h_e      (e); break;
        case E.Content.SizeType.fixed  : update_content_size_h_fixed  (e); break;
        case E.Content.SizeType.image  : update_content_size_h_image  (e); break;
        case E.Content.SizeType.text   : update_content_size_h_text   (e); break;
        case E.Content.SizeType.childs : update_content_size_h_childs (e); break;
        case E.Content.SizeType.max    : update_content_size_h_max    (e); break;
    }
}

void
update_content_size_h_e (E* e) {
    auto ch = e.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_fixed (E* e) {
    auto ch = e.content.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_image (E* e) {
    update_content_image_size_h (e);

    auto ch = e.content.image.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_text (E* e) {
    update_content_text_size_h (e);

    auto ch = e.content.text.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_childs (E* e) {
    update_content_childs_size (e);

    auto ch = e.content.childs_size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_max (E* e) {
    e.content.size.h = max (e.content.image.size.h, e.content.text.size.h);
}

void
update_content_image_size_w (E* e) {
    final
    switch (e.content.image.size_w_type) {
        case E.Content.Image.SizeType.fixed   : update_content_image_size_w_fixed   (e); break;
        case E.Content.Image.SizeType.image   : update_content_image_size_w_image   (e); break;
        case E.Content.Image.SizeType.text    : update_content_image_size_w_text    (e); break;
        case E.Content.Image.SizeType.content : update_content_image_size_w_content (e); break;
    }
}

void 
update_content_image_size_w_fixed (E* e) {
    e.content.image.size.w = e.content.image.size.w;
}

void 
update_content_image_size_w_image (E* e) {
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
update_content_image_size_w_text (E* e) {
    e.content.image.size.w = e.content.text.size.w;
}

void 
update_content_image_size_w_content (E* e) {
    e.content.image.size.w = e.content.size.w;
}

void
update_content_image_size_h (E* e) {
    final
    switch (e.content.image.size_h_type) {
        case E.Content.Image.SizeType.fixed   : update_content_image_size_h_fixed   (e); break;
        case E.Content.Image.SizeType.image   : update_content_image_size_h_image   (e); break;
        case E.Content.Image.SizeType.text    : update_content_image_size_h_text    (e); break;
        case E.Content.Image.SizeType.content : update_content_image_size_h_content (e); break;
    }
}

void 
update_content_image_size_h_fixed (E* e) {
    //e.content.image.size.h = e.content.image.size.h;
}

void 
update_content_image_size_h_image (E* e) {
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
update_content_image_size_h_text (E* e) {
    e.content.image.size.h = e.content.text.size.h;
}

void 
update_content_image_size_h_content (E* e) {
    e.content.image.size.h = e.content.size.h;
}


void
update_content_text_size_w (E* e) {
    final
    switch (e.content.text.size_w_type) {
        case E.Content.Text.SizeType.fixed   : update_content_text_size_w_fixed   (e); break;
        case E.Content.Text.SizeType.text    : update_content_text_size_w_text    (e); break;
        case E.Content.Text.SizeType.image   : update_content_text_size_w_image   (e); break;
        case E.Content.Text.SizeType.content : update_content_text_size_w_content (e); break;
    }
}

void 
update_content_text_size_w_image (E* e) {    
    e.content.text.size.w = e.content.image.size.w;
}

void 
update_content_text_size_w_fixed (E* e) {
    //e.content.text.size.w = e.content.text.size.w;
}

void 
update_content_text_size_w_text (E* e) {
    e.content.text.size.w = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).w;
}

void 
update_content_text_size_w_content (E* e) {
    e.content.text.size.w = e.content.size.w;
}

void
update_content_text_size_h (E* e) {
    final
    switch (e.content.text.size_h_type) {
        case E.Content.Text.SizeType.fixed   : update_content_text_size_h_fixed   (e); break;
        case E.Content.Text.SizeType.text    : update_content_text_size_h_text    (e); break;
        case E.Content.Text.SizeType.image   : update_content_text_size_h_image   (e); break;
        case E.Content.Text.SizeType.content : update_content_text_size_h_content (e); break;
    }
}

void 
update_content_text_size_h_image (E* e) {
    e.content.text.size.h = e.content.image.size.h;
}

void 
update_content_text_size_h_fixed (E* e) {
    //e.content.text.size.h = e.content.text.size.wh
}

void 
update_content_text_size_h_text (E* e) {
    e.content.text.size.h = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).h;
}

void 
update_content_text_size_h_content (E* e) {    
    e.content.text.size.h = e.content.size.h;
}


void
update_e_pos (E* e) {
    final
    switch (e.pos_type) {
        case E.PosType.t9      : pos_type_t9   (e); break;
        case E.PosType.t3      : pos_type_t3   (e); break;
        case E.PosType.grid    : pos_type_grid (e); break;
        case E.PosType.vbox    : pos_type_vbox (e); break;
        case E.PosType.hbox    : pos_type_hbox (e); break;
        case E.PosType.percent : pos_type_percent (e); break;
        case E.PosType.none    : pos_type_none (e); break;
   }

    //e.pos         = Pos (0,0);
    e.margin.pos  = Pos (e.pos.x - e.margin.size.w, e.pos.y - e.margin.size.h);
    e.aura.pos    = e.pos;
    e.content.pos = Pos (e.aura.pos.x + e.aura.size.w, e.aura.pos.y + e.aura.size.h);

    //e.borders.pos = e.pos;
    //e.pad.pos     = e.borders.pos + Pos (e.borders.l.w, e.borders.t.w);
    //e.content.pos = e.pad.pos + Pos (e.pad.l, e.pad.t);
}

//void
//update_text_rects_pos (E* e) {
//    foreach (ref rec; e.content.text.rects) {
//        if (rec.s.length)
//            rec.pos += e.pos;
//    }
//}


void
pos_type_t9 (E* e) {
    // 1 2 3 
    // 8 9 4 
    // 7 6 5 
    

    if (e.pos_group == 1) {
        E* prev = find_last_in_group (e,e.pos_group);
        if (prev !is null) {
            if (e.pos_dir == E.PosDir.r) {
                e.pos.x = (prev.pos.x + prev.size.w).to!X;
                e.pos.y = prev.pos.y;
            }
        }
        else {
            X parent_x;
            Y parent_y;
            if (e.parent !is null) {
                parent_x = e.parent.content.pos.x;
                parent_y = e.parent.content.pos.y;
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
pos_type_t3 (E* e) {
    // 1 2 3 
    

    if (e.pos_group == 1) {
        E* prev = find_last_in_group (e, e.pos_group);
        if (prev !is null) {
            final
            switch (e.pos_dir) {
                case E.PosDir.r:
                    e.pos.x = (prev.pos.x + prev.size.w).to!X;
                    e.pos.y = prev.pos.y;
                    break;
                case E.PosDir.l: break;
                case E.PosDir.t: break;
                case E.PosDir.b: break;
            }
        }
        else {
            if (e.parent !is null) {
                e.pos.x = e.parent.content.pos.x;
                e.pos.y = e.parent.content.pos.y;
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
                if (e.parent !is null) {
                    auto parent_e = e.parent;
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
                for (E* _e = find_last_in_group (e, e.pos_group); 
                    _e !is null; 
                    _e = find_last_in_group (_e, e.pos_group)) 
                {
                    _e.margin.pos.x  -= e.size.w;
                    _e.pos.x         -= e.size.w;
                    _e.aura.pos.x    -= e.size.w;
                    _e.content.pos.x -= e.size.w;
                }
                break;
            case E.PosDir.l: break;
            case E.PosDir.t: break;
            case E.PosDir.b: break;
        }
    }
}

void
pos_type_grid (E* e) {
    // e e e
    // e e e
    // e e e
}

void
pos_type_vbox (E* e) {
    // e
    // e 
    // e
    

    E* prev = find_last_with_type (e, e.pos_type);
    if (prev !is null) {
        final
        switch (e.pos_dir) {
            case E.PosDir.r: break;
            case E.PosDir.l: break;
            case E.PosDir.b: 
                auto prev_pos  = e_pos  (prev);
                auto prev_size = e_size (prev);
                e.pos.x = prev_pos.x;
                e.pos.y = (prev_pos.y + prev_size.h).to!Y;
                break;
            case E.PosDir.t: break;
        }
    }
    else {
        if (e.parent !is null) {
            auto parent_content_pos = content_pos (e.parent);
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
pos_type_hbox (E* e) {
    // e e e

    E* prev = find_last_with_type (e, e.pos_type);
    if (prev !is null) {
        final
        switch (e.pos_dir) {
            case E.PosDir.r:
                auto prev_pos  = e_pos  (prev);
                auto prev_size = e_size (prev);
                e.pos.x = (prev_pos.x + prev_size.w).to!X;
                e.pos.y =  prev_pos.y;
                break;
            case E.PosDir.l: break;
            case E.PosDir.b: break;
            case E.PosDir.t: break;
        }
    }
    else {
        if (e.parent !is null) {
            auto parent_content_pos = content_pos (e.parent);
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
pos_type_percent (E* e) {
    // e e e
    
    if (e.parent !is null) {
        auto parent_content_pos = content_pos (e.parent);
        auto parent_w = e.parent.size.w;
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
pos_type_none (E* e) {    
    e.pos = Pos (0,0);
}

E*
find_last_in_group (E* e, ubyte pos_group) {
    foreach (_e; WalkLeft (e))
        if (_e.pos_group == pos_group)
            return _e;

    return null;
}


E*
find_last_with_type (E* e, E.PosType pos_type) {
    foreach (_e; WalkLeft (e))
        if (_e.pos_type == pos_type)
            return _e;

    return null;
}


void
go_on_event (E* e, string user_event_name, string[string] env=null) {
    foreach (_on; e.on)
        if (_on.event == user_event_name) // start, click
            exec_action (e,_on.action, env);
}

void
go_event_action (E* e, TString[] action, string[string] env=null) {
    exec_action (e,action,env);
}

void
exec_action (E* e, TString[] action, string[string] env=null) {
    import std.process;
    
    if (action.length) {
        writeln ("action: ", action);
        TString[] cmd = doc_get_klass_field_value (e,action[0].s);
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
doc_get_klass_field_value (E* root, string s) {
    auto dot = s.indexOf ('.');
    if (dot != -1) {
        // class field
        auto klass_name  = s[0..dot];
        auto klass_field = s[dot+1..$];

        auto kls_t = root.find_klass (klass_name);
        if (kls_t !is null) {
            auto fret = find_field (kls_t, klass_field);
            if (fret)
                return fret.values;// OK
        }
    }

    return [];
}

string
extract_value (E* root, string bquoted) {
    //writeln ("extract_value: ", bquoted);

    auto stripped  = bquoted.strip ("`");
    auto converted = extract_class_field_value (root,stripped);
    //writeln ("converted: ", converted);
    auto ret = executeShell (converted);  // (int status, string output)

    //writeln (ret.status);
    //writeln ("ret.output: ", ret.output);

   return ret.output.stripRight ();
}


string
extract_class_field_value (E* root, string s) {
    TString[] cmd = doc_get_klass_field_value (root,s);
    if (cmd.length)
        return cmd.join (" ");
    else
        return s;
}


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
    E* deepest;
    foreach (E* _e_tree; WalkChilds (ev.e)) {
        send_click_in_deep (
            ev, 
            _e_tree, 
            down_pos,
            up_pos,
            deepest);

            // focused
            //remove_class_from_all (_e_tree,"focused");
            //if (deepest !is null)
                //deepest.add_class (ev.doc,"focused");
    }

    //
    ev.e.update ();
    writeln ("deepest: ", *deepest);
    writeln ("deepest: ", deepest.content.image);
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
dump_klasses (E* root) {
    foreach (kls; root.defined_klasses) {
        writeln (*kls);
    }
}


void
event (E* root, Event* ev) {
    // event
    //   KEYS  --> focused
    //   CLICK --> if in x,y e.rect -> send -> in deep
    //   MOUSE --> if in x,y e.rect -> send -> in deep
    //   *     --> all
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("ROOT.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                E* deepest;
                send_mouse_event_in_deep (ev, root, Pos (ev.button.x.to!X,ev.button.y.to!Y), deepest);
                //ev.doc.update (ev.doc);
                //redraw_window (ev.app_window);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED) {
                E* deepest;
                send_mouse_event_in_deep (ev, root, Pos (ev.button.x.to!X,ev.button.y.to!Y), deepest);
                //remove_class_from_all (doc,"button-pressed");
                //ev.doc.update (ev.doc);
                //redraw_window (ev.app_window);
            }
            break;
        case SDL_KEYDOWN: break;// SDL_KeyboardEvent
        case SDL_KEYUP: break;
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.start  : send_event_in_tree (ev); break;
                case USER_EVENT.draw   : root.draw (ev); break;
                case USER_EVENT.click  : on_click (ev); break;
                default:
            }
            break;
        case SDL_QUIT:
            return;
            break;
        default:
    }

    return;
}


void
time_step (string file_name=__FILE__, size_t line=__LINE__) {
    import core.time;
    static MonoTime last_time;
    auto cur = MonoTime.currTime ();
    auto dur = cur - last_time;
    if (file_name.length != 0)
        writefln ("%16s: %s", file_name, dur);
    last_time = cur;
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
