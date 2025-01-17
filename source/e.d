import klass;
import types;
import bindbc.sdl;


struct E {
    Klass*[] klasses;    // box green rounded
    Pos  pos  = Pos (10,10);
    Size size = Size (100,100);
    Pad  pad;
    BG   bg;

    struct
    Border {
        Type  type;  // none, solid, dash
        W     w;     // 0..255
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
        Border t = Border (Border.Type.solid, 8);
        Border r = Border (Border.Type.solid, 8);
        Border b = Border (Border.Type.solid, 8);
        Border l = Border (Border.Type.solid, 8);
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
    foreach (kls; e.klasses) {
        e.apply_klass (e,kls);
    }
}

void
apply_klass (E* e, Klass* k) {
    foreach (ke; k.klasse) {
        switch (ke.id) {
            case "pos.x"  : set_pos_x  (e, ke.values); break;
            case "pos.y"  : set_pos_y  (e, ke.values); break;
            case "pos"    : set_pos    (e, ke.values); break;
            case "size.w" : set_size_w (e, ke.values); break;
            case "size.h" : set_size_h (e, ke.values); break;
            case "size"   : set_size   (e, ke.values); break;
            case "text"   : set_text   (e, ke.values); break;
            case "hidden" : set_hidden (e, ke.values); break;
            case "popup"  : set_popup (e, ke.values); break;
            default:
        }
    }
}

void
set_pos (E* e, string[] values) {
    e.pos.x = 120;
    e.pos.y = 10;
}

void
set_pos_x (E* e, string[] values) {
    e.pos.x = 120;
}

void
set_pos_y (E* e, string[] values) {
    e.pos.y = 10;
}

void
set_size (E* e, string[] values) {
    e.size.w = 120;
    e.size.h = 32;
}

void
set_size_w (E* e, string[] values) {
    e.size.w = 120;
}

void
set_size_h (E* e, string[] values) {
    e.size.h = 32;
}

void
set_text (E* e, string[] values) {
    e.text.chars = "abc";
}

void
set_hidden (E* e, string[] values) {
    e.hidden = true;
}

void
set_popup (E* e, string[] values) {
    // e.popup = "popup-file";
}

