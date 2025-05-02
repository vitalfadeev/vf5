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
import std.traits : EnumMembers;


//alias E_EVENT_FN  = void function (E* e, Event* ev);
//alias E_UPDATE_FN = void function (E* e, update_UserEvent* ev);
//alias E_SET_FN    = void function (E* e, string field_id, TString[] values);
//alias E_DRAW_FN   = void function (E* e, draw_UserEvent* ev);
//alias E_DUP_FN    = EPtr function (EPtr _this);
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

//
// E_
//  E_ margin
//   E_ aura
//    E_ bg
//     E_ text
//
// borders
// e
//  borders
//
// borders.aura.content.text = abc
// e
//  borders
//   aura
//    content
//     type = text
//     text = abc
//
// struct e.borders.aura.content
// struct e4.e3.e2.e1
// struct e

//struct 
//E_ {
//    E4 e4;  // margin
//    E3 e3;  // border
//    E2 e2;  // aura
//    E1 e1;  // content
//    // ...
//}
//struct 
//E__ {
//    E1 e1;  // content
//    E2 e2;  // aura
//    E3 e3;  // border
//    E4 e4;  // margin
//}
//E[4] E___;

// parent
//   aura
//   core
//     childs
//       e[]
// child
//   flex length = parent.length * percent

// for child -> core.length  = outer - aura
// for loc   -> outer.length = core  + aura
//
// for child -> inner.length = outer - aura
// for loc   -> outer.length = inner + aura

struct 
E {
    union {
        Aura[3]  aura;
        struct {
            Aura margin;     // outer
            Aura border;     //
            Aura padding;    //
            Core core;       // inner
        }
    }

    Klasses      klasses;    // box green rounded
    Flags        flags;      // hidden,deleted
    Way          way;        // r l u d
    Ones         ones;       // [click: audacious --play-pause]
    Generator    generator;  //

    alias        outer = margin;
    alias        inner = core;

    auto ref     hidden ()  { return flags.hidden; }
    auto ref     deleted () { return flags.deleted; }

    struct
    Aura {
        size_t    type = 0;
        //
        Loc       loc;
        Length    length;
        //
        DefLoc    def_loc;
        DefLength def_length;
        //
        Color     color = Color (0xFF, 0xFF, 0xFF, 0xFF);
    }

    struct
    Core {
        union {
            struct {
                Type      type = Type._;
                //
                Loc       loc;
                Length    length;
                //
                DefLoc    def_loc;
                DefLength def_length;
            }
            //
            ImageCore     image;
            TextCore      text;
            ChildsCore    childs;
        }

        L
        _length (IL il) {
            final
            switch (type) {
                case Type._      : return 0;
                case Type.image  : return image._length  (il);
                case Type.text   : return text._length   (il);
                case Type.childs : return childs._length (il);
            }
        }

        enum
        Type : size_t {
            _,
            image,
            text,
            childs,
        }
    }

    struct
    Flags {
        bool hidden;
        bool deleted;
    }

    struct
    On {
        string    event;  // click
        TString[] action; // audacious --play-pause
    }

    struct
    Ones {
        On[] s;
        alias s this;
    }

    this (Length length) {  // E (Length (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H))
        this.core.length = length;
    }
}

mixin template 
Core_Aura_Header (Type) {
    E.Core.Type   type;
    //
    Loc           loc;
    Length        length;
    //
    DefLoc        def_loc;
    DefLength     def_length;    
}


struct
ImageCore {
    E.Core.Type   type = E.Core.Type.image;
    //
    Loc           loc;
    Length        length;
    //
    DefLoc        def_loc;
    DefLength     def_length;
    //
    Color         color;
    Color         bg;
    string        def_src;     // "abc.png"
    IMAGE_PTR     ptr;

    // image length
    //   parent   //
    //   content  // orig
    //   stat     // 100 100
    //   flex     // 50%

    void
    load () {
        load_e_image (e);
    }

    L
    _length (IL il) {
        if (ptr !is null) {
            switch (il) {
                case IL.X: return ptr.img_surface.w; break;
                case IL.Y: return ptr.img_surface.h; break;
                default:
            }
        }
        return 0;
    }

    void
    draw () {
        e_klass_draws.image (renderer,ptr,x,y,w,h);
    }
}

struct
TextCore {
    size_t        type = E.Core.Type.text;
    //
    Loc           loc;
    Length        length;
    //
    DefLoc        def_loc;
    DefLength     def_length;
    //
    Color         color;
    Color         bg;
    FONT_PTR      ptr;
    TextRect[]    rects;
    // def
    DefFont       def_font;    //
    string        s;           // "abc"

    struct 
    DefFont {
        string    file;    // "abc"
        string    family;  // "abc"
        ubyte     size;    // 0..256
        bool      bold;    // 0/1
        bool      italic;  // 0/1
    }

    struct
    TextRect {
        Loca     loca;
        alias    loca this;
        Color    color = Color (0xFF, 0xFF, 0xFF, 0xFF);
        TEXT_PTR ptr;
    }

    void
    load () {
        load_e_text (e);
    }

    L
    _length (IL il) {
        L l;
        L len;

        foreach (ref rect; rects) {
            if (rect.loc[il] < l)
                l = rect.loc[il];

            if (rect.loc[il] + rect.length[il] > len)
                len = rect.loc[il] + rect.length[il];
        }

        return len;
    }

    void
    draw () {
        e_klass_draws._text (renderer,rects,font_ptr,color,loc,length);
    }
}

struct
ChildsCore {
    E.Core.Type   type = E.Core.Type.childs;
    //
    Loc           loc;
    Length        length;
    //
    DefLoc        def_loc;
    DefLength     def_length;
    //
    E[]           s;  // no links

    void
    load () {
        //load_e_childs (e);
    }

    L
    _length (IL il) {
        L l;
        L len;

        foreach (_e; s) {
            if (_e.loc[il] < l)
                l = _e.loc[il];

            if (_e.loc[il] + _e.length[il] > len)
                len = _e.loc[il] + _e.length[il];
        }

        return len;
    }

    void
    draw () {
        e_klass_draws.childs (renderer,s,loc,length);
    }
}


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
    auto kls = (*klasses) [name];
    add_klass (e,kls);
}
void
add_klass (E* e, Klass* kls) {
    import std.algorithm.searching : canFind;
    if (!e.klasses.canFind (kls))
        e.klasses ~= kls;
}

bool
has_klass (E* e, Klasses* klasses, string name) {
    auto kls = klasses._find_klass (name);
    assert (kls != null);
    return has_klass (e,kls);
}
bool
has_klass (E* e, Klass* kls) {
    import std.algorithm.searching : canFind;
    return e.klasses.canFind (kls);
}

void
trigger_class (E* e, Klasses* klasses, string name) {
    if (e.has_klass (klasses,name))
        e.remove_klass (klasses,name);
    else
        e.add_klass (klasses,name);
}


void
remove_klass (E* e, Klasses* klasses, string name) {
    auto kls = klasses._find_klass (name);
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
find_child (E* e, Klasses* klasses, string klass_name) {
    foreach (_e; WalkChilds (e))
        if (_e.has_klass (klasses,klass_name))
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
    if (!ev.path.empty) {
        auto parent = ev.path.back;
        ev.path.length--;
        parent.event (ev);
    }
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
            update (_e,ev);

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
            draw (_e,ev);

        ev.locs.length--;
        ev.path.length--;
    }
}

EPtr
_dup (EPtr _this) {
     return null;
}


bool
event_for_me (Klass* kls, SDL_MouseWheelEvent* ev, E* e) {
    Loc _loc = Loc (ev.mouseX, ev.mouseY);
    return loc_in (_loc, e.loc, e.length);
}

bool
event_for_me (Klass* kls, SDL_MouseButtonEvent* ev, E* e) {
    Loc _loc = Loc (ev.x, ev.y);
    return loc_in (_loc, e.loc, e.length);
}

bool
event_for_me (Klass* kls, click_UserEvent* ev, E* e) {
    Loc _loc = ev.up_loc;
    return loc_in (_loc, e.loc, e.length);
}

bool
loc_in (Loc loc, Loc area_loc, Length area_length) {
    static
    foreach (i; 0..NIL)
        if ((area_loc.s[i] <= loc.s[i]) && (loc.s[i] <= area_loc.s[i] + area_length.s[i]))
            return true;

    return false;
}
