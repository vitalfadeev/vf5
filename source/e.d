import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import doc;
import etree;
import klass;
import types;
import events : Event;


alias E_EVENT_FN  = void function (E* e, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer);
alias E_UPDATE_FN = void function (E* e, Doc* doc);
alias E_SET_FN    = void function (E* e, Doc* doc, ETree* t, string field_id, string[] values);
alias E_DRAW_FN   = void function (E* e, SDL_Renderer* renderer);


struct 
E {
    Klass*[] klasses;    // box green rounded
    Pos  pos;
    Size size;
    //bool pos_x_auto;
    //bool pos_y_auto;
    //bool size_w_auto;
    //bool size_h_auto;
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
        Pos pos;
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
        Pos  pos;
        Size size;
        Size childs_size;
        enum 
        SizeType {
            e, // default
            fixed, 
            image,
            text,
            childs,
            max,   // max (image,text)
        }
        SizeType size_w_type;
        SizeType size_h_type;
        struct
        Text {
          string s;     // "abc"
          struct 
          Font {
            string    file;    // "abc"
            string    family;  // "abc"
            ubyte     size;    // 0..256
            bool      bold;    // 0/1
            bool      italic;  // 0/1
            TTF_Font*  ptr;     // 0/1
          }
          Font    font;
          Pos     pos;
          Size    size;
          Color   fg;
          Color   bg;
          Magnet  magnet;  // left / center / right
          PosType pos_type;
          enum
          SizeType {
            fixed,
            image,
            text,
            content,
          }
          SizeType size_w_type;
          SizeType size_h_type;
          struct
          TextRect {
              Pos    pos;
              Size   size;
              string s;  // chars[a..b]
              SDL_Texture* ptr;
          }
          TextRect[] rects;
        }
        Text text;

        struct
        Image {
          string src;       // "abc"
          Pos    pos;
          Size   size = Size (100,100);
          Color  bg;
          SDL_Surface* ptr;
          enum
          SizeType {
            fixed,
            image,
            text,
            content,
          }
          SizeType size_w_type;
          SizeType size_h_type;
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
    Klass*  added_from;

    PosType pos_type;
    ubyte   pos_group;
    PosDir  pos_dir;

    enum
    PosType : ubyte {
        none,
        t9,
        t3,
        grid,
        vbox,
        hbox,
    }
    enum
    PosDir : ubyte {
        r,
        l,
        t,
        b,
    }

    enum 
    SizeType {
        content, // default
        fixed,
        parent,
        window,
    }
    SizeType  size_w_type;
    SizeType  size_h_type;

    struct
    On {
        string   event;  // click
        string[] action; // exec audacious --play-pause
    }
    On[] on;

    E_EVENT_FN  event  = &.event;
    E_UPDATE_FN update = &.update;
    E_SET_FN    set    = &.set;
    E_DRAW_FN   draw   = &.draw;

    //
    //struct 
    //Cached {
    //    Size         size;
    //    Size         content_size;
    //    Size         content_image_size;
    //    SDL_Surface* content_image_ptr;
    //    Size         content_text_size;
    //}
    //Cached cached;

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


void
event (E* e, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("E.EVENT: ", ev.type);
}

void
update (E* e, Doc* doc) {
    //
}

void
set (E* e, Doc* doc, ETree* t, string field_id, string[] values) {
    //
}

void
draw (E* e, SDL_Renderer* renderer) {
    //
}

