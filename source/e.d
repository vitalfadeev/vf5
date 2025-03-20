import std.stdio;
import std.format;
import std.string;
import std.conv;
import bindbc.sdl;
import etree;
import klass : Klass;
import field : Field;
import e_update : TemplateArg;
import e_generator : Generator;
import types;
import tstring;
import events;
import pix : Window, IMAGE_PTR, FONT_PTR, TEXT_PTR;


alias E_EVENT_FN  = void function (E* e, Event* ev);
alias E_UPDATE_FN = void function (E* e, UpdateUserEvent* ev);
alias E_SET_FN    = void function (E* e, string field_id, TString[] values);
alias E_DRAW_FN   = void function (E* e, DrawUserEvent* ev);
alias E_DUP_FN    = EPtr function (EPtr _this);
alias EPtr = E*;

static
Klass*[] reserved_klasses;

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
    Field*[]   fields;     //   text abc

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
    Generator  generator;
    TemplateArg[] template_args;
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
        Color    color;
        Image    image;
        Text     text;

        Size     size;
        Size     childs_size;
        SizeType size_w_type = SizeType.e;
        SizeType size_h_type = SizeType.e;
        Pos      pos;

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
            Color      fg = Color (0xFF, 0xFF, 0xFF, 0xFF);
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
            childs,
            image,
            text,
            max,   // max (image,text)
            childs_image_text,
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
    update (UpdateUserEvent* ev) { 
        if (fn.update !is null) fn.update (&this,ev); 
    }

    void 
    set (string field_id, TString[] values) {
        if (fn.set !is null) fn.set (&this,field_id,values); 
    }

    void 
    draw (DrawUserEvent* ev) {
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
        focused       = focused.init;
        margin        = margin.init;
        aura          = aura.init;
        _content      = _content.init;
        hidden        = hidden.init;
        pos_type      = PosType.none; //
        pos_group     = pos_group.init;
        pos_dir       = pos_dir.init;
        pos_percent   = pos_percent.init;
        size_w_type   = SizeType.parent; //
        size_h_type   = SizeType.parent; //
        //generator     = generator.init;
        on.length     = 0;

        // remove e added from klass
        {
            E*[] for_remove;
            foreach (_e; WalkChilds (&this))
                if (_e.from_klass !is null)
                    for_remove ~= _e;
            foreach (_e; for_remove)
                (&this).remove_child (_e);
        }

        // remove e added from template
        {
            E*[] for_remove;
            foreach (_e; WalkChilds (&this))
                if (_e.from_template !is null)
                    for_remove ~= _e;
            foreach (_e; for_remove)
                (&this).remove_child (_e);
        }
    }

    string
    e_klasses_to_string () {
        string ks;
        foreach (Klass* kls; klasses)
            ks ~= kls.name ~ " ";
        ks = ks.stripRight ();

        return ks;
    }

    //
    string
    toString () {
        string fs;
        foreach (Field* f; fields)
            fs ~= f.name ~ " ";
        fs = fs.stripRight ();
        
        return format!"E(%s) (%s)" (e_klasses_to_string,fs);
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

bool
has_klass (E* e, Klass* kls) {
    import std.algorithm.searching : canFind;
    return e.klasses.canFind (kls);
}

bool
has_klass (E* e, string s) {
    auto kls = find_klass (e,s);
    assert (kls !is null);
    return has_klass (e,kls);
}

Klass*
find_klass_or_create (E* e, string s) {
    auto kls = find_klass (e,s);
    if (kls is null)
        kls = create_klass (e,s);
    return kls;
}

Klass*
find_klass (E* e, string s) {
    // in e, in parents
    for (auto _e=e; _e !is null; _e = _e.parent) {
        foreach (kls; _e.defined_klasses)
            if (kls.name == s)
                return kls;
    }

    // in reserved
    foreach (kls; reserved_klasses)
        if (kls.name == s)
            return kls;

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
    // find root
    for (auto _e=e; _e !is null; _e = _e.parent) {
        if (_e.parent is null) {
            auto root = _e;
            root.defined_klasses ~= kls;
            break;
        }
    }
}


void
add_klass (E* e, string s) {
    import std.algorithm.searching : canFind;
    Klass* kls = e.find_klass_or_create (s);
    if (!e.klasses.canFind (kls))
        e.klasses ~= kls;
}


void
trigger_class (E* e, string s) {
    if (e.has_klass ("check.pressed"))
        e.remove_klass ("check.pressed");
    else
        e.add_klass ("check.pressed");
}


void
remove_klass (E* e, string s) {
    auto kls = e.find_klass (s);
    if (kls !is null)
        e.remove_klass (kls);
}

void
remove_klass (E* e, Klass* kls) {
    import std.algorithm.searching : countUntil;
    import std.algorithm : remove;

    auto i = e.klasses.countUntil (kls);
    if (i != -1)
        e.klasses = e.klasses.remove (i);
}


void
dump_klasses (E* e) {
    foreach (kls; e.defined_klasses) {
        writeln (*kls);
        foreach (fld; kls.fields) {
            writefln ("  %s", *fld);
            foreach (_fld; fld.fields) {
                writefln ("    %s", *_fld);
            }
        }
    }
}

//void
//send_event_in_childs (E* e, Event* ev) {
//    foreach (_e; WalkChilds (e))
//        _e.event (ev);
//}


void
event (E* e, Event* ev) {
    import bindbc.sdl;

    version (debug_event)
    if (ev.type != SDL_MOUSEMOTION)
        writefln ("E(%s).event: %s", e.e_klasses_to_string, *ev);

    // via klasses
    foreach (Klass* kls; e.klasses)
        kls.event (ev,e);

    // to up
    if (e.parent !is null)
        e.parent.event (ev);

}

void
update (E* e, UpdateUserEvent* ev) {
    // custom update
    // ...

    // via klasses
    foreach (kls; e.klasses) {
        //import klasses.e;
        //if (kls.name == "e")
        //    klasses.e.update (kls,ev,e);
        //else
        kls.update (ev,e);
    }

    // to childs
    foreach (_e; WalkChilds (e)) {
        _e.update (ev);
    }
}

void
set (E* e, string field_id, TString[] values) {
    //
}

void
draw (E* e, DrawUserEvent* ev) {
    // custom draw
    // ...

    // via klasses
    foreach (kls; e.klasses) {
        kls.draw (ev,e);
    }

    // to childs
    foreach (_e; WalkChilds (e))
        _e.draw (ev);
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


bool
event_for_me (Klass* kls, SDL_MouseWheelEvent* ev, E* e) {
    Pos _pos = Pos (ev.mouseX, ev.mouseY);
    return pos_in_rect (_pos, e.pos, e.size);
}

bool
event_for_me (Klass* kls, SDL_MouseButtonEvent* ev, E* e) {
    Pos _pos = Pos (ev.x, ev.y);
    return pos_in_rect (_pos, e.pos, e.size);
}

bool
event_for_me (Klass* kls, ClickUserEvent* ev, E* e) {
    Pos _pos = ev.up_pos;
    return pos_in_rect (_pos, e.pos, e.size);
}
