module e_update;

import std.conv;
import std.string;
import std.string : startsWith;
import std.string : fromStringz, toStringz; 
import std.algorithm.searching : canFind;
import std.algorithm.searching : countUntil;
import std.algorithm.searching : find;
import std.process : executeShell;
import std.stdio : writeln;
import std.stdio : writefln;
import std.stdio : write;
import bindbc.sdl;
import bindbc.sdl.image;
import bindbc.sdl.ttf;
import etree;
import e;
import e_klass_draw : get_text_size;
import klass;
import field : Field;
import types;
import tstring;
import events;
import pix : open_font;
import pix : Window;
import pix : IMGException;
import pix : redraw_window;
import pix : send_e_redraw;
import pix : IMAGE_PTR;
import pix : send_user_event;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;

Klass*
find_klass_or_create (E* e, string s) {
    auto kls = find_klass (e,s);
    if (kls is null)
        kls = create_klass (e,s);
    return kls;
}

Klass*
find_klass (E* e, string s) {
    for (auto _e=e; _e !is null; _e = _e.parent) {
        foreach (kls; _e.defined_klasses)
            if (kls.name == s)
                return kls;
    }

    return null;
}

Klass*
create_klass (E* e, string s) {
    Klass* kls = new Klass (s);
    add_defined_klass (e,kls);
    return kls;
}


void
add_defined_klass (E* e, Klass* kls) {
    e.defined_klasses ~= kls;
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
    return (e.klasses.canFind (kls));
}

void
trigger_class (E* e, string s) {
    if (e.has_class ("check.pressed"))
        e.remove_class ("check.pressed");
    else
        e.add_class ("check.pressed");
}


void
remove_class_from_all (E* e, string s) {
    Klass* kls = e.find_klass (s);
    if (kls !is null)
        foreach (e; WalkTree (e))
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

void
apply_e_fields (E* e) {
    foreach (field; e.fields)
        set_field (e,field);
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
add_sub_tree (E* e, Field* field) {
    // clone each t
    // add in e
    auto _e = e.new_child_e (field.values);
    e.childs ~= _e;

    // recursive
    foreach (_field; WalkFields (field)) {
        switch (_field.name) {
            case "e"      : add_sub_tree (_e,_field); break; // add e
            case "switch" : set_switch   (_e,_field); break; // set field
            default       : set_field    (_e,_field); break; // set field
        }
    }
}

void
set_switch (E* e, Field* field) {
    auto evaluated = evaluate_switch_cond (e,field.values);

    // switch value
    //   case value1
    //     field values
    //   case value2
    //     field values

    // each child case
    if (evaluated.length >= 1)
    foreach (_field; WalkFields (field)) {
        if (_field.name == evaluated[0].s) {
            set_case (e,_field);
            return;
        }
    }

    // default
    foreach (_field; WalkFields (field)) {
        if (_field.name == "default") {
            set_case (e,_field);
            return;
        }
    }
}

void
set_case (E* e, Field* field) {
    apply_case (e,field);
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
new_child_e (E* e, TString[] values) {
    // sub e
    // find parent e  in tree  from last e
    //   create sub e
    //   add classes

    auto _e = etree.new_e ();

    _e.add_klass (e.find_klass_or_create ("e"));

    // klasses
    foreach (ts; values)
        switch (ts.type) {
            case TString.Type.name   : 
            case TString.Type.string : 
                _e.add_klass (e.find_klass_or_create (ts.s));
                break;
            default:
        }

    return _e;
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
extract_quoted (E* e, TString[] values) {
    TString[] vs;
    vs.reserve (values.length);
    foreach (v; values) 
        if (v.type == TString.Type.bquoted) 
            vs ~= TString (TString.Type.string, extract_value (e,v.s));
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
load_e_colors (E* e) {
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

static
IMAGE_PTR[string] global_images;

void
load_e_image (E* e) {
    string img_file = e.content.image.src;
    IMAGE_PTR* ptr = img_file in global_images;

    if (ptr is null || e.content.image.ptr != *ptr) {
        IMAGE_PTR img_surface;
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
dump_sizes (E* e) {
    foreach (_e; WalkChilds (e))
        dump_size (_e); // recursive
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
}

//void
//update_fix_size_w_max (E* e) {
//    W other_w;
//    size_t max_cnt;

//    // total
//    foreach (_e; WalkChilds (e)) {
//        if (_e.size_w_type == E.SizeType.max)
//            max_cnt ++;
//        else
//            other_w += _e.size.w;
//    }

//    // has max
//    if (max_cnt >= 1) {
//        // divide
//        auto total_w = e.content.size.w;

//        W one_max_w = (total_w - other_w) / max_cnt;

//        foreach (_e; WalkChilds (e)) {
//            if (_e.size_w_type == E.SizeType.max)  {
//                auto ew = one_max_w;
//                auto cw = ew - e.aura.size.w - e.aura.size.w;
//                _e.size.w         = (ew > 0) ? ew : 0;
//                _e.content.size.w = (cw > 0) ? cw : 0;

//                // recursive update childs
//                //foreach (__e; WalkChilds (_e))
//                //    update_e_size (__e);
//            }
//        }
//    }
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
    assert (e.parent !is null);
    W parent_w = e.parent.content.size.w;
    W other_w;
    size_t max_cnt;

    // total
    foreach (_e; WalkChilds (e.parent)) {
        if (_e.size_w_type == E.SizeType.max)
            max_cnt ++;
        else {
            _e.update_e_size ();
            other_w += _e.size.w;
        }
    }

    // has max
    if (max_cnt >= 1) {
        // divide
        auto total_w = parent_w;

        W one_max_w = (total_w - other_w) / max_cnt;

        foreach (_e; WalkChilds (e.parent)) {
            if (_e.size_w_type == E.SizeType.max)  {
                auto ew = one_max_w;
                auto cw = ew - e.aura.size.w - e.aura.size.w;
                _e.size.w         = (ew > 0) ? ew : 0;
                _e.content.size.w = (cw > 0) ? cw : 0;
            }
        }
    }
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
    //
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
        _e.force_e_update ();
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
}

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
                auto prev_pos  = prev.pos;
                auto prev_size = prev.size;
                e.pos.x = prev_pos.x;
                e.pos.y = (prev_pos.y + prev_size.h).to!Y;
                break;
            case E.PosDir.t: break;
        }
    }
    else {
        if (e.parent !is null) {
            auto parent_content_pos = e.parent.content.pos;
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
                auto prev_pos  = prev.pos;
                auto prev_size = prev.size;
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
            auto parent_content_pos = e.parent.content.pos;
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
    // - e ---
    
    if (e.parent !is null) {
        auto parent_content_pos = e.parent.content.pos;
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
doc_get_klass_field_value (E* e, string s) {
    auto dot = s.indexOf ('.');
    if (dot != -1) {
        // class field
        auto klass_name  = s[0..dot];
        auto klass_field = s[dot+1..$];

        auto kls_t = e.find_klass (klass_name);
        if (kls_t !is null) {
            auto fret = find_field (kls_t, klass_field);
            if (fret)
                return fret.values;// OK
        }
    }

    return [];
}

string
extract_value (E* e, string bquoted) {
    //writeln ("extract_value: ", bquoted);

    auto stripped  = bquoted.strip ("`");
    auto converted = extract_class_field_value (e,stripped);
    //writeln ("converted: ", converted);
    auto ret = executeShell (converted);  // (int status, string output)

    //writeln (ret.status);
    //writeln ("ret.output: ", ret.output);

   return ret.output.stripRight ();
}


string
extract_class_field_value (E* e, string s) {
    TString[] cmd = doc_get_klass_field_value (e,s);
    if (cmd.length)
        return cmd.join (" ");
    else
        return s;
}


void
force_e_update (E* e) {
    Event ev;
    ev.type      = SDL_USEREVENT;
    ev.user.code = USER_EVENT.update;
    e.event (&ev);
}

void
send_e_update (E* e) {
    send_user_event!UpdateUserEvent (e);
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
