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
import etree;
import klass;
import e;
import types;
import events : Event;
import draws : get_text_size;
import std.stdio : writeln;
import std.stdio : write;
import pix : open_font;
import pix : Window;
import pix : IMGException;
import pix : USER_EVENT;
import pix : send_redraw_window;
import draws : e_pos, e_size, content_pos;
import txt_reader : add_child_e;
import klasses.e : global_font_files;
import klasses.e : extract_value;
import pix : ClickUserEvent;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;

alias DOC_EVENT_FN  = int  function (Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer);
alias DOC_UPDATE_FN = void function (Doc* doc);
alias DOC_DRAW_FN   = void function (Doc* doc,SDL_Renderer* renderer);

struct
Doc {
    ETree*   tree;
    Klass*[] klasses; // find by name
    Klass*   hotkeys;
    Window*  window;
    Size     size = Size (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H);
    ETree*   focused;

    DOC_EVENT_FN  event  = &.event;
    DOC_UPDATE_FN update = &.update;
    DOC_DRAW_FN   draw   = &.draw;

    Klass*
    find_klass (string s) {
        foreach (kls; klasses)
            if (kls.name == s)
                return kls;

        return null;
    }

    Klass*
    create_klass (string s) {
        Klass* kls = new Klass (s);
        klasses ~= kls;
        return kls;
    }

    Klass*
    add_klass (Klass* kls) {
        klasses ~= kls;
        return kls;
    }


    Klass*
    find_klass_or_create (string s) {
        auto kls = find_klass (s);
        if (kls is null)
            kls = create_klass (s);
        return kls;
    }

    E*
    find_e_at_pos (Pos pos) {
        E* found;

        bool 
        valid_e (ETree* t) {
            return (pos_in_rect (pos, t.e.pos, t.e.size));
        }

        foreach (t; FindDeepest (tree,&valid_e)) {
            found = t.e;
        }

        return found;
    }
}

void
send_event_in_deep (Event* ev, Doc* doc, ETree* t, Pos pos, SDL_Window* window, SDL_Renderer* renderer) {
    bool 
    valid_e (ETree* t) {
        return (pos_in_rect (pos, t.e.pos, t.e.size));
    }

    // klass event
    foreach (_t; FindDeepest (t,&valid_e)) {
        foreach (kls; _t.e.klasses)
            if (kls.event !is null)
                kls.event (kls,doc,ev,window,renderer,_t);
    }
}

void
send_click_in_deep (Event* ev, Doc* doc, ETree* t, Pos down_pos, Pos up_pos, SDL_Window* window, SDL_Renderer* renderer, ref ETree* deepest) {
    bool 
    valid_e (ETree* t) {
        return
            pos_in_rect (down_pos, t.e.pos, t.e.size) &&
            pos_in_rect (up_pos,   t.e.pos, t.e.size);
    }

    // klass event
    foreach (_t; FindDeepest (t,&valid_e)) {
        writeln ("deep: ", *_t.e);
        foreach (kls; _t.e.klasses)
            if (kls.event !is null)
                kls.event (kls,doc,ev,window,renderer,_t);
        deepest = _t;
    }
}

void
send_event_in_tree (Event* ev, Doc* doc, ETree* t, SDL_Window* window, SDL_Renderer* renderer) {
    // klass event
    foreach (_t; WalkTree (t)) {
        foreach (kls; _t.e.klasses)
            if (kls.event !is null)
                kls.event (kls,doc,ev,window,renderer,_t);
    }
}

void
add_class (E* e, Doc* doc, string s) {
    Klass* kls = doc.find_klass_or_create (s);
    if (!e.klasses.canFind (kls))
        e.klasses ~= kls;
}

void
remove_class_from_all (Doc* doc, string s) {
    auto kls = doc.find_klass (s);
    if (kls !is null)
        foreach (t; WalkTree (doc.tree))
            remove_class (t.e, kls);
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
    foreach (t; WalkTree (doc.tree))
        apply_klasses (doc,t);
}

void
apply_klasses (Doc* doc, ETree* t) {
    auto e = t.e;
    e.on.length = 0;
    global_font_files.length = 0;
    // remove e added from klass
    ETree*[] for_remove;
    foreach (_t; WalkChilds (t))
        if (_t.e.added_from !is null)
            for_remove ~= _t;
    foreach (_t; for_remove)
        t.remove_child (_t);
    // set 
    foreach (Klass* kls; e.klasses)
        apply_klass (doc,t,kls);
}

// WIDGET_APPLY_KLASS_FN
void
apply_klass (Doc* doc, ETree* t, Klass* kls) {
    auto e = t.e;

    // add e from klass
    ETree* current_t = t;
    Klass* e_klass = doc.find_klass_or_create ("e");
    foreach (ref t_line; kls.tree_tokens)
        add_child_e (doc,e_klass,t_line,t.indent,kls,current_t);

    // set fields
    foreach (field; kls.fields) {
        // `command` -> exec command -> output
        string[] values;
        values.reserve (field.values.length);
        foreach (v; field.values) 
            if (v.startsWith ("`")) 
                values ~= extract_value (doc,v);
            else
                values ~= v;

        // klasses set
        foreach (_kls; e.klasses)
            if (_kls.set !is null)
                _kls.set (_kls,doc,t,field.id,values);
    }
}


//void
//_on_start (Doc* doc, E* e) {
//    foreach (_on; e.on)
//        if (_on.event == "start")
//            exec_action (doc, _on.action);
//}


alias PTR = TTF_Font*;
static
PTR[string] global_fonts;
static
PTR default_ptr;

void
load_fonts (Doc* doc) {
    auto default_file = DEFAULT_FONT_FILE;
    auto default_size = DEFAULT_FONT_SIZE;
    if (default_ptr is null)
        default_ptr  = open_font (default_file,default_size);

    foreach (t; WalkTree (doc.tree)) {
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

    foreach (t; WalkTree (doc.tree))
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
load_images (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
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
load_texts (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
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
    foreach (ETree* t; WalkTree (doc.tree))
        update_pos (doc,t);
}

void
dump_sizes (Doc* doc) {
    dump_size (doc,doc.tree); // recursive
}

void
dump_size (Doc* doc, ETree* t, int level=0) {
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
    E* e = t.e;

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
    foreach (tc; WalkChilds (t))
        update_size (doc,tc);

    // update childs size`s
    //   max
}

void
e_size_w_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.size.w = e.size.w;
    if ((-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r) > 0)
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    else
        e.content.size.w = 0;
}

void
e_size_w_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e_content_size_w (doc,t);
    update_pos (doc,t);
    e.size.w = (e.borders.l.w + e.pad.l + e.content.size.w + e.pad.r + e.borders.r.w).to!W;
}

void
e_size_w_parent (Doc* doc, ETree* t) {
    auto e = t.e;
    if (t.parent !is null) {
        e.size.w = t.parent.e.content.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
    else {
        e.size.w = doc.size.w;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
}

void
e_size_w_window (Doc* doc, ETree* t) {
    auto e = t.e;
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
    auto e = t.e;

    W all_left;
    foreach (_t; WalkLeft (t))
        all_left += _t.e.size.w;

    if (t.parent.e.content.size.w > all_left) {
        e.size.w = (t.parent.e.content.size.w - all_left).to!W;
        e.content.size.w = (-e.borders.l.w - e.pad.l + e.size.w - e.borders.r.w - e.pad.r).to!W;
    }
    else {
        e.size.w = 0;
        e.content.size.w = 0;
    }
}

void
e_size_h_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.size.h = e.size.h;
    if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
        e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
    else
        e.content.size.h = 0;
}

void
e_size_h_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e_content_size_h (doc,t);
    update_pos (doc,t);
    e.size.h = (e.borders.t.w + e.pad.t + e.content.size.h + e.pad.b + e.borders.b.w).to!H;
}

void
e_size_h_parent (Doc* doc, ETree* t) {
    auto e = t.e;
    if (t.parent !is null) {
        e.size.h = t.parent.e.content.size.h;
        if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
            e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
        else
            e.content.size.h = 0;
    }
    else {
        e.size.h = doc.size.h;
        if ((-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b) > 0)
            e.content.size.h = (-e.borders.t.w - e.pad.t + e.size.h - e.borders.b.w - e.pad.b).to!H;
        else
            e.content.size.h = 0;
    }
}

void
e_size_h_window (Doc* doc, ETree* t) {
    auto e = t.e;
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
    auto e = t.e;
    // e.size.h = 
    // e.content.size.h = ;
}

void
e_content_size_w (Doc* doc, ETree* t) {
    auto e = t.e;

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
    auto e = t.e;
    e.content.size.w = e.size.w;
}

void
e_content_size_w_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.content.size.w = e.content.size.w;
}

void
e_content_size_w_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.w = e.content.image.size.w;
}

void
e_content_size_w_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.w = e.content.text.size.w;
}

void
e_content_size_w_childs (Doc* doc, ETree* t) {
    auto e = t.e;
    e_content_childs_size (doc,t);
    e.content.size.w = e.content.childs_size.w;
}

void
e_content_childs_size (Doc* doc, ETree* t) {
    auto e = t.e;

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
    auto e = t.e;
    e.content.size.w = max (e.content.image.size.w, e.content.text.size.w);
}

void
e_content_size_h (Doc* doc, ETree* t) {
    auto e = t.e;

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
    auto e = t.e;
    e.content.size.h = e.size.h;
}

void
e_content_size_h_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.content.size.w = e.content.size.w;
}

void
e_content_size_h_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = e.content.image.size.h;
}

void
e_content_size_h_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = e.content.text.size.h;
}

void
e_content_size_h_childs (Doc* doc, ETree* t) {
    auto e = t.e;
    e_content_childs_size (doc,t);
    e.content.size.h = e.content.childs_size.h;
}

void
e_content_size_h_max (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = max (e.content.image.size.h, e.content.text.size.h);
}

void
e_content_image_size_w (Doc* doc, ETree* t) {
    auto e = t.e;

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
    auto e = t.e;
    e.content.image.size.w = e.content.image.size.w;
}

void 
e_content_image_size_w_image (Doc* doc, ETree* t) {
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
e_content_image_size_w_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.text.size.w;
}

void 
e_content_image_size_w_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.size.w;
}

void
e_content_image_size_h (Doc* doc, ETree* t) {
    auto e = t.e;

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
    auto e = t.e;
    e.content.image.size.h = e.content.image.size.h;
}

void 
e_content_image_size_h_image (Doc* doc, ETree* t) {
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
e_content_image_size_h_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.text.size.h;
}

void 
e_content_image_size_h_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.size.h;
}


void
e_content_text_size_w (Doc* doc, ETree* t) {
    auto e = t.e;

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
    auto e = t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_w_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.w = e.content.image.size.w;
}

void 
e_content_text_size_w_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.w = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).w;
}

void 
e_content_text_size_w_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.w = e.content.size.w;
}

void
e_content_text_size_h (Doc* doc, ETree* t) {
    auto e = t.e;

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
    auto e = t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_h_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.h = e.content.image.size.h;
}

void 
e_content_text_size_h_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.h = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).h;
}

void 
e_content_text_size_h_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.h = e.content.size.h;
}




void
update_pos (Doc* doc, ETree* t) {
    E* e = t.e;

    if (t.e is null)
        return;

    //
    final
    switch (e.pos_type) {
        case E.PosType.t9   : pos_type_t9   (t); break;
        case E.PosType.t3   : pos_type_t3   (t); break;
        case E.PosType.grid : pos_type_grid (t); break;
        case E.PosType.vbox : pos_type_vbox (t); break;
        case E.PosType.hbox : pos_type_hbox (t); break;
        case E.PosType.none : pos_type_none (t); break;
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
    E* e = t.e;

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
    E* e = t.e;

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
    E* e = t.e;

    ETree* prev = find_last_with_type (t, e.pos_type);
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
pos_type_hbox (ETree* t) {
    // e e e
    E* e = t.e;

    ETree* prev = find_last_with_type (t, e.pos_type);
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
pos_type_none (ETree* t) {
    E* e = t.e;
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
go_event_action (Doc* doc, E* e, string[] action, string[string] env=null) {
    exec_action (doc,action,env);
}

void
exec_action (Doc* doc, string[] action, string[string] env=null) {
    import std.process;
    
    if (action.length) {
        writeln ("action: ", action);
        string[] cmd = doc_get_klass_field_value (doc,action[0]);
        if (cmd.length)
            goto exec;
        else
            cmd = action;
        
        //
    exec:
        if (cmd.length) {
            // raw exec
            writeln ("  exec: ", cmd, " ", env);
            if (env !is null) 
                auto pid = spawnProcess (cmd,env);
            else
                auto pid = spawnProcess (cmd);
        }    
    }
}

string[]
doc_get_klass_field_value (Doc* doc, string s) {
    auto dot = s.indexOf ('.');
    if (dot != -1) {
        // class field
        auto klass_name  = s[0..dot];
        auto klass_field = s[dot+1..$];
        auto kls = doc.find_klass (klass_name);
        if (kls !is null) {
            string[] values;
            if (kls.find (klass_field, values)) {
                return values;// OK
            }
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
version (question_)
void
go_question_subclass (string[] s) {
    import std.process;

    if (action.length) {
        if (s[0] == "?") {
            if (s.length >= 2) {
                auto ret = execute (action[1..$]);  // (int status, string output)
                writeln (ret.status);
                writeln (ret.output);
                foreach (c; WalkChilds (this))
                    if (c.name == ret.output) {
                        // ...
                    }
            }
        }
    }
}

//title
//  text ? audtool current-song
version (question_)
void
go_question_value (string[] s) {
    import std.process;

    if (action.length) {
        if (s[0] == "?") {
            if (s.length >= 2) {
                auto ret = execute (action[1..$]);  // (int status, string output)
                writeln (ret.status);
                writeln (ret.output);
            }
        }
    }
}

void
on_click (Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    auto click_ev = cast (ClickUserEvent*) ev;
    _on_click (
        doc, 
        click_ev.down_pos, 
        click_ev.up_pos, 
        ev,
        window,
        renderer
    );
}

void
_on_click (Doc* doc, Pos down_pos, Pos up_pos, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    writeln (down_pos, " ", up_pos);

    //
    ETree* deepest;
    send_click_in_deep (
        ev, 
        doc, 
        doc.tree, 
        down_pos,
        up_pos,
        window,
        renderer,
        deepest);

    // focused
    remove_class_from_all (doc,"focused");
    if (deepest !is null)
        deepest.e.add_class (doc,"focused");

    //
    doc.update (doc);
    send_redraw_window (window);
}

bool
pos_in_rect (Pos pos, Pos rect_pos, Size rect_size) {
    if (rect_pos.x <= pos.x && rect_pos.x + rect_size.w > pos.x)
    if (rect_pos.y <= pos.y && rect_pos.y + rect_size.h > pos.y)
        return true;

    return false;
}


int
event (Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    // event
    //   KEYS  --> focused
    //   CLICK --> all
    //   *     --> all
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("DOC.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                auto pressed_e = doc.find_e_at_pos (Pos (ev.button.x.to!X,ev.button.y.to!Y));
                if (pressed_e !is null)
                    pressed_e.add_class (doc,"button-pressed");
                writeln ("pressed_e: ", *pressed_e);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED) {
                remove_class_from_all (doc,"button-pressed");
            }
            break;
        case SDL_KEYDOWN: break;// SDL_KeyboardEvent
        case SDL_KEYUP: break;
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.start : send_event_in_tree (ev,doc,doc.tree,window,renderer); break;
                case USER_EVENT.click : on_click (doc,ev,window,renderer); break;
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
    // 0
    if (doc.window !is null)
        doc.size = doc.window.size;
    // 1
    doc.doc_apply_klasses ();
    // 2
    doc.load_images ();
    // 3
    doc.load_fonts ();
    // 4
    doc.load_colors ();
    // 5
    doc.load_texts ();
    // 6
    // 7
    doc.update_sizes ();
    //doc.dump_sizes ();
    // ...
    // 8
    // 9
    doc.update_poses ();
}

void
draw (Doc* doc, SDL_Renderer* renderer) {
    foreach (t; WalkTree (doc.tree)) {
        foreach (Klass* kls; t.e.klasses) {
            if (kls.draw !is null)
                kls.draw (kls,renderer,t);
        }
        if (t.e.draw !is null)
            t.e.draw (t.e,renderer);
    }
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
