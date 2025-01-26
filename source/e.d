import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import doc;
import klass;
import types;
import txt_parser;


struct E {
    Klass*[] klasses;    // box green rounded
    Pos  pos;
    Size size;
    bool pos_x_auto;
    bool pos_y_auto;
    bool size_w_auto;
    bool size_h_auto;
    bool content_image_size_w_auto;
    bool content_image_size_h_auto;
    Pad  pad;
    BG   bg;

    struct
    Border {
        W     w;     // 0..255
        Type  type;  // none, solid, dash
        Color color; // RGBA

        enum
        Type {
            none,
            solid,
            dash
        }
    }
    struct
    Borders {
        Border t = Border (1, Border.Type.solid);
        Border r = Border (1, Border.Type.solid);
        Border b = Border (1, Border.Type.solid);
        Border l = Border (1, Border.Type.solid);
    }
    Borders borders;

    struct 
    Corner {
        R     r;
        Color color; // RGBA
    }
    struct 
    Corners {
        Corner tl;
        Corner tr;
        Corner br;
        Corner bl;
    }
    Corners corners;

    struct
    Content {
        Size size;
        enum 
        SizeType {
            max_image_text, // default
            image,
            text,
            fixed,
            parent
        }
        SizeType size_type;
        struct
        Text {
          string s;     // "abc"
          struct 
          Font {
            string family;  // "abc"
            ubyte  size;    // 0..256
            bool   bold;    // 0/1
            bool   italic;  // 0/1
          }
          Font   font;
          Size   size;
          Color  color;
          Magnet magnet;  // left / center / right
          struct
          TextRect {
              Pos    pos;
              Size   size;
              string s;  // chars[a..b]
          }
          TextRect[] rects;
        }
        Text text;

        struct
        Image {
          string src;       // "abc"
          Size   size = Size (100,100);
          BG     bg;
          void*  ptr;
        }
        Image image;
    }
    Content content;

    struct 
    Magnet_ {
      Magnet left;      // -1/0/1
      Magnet right;     // -1/0/1
    }
    Magnet_ magnet;
    bool    hidden;

    PosType pos_type;
    ubyte   pos_group;
    PosDir  pos_dir;

    enum
    PosDir : ubyte {
        r,
        l,
        t,
        b,
    }
    enum
    PosType : ubyte {
        none,
        t9,
        grid,
    }

    SizeType        size_type;

    enum 
    SizeType {
        content, // default
        fixed,
        parent
    }

    struct
    On {
        string   event;  // click
        string[] action; // exec audacious --play-pause
    }
    On[] on;
    
    //
    void function (SDL_Renderer* renderer, E* e) draw; // simple, bordered, bordered-titled, custom
    void function (Doc* doc, E* e, Klass* klass) apply_klass = &.apply_klass;

    string
    toString () {
        string ks;
        foreach (kls; klasses)
            ks ~= kls.name ~ " ";
        
        return "E(" ~ ks ~ ")";
    }
}


enum
Magnet {
    no,
    none,
    yes
}


//
void
apply_klasses (Doc* doc, E* e) {
    writeln (*e, " ", e.apply_klass);
    e.on.length = 0;
    foreach (Klass* kls; e.klasses)
        e.apply_klass (doc,e,kls);
}

void
apply_klass (Doc* doc, E* e, Klass* k) {
    writeln (" ", k.name);
    foreach (ke; k.klasse) {
        writeln ("  ", ke.id);
        switch (ke.id) {
            case "pos.x"         : set_pos_x         (doc,e,ke.values); break;
            case "pos.y"         : set_pos_y         (doc,e,ke.values); break;
            case "pos"           : set_pos           (doc,e,ke.values); break;
            case "pos.type"      : set_pos_type      (doc,e,ke.values); break;
            case "pos.group"     : set_pos_group     (doc,e,ke.values); break;
            case "pos.dir"       : set_pos_dir       (doc,e,ke.values); break;
            case "size.w"        : set_size_w        (doc,e,ke.values); break;
            case "size.h"        : set_size_h        (doc,e,ke.values); break;
            case "size"          : set_size          (doc,e,ke.values); break;
            case "hidden"        : set_hidden        (doc,e,ke.values); break;
            case "popup"         : set_popup         (doc,e,ke.values); break;
            case "borders"       : set_borders       (doc,e,ke.values); break;
            case "borders.t"     : set_border_t      (doc,e,ke.values); break;
            case "borders.r"     : set_border_r      (doc,e,ke.values); break;
            case "borders.b"     : set_border_b      (doc,e,ke.values); break;
            case "borders.l"     : set_border_l      (doc,e,ke.values); break;
            case "content.image" : set_content_image (doc,e,ke.values); break;
            case "content.text"  : set_content_text  (doc,e,ke.values); break;
            case "content"       : set_content       (doc,e,ke.values); break;
            case "image"         : set_content_image (doc,e,ke.values); break;
            case "text"          : set_content_text  (doc,e,ke.values); break;
            case "text.color"    : set_text_color    (doc,e,ke.values); break;
            case "bg"            : set_bg            (doc,e,ke.values); break;
            case "on"            : set_on            (doc,e,ke.values); break;
            default:
        }
    }
}

void
set_pos (Doc* doc, E* e, string[] values) {
    if (values.length >= 2) {
        set_pos_x (doc, e, values[0..1]);
        set_pos_y (doc, e, values[1..$]);
    }
    else
    if (values.length == 1) {
        set_pos_x (doc, e, values[0..1]);
        set_pos_y (doc, e, values[0..1]);
    }
}

void
set_pos_type (Doc* doc, E* e, string[] values) {
    if (values.length >= 1) {
        switch (values[0]) {
            case "9"    : e.pos_type = E.PosType.t9; break;
            case "t9"   : e.pos_type = E.PosType.t9; break;
            case "grid" : e.pos_type = E.PosType.grid; break;
            default:
                e.pos_type = E.PosType.none;
        }
    }
}

void
set_pos_group (Doc* doc, E* e, string[] values) {
    if (values.length >= 1) {
        e.pos_group = values[0].to!ubyte;
    }
}

void
set_pos_dir (Doc* doc, E* e, string[] values) {
    if (values.length >= 1) {
        switch (values[0]) {
            case "r": e.pos_dir = E.PosDir.r; break;
            case "l": e.pos_dir = E.PosDir.l; break;
            case "t": e.pos_dir = E.PosDir.b; break;
            case "b": e.pos_dir = E.PosDir.l; break;
            default:
        }
    }
}

void
set_pos_x (Doc* doc, E* e, string[] values) {
    if (values.length) {
        if (values[0] == "auto")
            e.pos_x_auto = true;
        if (values[0].isNumeric ()) {
            e.pos.x = values[0].to!X;
            e.pos_x_auto = false;
        }
    }
}

void
set_pos_y (Doc* doc, E* e, string[] values) {
    if (values.length) {
        if (values[0] == "auto")
            e.pos_y_auto = true;
        if (values[0].isNumeric ()) {
            e.pos.y = values[0].to!Y;
            e.pos_y_auto = false;
        }
    }
}

void
set_size (Doc* doc, E* e, string[] values) {
    if (values.length >= 2) {
        set_size_w (doc, e, values[0..1]);
        set_size_h (doc, e, values[1..$]);
    }
    else
    if (values.length == 1) {
        set_size_w (doc, e, values[0..1]);
        set_size_h (doc, e, values[0..1]);
    }
}

void
set_size_w (Doc* doc, E* e, string[] values) {
    if (values.length) {
        if (values[0] == "auto")
            e.size_w_auto = true;
        if (values[0] == "max") {
            e.size.w = 640;
            e.size_w_auto = false;
        }
        if (values[0].isNumeric ()) {
            e.size.w = values[0].to!W;
            e.size_w_auto = false;
        }
    }
}

void
set_size_h (Doc* doc, E* e, string[] values) {
    if (values.length) {
        if (values[0] == "auto")
            e.size_h_auto = true;
        if (values[0].isNumeric ()) {
            e.size.h = values[0].to!H;
            e.size_h_auto = false;
        }
    }
}

void
set_hidden (Doc* doc, E* e, string[] values) {
    if (values.length) {
        if (values[0].isNumeric)
            e.hidden = values[0].to!int != 0;
    }
}

void
set_popup (Doc* doc, E* e, string[] values) {
    // e.popup = "popup-file";
}

void
set_borders (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.t, values[0..$]);
        set_border (doc, e, &e.borders.r, values[0..$]);
        set_border (doc, e, &e.borders.b, values[0..$]);
        set_border (doc, e, &e.borders.l, values[0..$]);
    }
    else
    if (values.length >= 2) {
        set_border (doc, e, &e.borders.t, values[0..$]);
        set_border (doc, e, &e.borders.r, values[0..$]);
        set_border (doc, e, &e.borders.b, values[0..$]);
        set_border (doc, e, &e.borders.l, values[0..$]);
    }
    else
    if (values.length == 1) {
        set_border (doc, e, &e.borders.t, values[0..$]);
        set_border (doc, e, &e.borders.r, values[0..$]);
        set_border (doc, e, &e.borders.b, values[0..$]);
        set_border (doc, e, &e.borders.l, values[0..$]);
    }
}

void
set_border_t (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.t, values[0..$]);
    }
}

void
set_border_r (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.r, values[0..$]);
    }
}

void
set_border_b (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.b, values[0..$]);
    }
}

void
set_border_l (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.l, values[0..$]);
    }
}

void
set_border (Doc* doc, E* e, E.Border* border, string[] values) {    
    if (values.length >= 3) {
        set_border_w     (doc, e, border, values[0..1]);
        set_border_type  (doc, e, border, values[1..2]);
        set_border_color (doc, e, border, values[2..3]);
    }
}

void
set_border_w (Doc* doc, E* e, E.Border* border, string[] values) {
    if (values.length) {
        if (values[0].isNumeric)
            border.w = values[0].to!W;
    }
}

void
set_border_type (Doc* doc, E* e, E.Border* border, string[] values) {
    if (values.length) {
        if (values[0] == "none")
            border.type = E.Border.Type.none;
        if (values[0] == "solid")
            border.type = E.Border.Type.solid;
        if (values[0] == "dash")
            border.type = E.Border.Type.dash;
    }
}

void
set_border_color (Doc* doc, E* e, E.Border* border, string[] values) {
    if (values.length) {
        Color c;
        if (parse_color (values[0], doc.colors, &c))
            border.color = c;
    }
}

void
set_content_image (Doc* doc, E* e, string[] values) {
    if (values.length) {
        e.content.image.src = values[0];    

        if (e.content.image.src.length) {
            auto img_surface = IMG_Load (e.content.image.src.toStringz);
            e.content.image.ptr = img_surface;
            e.content.image.size.w = cast(ushort)img_surface.w;
            e.content.image.size.h = cast(ushort)img_surface.h;
        }
        else
            e.content.image.ptr = null;
    }
}


void
set_content_text (Doc* doc, E* e, string[] values) {
    if (values.length) {
        e.content.text.s = values[0];
    }
}

void
set_text_color (Doc* doc, E* e, string[] values) {
    if (values.length) {
        Color c;
        if (parse_color (values[0], doc.colors, &c))
            e.content.text.color = c;
    }
}

void
set_bg (Doc* doc, E* e, string[] values) {
    if (values.length) {
        Color c;
        if (parse_color (values[0], doc.colors, &c))
            e.bg = c;
    }
}

void
set_content (Doc* doc, E* e, string[] values) {
    if (values.length) {
        //
    }
}

void
set_on (Doc* doc, E* e, string[] values) {
    if (values.length) {
        string event  = values[0];
        if (values.length == 1) {
            // no action
        }
        else
        if (values.length >= 2) {
            e.on ~= E.On (event,values[1..$]);
        }
    }
}

