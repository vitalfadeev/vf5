import std.stdio;
import std.format;
import std.string;
import std.conv;
import std.range : back;
import bindbc.sdl;
import etree;
import klass : Klass;
import klass : Klasses;
import field : Field;
import e_update : TemplateArg;
import e_generator : Generator;
import types;
import tstring;
import events;
import pix : IMAGE_PTR, FONT_PTR, TEXT_PTR;


alias E_EVENT_FN  = void function (E* e, Event* ev);
alias E_UPDATE_FN = void function (E* e, update_UserEvent* ev);
alias E_SET_FN    = void function (E* e, string field_id, TString[] values);
alias E_DRAW_FN   = void function (E* e, draw_UserEvent* ev);
alias E_DUP_FN    = EPtr function (EPtr _this);
alias EPtr = E*;

enum MAX_GROUP = 9;

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

//
// E_
//  E_ margin
//   E_ aura
//    E_ bg
//     E_ text
struct
E4 {  // margin
    Loca   loca;
    alias  loca this;
    //
    Color    color = Color (0xFF, 0xFF, 0xFF, 0xFF);
    Way      way;
    //
    Klass*[] klasses;      // box green rounded
    On[]     on;           // [click: audacious --play-pause]
    Fn       fn;           // event,update,draw,set
    Flags    flags;        // hidden,deleted
    E3      _inner;        // bordder,aura,content,childs,text,image
    //
    DefLoc   def_loc;      // def LocDef

    auto ref margin  () { return this; }
    auto ref border  () { return _inner; }
    auto ref aura    () { return _inner._inner; }
    auto ref content () { return _inner._inner._inner; }

    struct
    E3 {  // border
        Loca   loca;
        alias loca this;
        Color  color = Color (0xFF, 0xFF, 0xFF, 0xFF);
        Fn    fn;
        E2   _inner;

        //
        struct
        E2 {  // aura
            Loca   loca;
            alias loca this;
            Color  color = Color (0xFF, 0xFF, 0xFF, 0xFF);
            Fn    fn;
            E1   _inner;

            struct
            E1 {  // core  // content
                Loca   loca;
                alias loca this;
                Color  color = Color (0xFF, 0xFF, 0xFF, 0xFF);
                Fn     fn;  // &image_draw, &text_draw, &childs_draw
                void* _inner;

                Type type;
                union {
                    Image  image;
                    Text   text;
                    Childs childs;
                }

                enum
                Type {
                    _,
                    image,
                    text,
                    childs,
                }
            }
        }
    }

    struct
    Flags {
        bool hidden;
        bool deleted;
    }

    auto ref hidden ()  { return flags.hidden; }
    auto ref deleted () { return flags.deleted; }

    struct
    Fn {
        E_EVENT_FN  event  = &.event;
        E_UPDATE_FN update = &.update;
        E_SET_FN    set    = &.set;
        E_DRAW_FN   draw   = &.draw;
        E_DUP_FN    dup    = &._dup;        
    }

    struct
    On {
        string    event;  // click
        TString[] action; // audacious --play-pause
    }

    void 
    event (Event* ev) { 
        if (fn.event !is null) fn.event (&this,ev); 
    }

    void 
    update (update_UserEvent* ev) { 
        if (fn.update !is null) fn.update (&this,ev); 
    }

    void 
    set (string field_id, TString[] values) {
        if (fn.set !is null) fn.set (&this,field_id,values); 
    }

    void 
    draw (draw_UserEvent* ev) {
        if (fn.draw !is null) fn.draw (&this,ev);
    }

}


struct
Loca {
    Loc loc;   
    Loc length;
}

struct
Image {
    Loca loca;
    alias loca this;
    string    src;       // "abc"
    Color     color = Color (0xFF, 0xFF, 0xFF, 0xFF);
    Color     bg;
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
    Loca loca;
    alias loca this;
    Color      color = Color (0xFF, 0xFF, 0xFF, 0xFF);
    Color      bg;
    string     s;            // "abc"
    Font       font;
    //PosType    pos_type;
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
        Loca loca;
        alias loca this;
        string   s;  // chars[a..b]
        TEXT_PTR ptr;
    }
}

struct
Childs {
    Loca loca;
    alias loca this;
    E[] s;  // no links
}

alias E = E4;


/*
struct 
E_ {
    Tree         _super;
    Klass*[]      klasses;    // box green rounded
    Field*[]      fields;     //   text abc

    Margin        margin;
    Aura          aura;
    Content      _content;

    Loc            pos;        // relative from parent
    PosType[ORDS]  pos_type;
    Balance[ORDS]  pos_balance = [Balance (0,1), Balance (0,1)];
    Loc            size;       // = content.size + aura.size
    SizeType[ORDS] size_type;
    Way[ORDS]      way; //  ORD.X, ORD.Y
                        // -ORD.X, ORD.Y
                        //  ORD.Y, ORD.X
                        // -ORD.Y, ORD.X

    Limit         limit;

    bool          hidden;
    Klass*        from_klass;
    Klass*        from_template;
    Generator     generator;
    TemplateArg[] template_args;
    On[]          on;
    Fn            fn;

    // root
    Klass*[] defined_klasses;
    Window*  window;
    Klass*   hotkeys;
    E*       focused;

    Deep     deep;

    //
    struct
    Margin {
        Form   form;
        Border border;
        Loc    size;
        Color  color;

        Loc    pos;
    }

    struct
    Aura {
        Form   form;
        Border border = Border (1, Border.Type.solid);;
        Loc    size;
        Color  color;

        Loc    pos;
    }

    struct
    Content {
        Form     form;
        Border   border;
        Color    color;
        Image    image;
        Text     text;

        Loc      size;
        Loc      childs_size;
        SizeType size_w_type = SizeType.e;
        SizeType size_h_type = SizeType.e;
        Loc      pos;

        // childs
        // image
        // text
        struct
        Image {
          string    src;       // "abc"
          Color     bg;
          Loc       pos;
          Loc       size = Loc (100,100);
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
            Loc        pos;
            //PosType    pos_type;
            Loc        size;
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
                Loc      pos;
                Loc      size;
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
            max_,   // max (image,text)
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
    Overflow {
        _,
        scroll,
        pdmenu,
        dots,
    }

    enum
    OrganizeChilds {
        _,
        way,
        max_,
    }

    enum 
    SizeType {
        parent, // default
        fixed,
        content,
        window,
        max_,
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
        loc           = pos.init;
        size          = size.init;
        hotkeys       = hotkeys.init;
        focused       = focused.init;
        margin        = margin.init;
        aura          = aura.init;
        _content      = _content.init;
        hidden        = hidden.init;
        pos_type      = pos_type.init; //
        pos_balance   = pos_balance.init;
        way           = way.init;
        size_type     = size_type.init; //
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

    auto 
    content_pos () {
        return this.pos + this.aura.size;
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
*/

/*
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

    auto 
    limit () {
        return e.pos + _content.size;  // e.pos is relative
    }
}
*/


void
add_klass (E* e, Klasses* klasses, string name) {
    auto kls = klasses [name];
    add_klass (e.kls);
}
void
add_klass (E* e, Klass* kls) {
    import std.algorithm.searching : canFind;
    if (!e.klasses.canFind (kls))
        e.klasses ~= kls;
}

bool
has_klass (E* e, Klasses* klasses, string s) {
    auto kls = find_klass (klasses,s);
    assert (kls !is null);
    return has_klass (e,kls);
}
bool
has_klass (E* e, Klass* kls) {
    import std.algorithm.searching : canFind;
    return e.klasses.canFind (kls);
}

void
trigger_class (E* e, Klasses* klasses, string s) {
    if (e.has_klass (klasses,s))
        e.remove_klass (s);
    else
        e.add_klass (klasses,s);
}


void
remove_klass (E* e, Klasses* klasses, string s) {
    auto kls = find_klass (klasses,s);
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

E*
find_child (E* e, string klass_name) {
    foreach (_e; WalkChilds (e))
        if (_e.has_klass (klass_name))
            return _e; // found!

    return null;
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
update (E* e, update_UserEvent* ev) {
    // custom update
    // ...

    // via klasses
    foreach (kls; e.klasses)
        kls.update (ev,e);

    // to childs
    if (e.has_childs) {
        ev.path ~= e;
        ev.locs ~= 
            ev.locs.back
            + e.margin.loc
            + e.border.loc
            + e.aura.loc
            + e.content.loc;

        foreach (_e; WalkChilds (e))
            _e.update (ev);

        ev.locs.length--;
        ev.path.length--;
    }
}

void
set (E* e, string field_id, TString[] values) {
    //
}

void
draw (E* e, draw_UserEvent* ev) {
    // custom draw
    // ...

    // via klasses
    foreach (kls; e.klasses)
        kls.draw (ev,e);

    // to childs
    if (e.has_childs) {
        ev.path ~= e;
        ev.locs ~= 
            ev.locs.back
            + e.margin.loc
            + e.border.loc
            + e.aura.loc
            + e.content.loc;

        foreach (_e; WalkChilds (e))
            _e.draw (ev);

        ev.locs.length--;
        ev.path.length--;
    }
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
     cloned.way           = _this.way;
     cloned.size_type     = _this.size_type;
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
    Loc _pos = Loc (ev.mouseX, ev.mouseY);
    return pos_in_rect (_pos, e.pos, e.size);
}

bool
event_for_me (Klass* kls, SDL_MouseButtonEvent* ev, E* e) {
    Loc _pos = Loc (ev.x, ev.y);
    return pos_in_rect (_pos, e.pos, e.size);
}

bool
event_for_me (Klass* kls, click_UserEvent* ev, E* e) {
    Loc _pos = ev.up_pos;
    return pos_in_rect (_pos, e.pos, e.size);
}
