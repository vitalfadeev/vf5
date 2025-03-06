import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import tstring;
import doc;
import etree;
import klass;
import types;
import events;


alias E_EVENT_FN  = void function (E* e, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer);
alias E_UPDATE_FN = void function (E* e, Doc* doc);
alias E_SET_FN    = void function (E* e, Doc* doc, ETree* t, string field_id, TString[] values);
alias E_DRAW_FN   = void function (E* e, SDL_Renderer* renderer);
alias E_DUP_FN    = EPtr function (EPtr _this);
alias EPtr = E*;


struct 
E {
    Klass*[] klasses;    // box green rounded
    Pos      pos;
    Size     size;
    Pad      pad;
    BG       bg;

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
    Klass*  from_klass;
    Klass*  from_template;

    PosType pos_type;
    ubyte   pos_group;
    PosDir  pos_dir;
    byte    pos_percent;

    enum
    PosType : ubyte {
        none,
        t9,
        t3,
        grid,
        vbox,
        hbox,
        percent,
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
        max,
    }
    SizeType size_w_type;
    SizeType size_h_type;

    // e-list
    //   childs.src       fs
    //   childs.src       cmd `command` delimiter |
    //   childs.src       csv /path/to/file.csv
    //   childs.tpl.klass list-template
    //   childs.tpl.src   1         2    3
    //   childs.tpl.dst   image.src text text  // each e,m,v in (tree,map,values) e.set(m,v)
    struct
    ChildsSrc {
        Type     type;      // cmd `command` delimiter | skip 1
        union {
            None none;
            Cmd  cmd;
            Fs   fs;
            Csv  csv;
        }
        Tpl      tpl;
        size_t   offset;
        size_t   limit;

        enum 
        Type {
            none,
            cmd,
            fs,
            csv,
        }
        struct 
        None {
            //
        }
        struct 
        Cmd {
            TString command;   // `command`
            TString delimiter; // |
            size_t  skip;      // 1 (header line)
        }
        struct 
        Fs {
            //
        }
        struct 
        Csv {
            //
        }

        struct
        Tpl {
            string   klass;  // klass-name
            size_t[] src;    // 1         2    3
            string[] dst;    // image.src text text            
        }

        string
        toString () {
            final
            switch (type) {
                case Type.none: return "ChildsSrc ("~ type.to!string ~")";
                case Type.cmd : return "ChildsSrc ("~ type.to!string ~ "," ~ cmd.to!string ~")";
                case Type.fs  : return "ChildsSrc ("~ type.to!string ~")";
                case Type.csv : return "ChildsSrc ("~ type.to!string ~")";
            }
        }
    }
    ChildsSrc childs_src;

    struct
    On {
        string    event;  // click
        TString[] action; // exec audacious --play-pause
    }
    On[] on;

    E_EVENT_FN  event  = &.event;
    E_UPDATE_FN update = &.update;
    E_SET_FN    set    = &.set;
    E_DRAW_FN   draw   = &.draw;
    E_DUP_FN    dup    = &._dup;

    //
    string
    toString () {
        string ks;
        foreach (Klass* kls; klasses)
            ks ~= kls.name ~ " ";
        
        return "E(" ~ ks ~ ")";
    }
}


void
add_klass (E* e, Klass* kls) {
    e.klasses ~= kls;
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
set (E* e, Doc* doc, ETree* t, string field_id, TString[] values) {
    //
}

void
draw (E* e, SDL_Renderer* renderer) {
    //
}

EPtr
_dup (EPtr _this) {
     auto cloned = new E ();

     cloned.klasses       = _this.klasses.dup;
     cloned.pos           = _this.pos;
     cloned.size          = _this.size;
     cloned.pad           = _this.pad;
     cloned.bg            = _this.bg;
     cloned.borders       = _this.borders;
     cloned.corners       = _this.corners;
     cloned.content       = _this.content;
     cloned.content.text.rects 
                          = _this.content.text.rects.dup;
     cloned.hidden        = _this.hidden;
     cloned.from_klass    = _this.from_klass;
     cloned.from_template = _this.from_template;
     cloned.pos_type      = _this.pos_type;
     cloned.pos_group     = _this.pos_group;
     cloned.pos_dir       = _this.pos_dir;
     cloned.pos_percent   = _this.pos_percent;
     cloned.size_w_type   = _this.size_w_type;
     cloned.size_h_type   = _this.size_h_type;
     cloned.childs_src    = _this.childs_src;
     cloned.childs_src.tpl.src 
                          = _this.childs_src.tpl.src.dup;
     cloned.childs_src.tpl.dst 
                          = _this.childs_src.tpl.dst.dup;
     cloned.on            = _this.on.dup;
     foreach (ref _on; cloned.on)
        _on.action = _on.action.dup;
     cloned.event         = _this.event;
     cloned.update        = _this.update;
     cloned.set           = _this.set;
     cloned.draw          = _this.draw;

     return cloned;
}
