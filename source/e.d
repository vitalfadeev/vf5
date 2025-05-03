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
import e_klass_draw;
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
    Ons          ons;        // [click: audacious --play-pause]
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
        Len       len;
        //
        DefLoc    def_loc;
        DefLen    def_len;
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
                Len       len;
                //
                DefLoc    def_loc;
                DefLen    def_len;
            }
            //
            ImageCore     image;
            TextCore      text;
            ChildsCore    childs;
        }

        Loc
        limit () {
            return loc + len;
        }

        void
        update_len () {
            final
            switch (type) {
                case Type._      : break;
                case Type.image  : image.update_len  (); break;
                case Type.text   : text.update_len   (); break;
                case Type.childs : childs.update_len (); break;
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
    Ons {
        On[] s;
        alias s this;
    }

    this (Len len) {  // E (Length (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H))
        this.core.len = len;
    }
}

mixin template 
Core_Aura_Header (Type) {
    E.Core.Type   type;
    //
    Loc           loc;
    Len           len;
    //
    DefLoc        def_loc;
    DefLen        def_len;    
}


struct
ImageCore {
    E.Core.Type   type = E.Core.Type.image;
    //
    Loc           loc;
    Len           len;
    //
    DefLoc        def_loc;
    DefLen        def_len;
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
        // load_e_image (e);
    }

    void
    update_len () {
        if (ptr is null)
            len = Len.init;
        else
            len = Len (ptr.w, ptr.h);
    }

    void
    draw (SDL_Renderer* renderer) {
        e_klass_draw.draw_image (renderer,ptr,loc,len);
    }
}

struct
TextCore {
    size_t        type = E.Core.Type.text;
    //
    Loc           loc;
    Len           len;
    //
    DefLoc        def_loc;
    DefLen        def_len;
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
        Loc      loc;
        Len      len;
        Color    color = Color (0xFF, 0xFF, 0xFF, 0xFF);
        TEXT_PTR ptr;
    }

    void
    load () {
        //load_e_text (e);
    }

    void
    update_len () {
        Len _len;

        foreach (ref rect; rects) {
            static
            foreach (il; EnumMembers!IL) {
                if (rect.loc[il] + rect.len[il] > _len[il])
                    _len[il] = rect.loc[il] + rect.len[il];
            }
        }

        this.len = _len;
    }

    void
    draw (SDL_Renderer* renderer) {
        e_klass_draw.draw_text (renderer,rects,ptr,color,loc,len);
    }
}

struct
ChildsCore {
    E.Core.Type   type = E.Core.Type.childs;
    //
    Loc           loc;
    Len           len;
    //
    DefLoc        def_loc;
    DefLen        def_len;
    //
    E[]           s;  // no links

    void
    load () {
        //load_e_childs (e);
    }

    void
    update_len () {
        Len _len;

        foreach (_e; s) {
            static
            foreach (il; EnumMembers!IL) {
                if (_e.outer.loc[il] + _e.outer.len[il] > len[il])
                    len[il] = _e.outer.loc[il] + _e.outer.len[il];
            }
        }

        this.len = _len;
    }

    void
    draw (SDL_Renderer* renderer, Loc loc, Len len) {
        e_klass_draw.draw_childs (renderer,s,loc,len);
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
    if (!e.klasses.has (kls))
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
    return e.klasses.has (kls);
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
    e.klasses.remove (kls);
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
    e.klasses.event (e,ev);

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
    e.klasses.update (e,ev);

    // to childs
    if (e.has_childs) {
        ev.path ~= e;
        ev.locs ~= 
            ev.locs.back
            + e.margin.loc
            + e.border.loc
            + e.padding.loc
            + e.core.loc;

        foreach (_e; WalkChilds (e))
            .update (_e,ev);

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
    foreach (kls; e.klasses.s)
        kls.draw (ev,e);

    // to childs
    if (e.has_childs) {
        ev.path ~= e;
        ev.locs ~= 
            ev.locs.back
            + e.margin.loc
            + e.border.loc
            + e.padding.loc
            + e.core.loc;

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
    return loc_in (_loc, e.outer.loc, e.outer.len);
}

bool
event_for_me (Klass* kls, SDL_MouseButtonEvent* ev, E* e) {
    Loc _loc = Loc (ev.x, ev.y);
    return loc_in (_loc, e.outer.loc, e.outer.len);
}

bool
event_for_me (Klass* kls, click_UserEvent* ev, E* e) {
    Loc _loc = ev.up_loc;
    return loc_in (_loc, e.outer.loc, e.outer.len);
}

bool
loc_in (Loc loc, Loc area_loc, Len area_len) {
    static
    foreach (il; EnumMembers!IL)
        if ((area_loc.s[il] <= loc.s[il]) && (loc.s[il] <= area_loc.s[il] + area_len.s[il]))
            return true;

    return false;
}
