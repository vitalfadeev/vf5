import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import doc;
import etree;
import klass;
import types;
import events : Event;
import pix : USER_EVENT;


alias E_EVENT_FN  = void function (E* e, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer);
alias E_UPDATE_FN = void function (E* e, Doc* doc);
alias E_SET_FN    = void function (E* e, Doc* doc, ETree* t, string field_id, string[] values);
alias E_DRAW_FN   = void function (E* e, SDL_Renderer* renderer);


struct 
E {
    Klass*[] klasses;    // box green rounded
    Pos  pos;
    Size size;
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
            TTF_Font*  ptr;    // ...
          }
          Font    font;
          Pos     pos;
          Size    size;
          Color   fg;
          Color   bg;
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
    string
    toString () {
        string ks;
        foreach (kls; klasses)
            ks ~= kls.name ~ " ";
        
        return "E(" ~ ks ~ ")";
    }
}


void
event (E* e, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("E.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");
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

