import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import klass;
import types;


struct E {
    Klass*[] klasses;    // box green rounded
    Pos  pos  = Pos (10,10);
    Size size = Size (100,100);
    bool pos_x_auto;
    bool pos_y_auto;
    bool size_w_auto;
    bool size_h_auto;
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
    Text {
      string chars;     // "abc"
      struct 
      Font {
        string family;  // "abc"
        ubyte  size;    // 0..256
        bool   bold;    // 0/1
        bool   italic;  // 0/1
      }
      Font font;
      Magnet magnet;  // left / center / right
    }
    Text text;

    struct
    Image {
      string src;       // "abc"
      void*  ptr;
      Size   size = Size (100,100);
    }
    Image image;

    struct 
    Magnet_ {
      Magnet left;      // -1/0/1
      Magnet right;     // -1/0/1
    }
    Magnet_ magnet;
    bool    hidden;
    
    //
    void function (SDL_Renderer* renderer, E* e) draw; // simple, bordered, bordered-titled, custom
    void function (E* e, Klass* klass) apply_klass = &.apply_klass;

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
apply_klasses (E* e) {
    foreach (Klass* kls; e.klasses)
        e.apply_klass (e,kls);
}

void
apply_klass (E* e, Klass* k) {
    foreach (ke; k.klasse) {
        switch (ke.id) {
            case "pos.x"   : set_pos_x   (e, ke.values); break;
            case "pos.y"   : set_pos_y   (e, ke.values); break;
            case "pos"     : set_pos     (e, ke.values); break;
            case "size.w"  : set_size_w  (e, ke.values); break;
            case "size.h"  : set_size_h  (e, ke.values); break;
            case "size"    : set_size    (e, ke.values); break;
            case "text"    : set_text    (e, ke.values); break;
            case "hidden"  : set_hidden  (e, ke.values); break;
            case "popup"   : set_popup   (e, ke.values); break;
            case "borders" : set_borders (e, ke.values); break;
            default:
        }
    }
}

void
set_pos (E* e, string[] values) {
    if (values.length >= 2) {
        set_pos_x (e, values[0..1]);
        set_pos_y (e, values[1..$]);
    }
    else
    if (values.length == 1) {
        set_pos_x (e, values[0..1]);
        set_pos_y (e, values[0..1]);
    }
}

void
set_pos_x (E* e, string[] values) {
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
set_pos_y (E* e, string[] values) {
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
set_size (E* e, string[] values) {
    if (values.length >= 2) {
        set_size_w (e, values[0..1]);
        set_size_h (e, values[1..$]);
    }
    else
    if (values.length == 1) {
        set_size_w (e, values[0..1]);
        set_size_h (e, values[0..1]);
    }
}

void
set_size_w (E* e, string[] values) {
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
set_size_h (E* e, string[] values) {
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
set_text (E* e, string[] values) {
    e.text.chars = "abc";
}

void
set_hidden (E* e, string[] values) {
    if (values.length) {
        if (values[0].isNumeric)
            e.hidden = values[0].to!int != 0;
    }
}

void
set_popup (E* e, string[] values) {
    // e.popup = "popup-file";
}

void
set_borders (E* e, string[] values) {
    if (values.length >= 3) {
        set_border (e, &e.borders.t, values[0..$]);
        set_border (e, &e.borders.r, values[0..$]);
        set_border (e, &e.borders.b, values[0..$]);
        set_border (e, &e.borders.l, values[0..$]);
    }
    else
    if (values.length >= 2) {
        set_border (e, &e.borders.t, values[0..$]);
        set_border (e, &e.borders.r, values[0..$]);
        set_border (e, &e.borders.b, values[0..$]);
        set_border (e, &e.borders.l, values[0..$]);
    }
    else
    if (values.length == 1) {
        set_border (e, &e.borders.t, values[0..$]);
        set_border (e, &e.borders.r, values[0..$]);
        set_border (e, &e.borders.b, values[0..$]);
        set_border (e, &e.borders.l, values[0..$]);
    }
}

void
set_border (E* e, E.Border* border, string[] values) {
    if (values.length >= 3) {
        set_border_w     (e, border, values[0..1]);
        set_border_type  (e, border, values[1..2]);
        set_border_color (e, border, values[2..3]);
    }
}

void
set_border_w (E* e, E.Border* border, string[] values) {
    if (values.length) {
        if (values[0].isNumeric)
            border.w = values[0].to!W;
    }
}

void
set_border_type (E* e, E.Border* border, string[] values) {
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
set_border_color (E* e, E.Border* border, string[] values) {
    if (values.length) {
        border.color = values[0].to_color;
    }
}

Color
to_color (string s) {
    return Color (SDL_Color (0xCC, 0xCC, 0xCC, 0xFF));
}
