import std.stdio;
import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import tstring;
import etree;
import klass;
import types;
import events;
import pix : Window, IMAGE_PTR, FONT_PTR, TEXT_PTR;
import generator : Generator;
import doc : apply_e_klasses,
    load_e_font,load_e_colors,load_e_text,load_e_image,time_step,
    update_e_size,update_e_pos,load_e_childs;


alias E_EVENT_FN  = void function (E* e, Event* ev);
alias E_UPDATE_FN = void function (E* e);
alias E_SET_FN    = void function (E* e, string field_id, TString[] values);
alias E_DRAW_FN   = void function (E* e, Event* ev);
alias E_DUP_FN    = EPtr function (EPtr _this);
alias EPtr = E*;

// form
//   type none, rect, 3, 4, 5, 6, 7, 8
//
// margin
//   aura
//     content
//       bg
//       image
//       text
//       childs
//
// margin
//   borders
//   aura
//     borders
//     content
//       borders

struct 
E {
    Tree      _super;
    Klass*[]   klasses;    // box green rounded

    Margin     margin;
    Aura       aura;
    Content   _content;

    Pos        pos;        // relative from parent
    PosType    pos_type = PosType.none;
    ubyte      pos_group;
    PosDir     pos_dir;
    byte       pos_percent;
    Size       size;       // = content.size + aura.size
    SizeType   size_w_type = SizeType.parent;
    SizeType   size_h_type = SizeType.parent;
    bool       hidden;
    Klass*     from_klass;
    Klass*     from_template;
    _Generator generator;
    On[]       on;
    Fn         fn;

    // root
    Klass*[] defined_klasses;
    Window*  window;
    Klass*   hotkeys;
    E*       focused;

    //
    struct
    Margin {
        Form   form;
        Border border;
        Size   size;
        Color  color;

        Pos    pos;
    }

    struct
    Aura {
        Form   form;
        Border border = Border (1, Border.Type.solid);;
        Size   size;
        Color  color;

        Pos    pos;
    }

    struct
    Content {
        Form     form;
        Border   border;
        Size     size;
        Color    color;
        Pos      pos;
        Size     childs_size;
        SizeType size_w_type = SizeType.e;
        SizeType size_h_type = SizeType.e;
        Image    image;
        Text     text;

        // childs
        // image
        // text
        struct
        Image {
          string    src;       // "abc"
          Color     bg;
          Pos       pos;
          Size      size = Size (100,100);
          SizeType  size_w_type;
          SizeType  size_h_type;
          IMAGE_PTR ptr;

          enum
          SizeType {
            fixed,
            image,
            text,
            content,
          }
        }

        struct
        Text {
            string     s;            // "abc"
            Font       font;
            Color      fg;
            Color      bg;
            Pos        pos;
            PosType    pos_type;
            Size       size;
            SizeType   size_w_type;
            SizeType   size_h_type;
            TextRect[] rects;

            struct 
            Font {
                string    file;    // "abc"
                string    family;  // "abc"
                ubyte     size;    // 0..256
                bool      bold;    // 0/1
                bool      italic;  // 0/1
                FONT_PTR  ptr;     // ...
            }
  
            enum
            SizeType {
                fixed,
                image,
                text,
                content,
            }
  
            struct
            TextRect {
                Pos      pos;
                Size     size;
                string   s;  // chars[a..b]
                TEXT_PTR ptr;
            }
        }

        enum 
        SizeType {
            e,
            fixed, 
            image,
            text,
            childs,
            max,   // max (image,text)
        }
    }

    struct
    Form {
        Type type = Type.rect;
        enum
        Type {
            none,
            rect,
            custom,
            t3,
            t4,
            t5,
            t6,
            t7,
            t8,
        }
    }

    struct
    Border {         // brush
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

    // e-list
    //   generator       fs
    //   generator       cmd `command` delimiter |
    //   generator       csv /path/to/file.csv
    //   generator.klass list-template

    struct
    _Generator {
        Type       type;      // cmd `command` delimiter | skip 1
        union {
            None   none;
            Cmd    cmd;
            Fs     fs;
            Csv    csv;
        }
        Tpl        tpl;
        size_t     offset;
        size_t     limit;
        Generator* ptr;

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
                case Type.none: return "Generator ("~ type.to!string ~")";
                case Type.cmd : return "Generator ("~ type.to!string ~ "," ~ cmd.to!string ~")";
                case Type.fs  : return "Generator ("~ type.to!string ~")";
                case Type.csv : return "Generator ("~ type.to!string ~")";
            }
        }
    }

    struct
    On {
        string    event;  // click
        TString[] action; // audacious --play-pause
    }

    struct
    Fn {
        E_EVENT_FN  event  = &.event;
        E_UPDATE_FN update = &.update;
        E_SET_FN    set    = &.set;
        E_DRAW_FN   draw   = &.draw;
        E_DUP_FN    dup    = &._dup;        
    }

    void 
    event (Event* ev) { 
        if (fn.event !is null) fn.event (&this,ev); 
    }

    void 
    update () { 
        if (fn.update !is null) fn.update (&this); 
    }

    void 
    set (string field_id, TString[] values) {
        if (fn.set !is null) fn.set (&this,field_id,values); 
    }

    void 
    draw (Event* ev) {
        if (fn.draw !is null) fn.draw (&this,ev);
    }

    void
    remove_child (E* c) {
        etree.remove_child (&this, c);
    }

    auto ref 
    parent () { 
        return cast (E*) _super.parent; 
    }


    void
    reset () {
        pos           = pos.init;
        size          = size.init;
        hotkeys       = hotkeys.init;
        window        = window.init;
        focused       = focused.init;
        margin        = margin.init;
        aura          = aura.init;
        _content      = _content.init;
        hidden        = hidden.init;
        from_klass    = from_klass.init;
        from_template = from_template.init;
        pos_type      = PosType.none; //
        pos_group     = pos_group.init;
        pos_dir       = pos_dir.init;
        pos_percent   = pos_percent.init;
        size_w_type   = SizeType.parent; //
        size_h_type   = SizeType.parent; //
        generator     = generator.init;
        on.length     = 0;

        // remove e added from klass
        E*[] for_remove;
        foreach (_e; WalkChilds (&this))
            if (_e.from_klass !is null)
                for_remove ~= _e;
        foreach (_e; for_remove)
            (&this).remove_child (_e);
    }

    //
    string
    toString () {
        string ks;
        foreach (Klass* kls; klasses)
            ks ~= kls.name ~ " ";
        
        return "E(" ~ ks ~ ")";
    }
}


auto 
content (E* e) {
    return _Content (e,&e._content);
}
struct
_Content {
    E* e;
    E.Content* _content;
    alias _content this;

    auto ref
    childs () {
        return e.childs;
    }
}


void
add_klass (E* e, Klass* kls) {
    e.klasses ~= kls;
}


void
event (E* e, Event* ev) {
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("E.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.draw : e.draw (ev); break;
                default:
            }
            break;
        default: 
    }
}

void
update (E* e) {
    writefln ("%-60s", e.toString);
    e.reset ();
    time_step ("");

    // 1
    if (e.klasses.length)
        e.apply_e_klasses ();
    time_step ("apply_e_klasses");

    // 2
    if (e.content.image.src.length)
        load_e_image (e);
    time_step ("load_e_image");

    // 3
    if (e.content.text.s.length)
        e.load_e_font ();
    time_step ("load_e_font");
    
    // 4
    e.load_e_colors ();
    time_step ("load_e_colors");

    // 5
    if (e.content.text.s.length)
        e.load_e_text ();
    time_step ("load_e_text");

    // 6
    if (1)
        e.update_e_size ();
    time_step ("update_e_size");

    // 7
    if (1)
        e.update_e_pos ();
    time_step ("update_e_pos");

    // 8
    if (e.generator.type != E._Generator.Type.none)
        e.load_e_childs ();
    time_step ("load_e_childs");

    // 9

    // childs
    foreach (_e; WalkChilds (e)) 
        _e.update ();

    // custom update
    // ...
}

void
set (E* e, string field_id, TString[] values) {
    //
}

void
draw (E* e, Event* ev) {
    foreach (Klass* kls; e.klasses)
        kls.draw (ev,e);

    // childs
    foreach (_e; WalkChilds (e))
        _e.event (ev);

    // custom draw
    // ...
}

EPtr
_dup (EPtr _this) {
     auto cloned = new E ();

     cloned.klasses       = _this.klasses.dup;
     cloned.pos           = _this.pos;
     cloned.size          = _this.size;
     cloned.aura          = _this.aura;
     cloned._content      = _this._content;
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
     //cloned.childs_src    = _this.childs_src;
     //cloned.childs_src.tpl.src 
     //                     = _this.childs_src.tpl.src.dup;
     //cloned.childs_src.tpl.dst 
     //                     = _this.childs_src.tpl.dst.dup;
     cloned.on            = _this.on.dup;
     foreach (ref _on; cloned.on)
        _on.action = _on.action.dup;
     cloned.fn         = _this.fn;

     return cloned;
}
