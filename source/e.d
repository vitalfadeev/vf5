import std.stdio;
import std.string;
import std.conv;
import std.process;
import bindbc.sdl;
import doc;
import etree;
import klass;
import types;
import txt_parser;


struct E {
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
            string family;  // "abc"
            ubyte  size;    // 0..256
            bool   bold;    // 0/1
            bool   italic;  // 0/1
            void*  ptr;  // 0/1
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
    bool    widget;
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
    
    //
    void function (SDL_Renderer* renderer, E* e) draw; // simple, bordered, bordered-titled, custom
    void function (Doc* doc, ETree* t, Klass* klass) apply_klass = &.apply_klass;

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
apply_klasses (Doc* doc, ETree* t) {
    auto e = t.e;
    e.on.length = 0;
    // clean. remove e added from klass
    foreach (Klass* kls; e.klasses)
        if (e.added_from !is null)
            t.parent.remove_child (t);
    // set 
    foreach (Klass* kls; e.klasses)
        e.apply_klass (doc,t,kls);
}

void
apply_klass (Doc* doc, ETree* t, Klass* k) {
    auto e = t.e;

    foreach (ke; k.klasse) {
        string[] values;
        values.reserve (ke.values.length);
        foreach (v; ke.values) 
            if (v.startsWith ("`")) 
                values ~= extract_value (v);
            else
                values ~= v;

        switch (ke.id) {
            case "pos.x"            : set_pos_x             (doc,e,values); break;
            case "pos.y"            : set_pos_y             (doc,e,values); break;
            case "pos"              : set_pos               (doc,e,values); break;
            case "pos.type"         : set_pos_type          (doc,e,values); break;
            case "pos.group"        : set_pos_group         (doc,e,values); break;
            case "pos.dir"          : set_pos_dir           (doc,e,values); break;
            case "size.w"           : set_size_w            (doc,e,values); break;
            case "size.h"           : set_size_h            (doc,e,values); break;
            case "size"             : set_size              (doc,e,values); break;
            case "hidden"           : set_hidden            (doc,e,values); break;
            case "popup"            : set_popup             (doc,e,values); break;
            case "borders"          : set_borders           (doc,e,values); break;
            case "borders.t"        : set_border_t          (doc,e,values); break;
            case "borders.r"        : set_border_r          (doc,e,values); break;
            case "borders.b"        : set_border_b          (doc,e,values); break;
            case "borders.l"        : set_border_l          (doc,e,values); break;
            case "borders.color"    : set_borders_color     (doc,e,values); break;
            case "pad"              : set_pad               (doc,e,values); break;
            case "pad.bg"           : set_pad_bg            (doc,e,values); break;
            case "content.image"    : set_content_image     (doc,e,values); break;
            case "content.text"     : set_content_text      (doc,e,values); break;
            case "content"          : set_content           (doc,e,values); break;
            case "image"            : set_content_image     (doc,e,values); break;
            case "text"             : set_content_text      (doc,e,values); break;
            case "text.color"       : set_text_fg           (doc,e,values); break;
            case "text.fg"          : set_text_fg           (doc,e,values); break;
            case "text.bg"          : set_text_bg           (doc,e,values); break;
            case "text.pos.type"    : set_text_pos_type     (doc,e,values); break;
            case "content.size.w"   : set_content_size_w    (doc,e,values); break;
            case "content.size.h"   : set_content_size_h    (doc,e,values); break;
            case "content.size"     : set_content_size      (doc,e,values); break;
            case "content.size.type": set_content_size_type (doc,e,values); break;
            case "bg"               : set_bg                (doc,e,values); break;
            case "on"               : set_on                (doc,e,values); break;
            case "e"                : set_e                 (doc,t,k,values); break;
            default:
            // widget
            //   widget["progress"]
            //   set ()
            //     case "progress.position": widget_progress_set_position (doc,t,k,ke.values); break;
            //
            // widget_progress_set_position ()
            //   passed.size.w = ...
            //   current.pos.x = ...
            //   rest.pos.x    = ...
            //   rest.size.w   = ...
        }
    }
}

void
set_pos (Doc* doc, E* e, string[] values) {
    if (values.length >= 2) {
        set_pos_x (doc, e, values[0..1]);
        set_pos_y (doc, e, values[1..$]);
    }
    else
    if (values.length == 1) {
        set_pos_x (doc, e, values[0..1]);
        set_pos_y (doc, e, values[0..1]);
    }
}

void
set_pos_type (Doc* doc, E* e, string[] values) {
    if (values.length >= 2) {
        switch (values[0]) {
            case "9"    : e.pos_type = E.PosType.t9; break;
            case "t9"   : e.pos_type = E.PosType.t9; break;
            case "3"    : e.pos_type = E.PosType.t3; break;
            case "t3"   : e.pos_type = E.PosType.t3; break;
            case "grid" : e.pos_type = E.PosType.grid; break;
            case "vbox" : e.pos_type = E.PosType.vbox; break;
            case "hbox" : e.pos_type = E.PosType.hbox; break;
            default:
                e.pos_type = E.PosType.none;
        }
        switch (values[1]) {
            case "b" : e.pos_dir = E.PosDir.b; break;
            case "r" : e.pos_dir = E.PosDir.r; break;
            case "l" : e.pos_dir = E.PosDir.l; break;
            case "t" : e.pos_dir = E.PosDir.t; break;
            default:
                e.pos_dir = E.PosDir.r;
        }
    }
    else
    if (values.length >= 1) {
        switch (values[0]) {
            case "9"    : e.pos_type = E.PosType.t9; break;
            case "t9"   : e.pos_type = E.PosType.t9; break;
            case "3"    : e.pos_type = E.PosType.t3; break;
            case "t3"   : e.pos_type = E.PosType.t3; break;
            case "grid" : e.pos_type = E.PosType.grid; break;
            case "vbox" : e.pos_type = E.PosType.vbox; e.pos_dir = E.PosDir.b; break;
            case "hbox" : e.pos_type = E.PosType.hbox; e.pos_dir = E.PosDir.r; break;
            default:
                e.pos_type = E.PosType.none;
        }
    }
}

void
set_pos_group (Doc* doc, E* e, string[] values) {
    if (values.length >= 1) {
        e.pos_group = values[0].to!ubyte;
    }
}

void
set_pos_dir (Doc* doc, E* e, string[] values) {
    if (values.length >= 1) {
        switch (values[0]) {
            case "r": e.pos_dir = E.PosDir.r; break;
            case "l": e.pos_dir = E.PosDir.l; break;
            case "t": e.pos_dir = E.PosDir.b; break;
            case "b": e.pos_dir = E.PosDir.l; break;
            default:
        }
    }
}

void
set_pos_x (Doc* doc, E* e, string[] values) {
    if (values.length) {
        //if (values[0] == "auto")
        //    e.pos_x_auto = true;
        if (values[0].isNumeric ()) {
            e.pos.x = values[0].to!X;
            //e.pos_x_auto = false;
        }
    }
}

void
set_pos_y (Doc* doc, E* e, string[] values) {
    if (values.length) {
        //if (values[0] == "auto")
        //    e.pos_y_auto = true;
        if (values[0].isNumeric ()) {
            e.pos.y = values[0].to!Y;
            //e.pos_y_auto = false;
        }
    }
}

void
set_size (Doc* doc, E* e, string[] values) {
    if (values.length >= 2) {
        set_size_w (doc, e, values[0..1]);
        set_size_h (doc, e, values[1..2]);
    }
    else
    if (values.length == 1) {
        set_size_w (doc, e, values[0..1]);
        set_size_h (doc, e, values[0..1]);
    }
}

void
set_size_w (Doc* doc, E* e, string[] values) {
    if (values.length) {
        switch (values[0]) {
            case "fixed"   : e.size_w_type = E.SizeType.fixed;  break;
            case "content" : e.size_w_type = E.SizeType.content; break;
            case "parent"  : e.size_w_type = E.SizeType.parent;  break;
            case "window"  : e.size_w_type = E.SizeType.window;  break;
            default : 
                if (values[0].isNumeric ()) {
                    e.size.w = values[0].to!W;
                    e.size_w_type = E.SizeType.fixed;
                }
                else {
                    throw new Exception ("unsupported size.w: " ~ values[0]);
                }
        }
    }
}

void
set_size_h (Doc* doc, E* e, string[] values) {
    if (values.length) {
        switch (values[0]) {
            case "fixed"   : e.size_h_type = E.SizeType.fixed;  break;
            case "content" : e.size_h_type = E.SizeType.content; break;
            case "parent"  : e.size_h_type = E.SizeType.parent;  break;
            case "window"  : e.size_w_type = E.SizeType.window;  break;
            default : 
                if (values[0].isNumeric ()) {
                    e.size.h = values[0].to!H;
                    e.size_h_type = E.SizeType.fixed;
                }
                else {
                    throw new Exception ("unsupported size.h: " ~ values[0]);
                }
        }
    }
}

void
set_hidden (Doc* doc, E* e, string[] values) {
    if (values.length) {
        if (values[0].isNumeric)
            e.hidden = values[0].to!int != 0;
    }
}

void
set_popup (Doc* doc, E* e, string[] values) {
    // e.popup = "popup-file";
}

void
set_borders (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.t, values[0..$]);
        set_border (doc, e, &e.borders.r, values[0..$]);
        set_border (doc, e, &e.borders.b, values[0..$]);
        set_border (doc, e, &e.borders.l, values[0..$]);
    }
    else
    if (values.length >= 2) {
        set_border (doc, e, &e.borders.t, values[0..$]);
        set_border (doc, e, &e.borders.r, values[0..$]);
        set_border (doc, e, &e.borders.b, values[0..$]);
        set_border (doc, e, &e.borders.l, values[0..$]);
    }
    else
    if (values.length == 1) {
        set_border (doc, e, &e.borders.t, values[0..$]);
        set_border (doc, e, &e.borders.r, values[0..$]);
        set_border (doc, e, &e.borders.b, values[0..$]);
        set_border (doc, e, &e.borders.l, values[0..$]);
    }
}

void
set_border_t (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.t, values);
    }
}

void
set_border_r (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.r, values);
    }
}

void
set_border_b (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.b, values);
    }
}

void
set_border_l (Doc* doc, E* e, string[] values) {
    if (values.length >= 3) {
        set_border (doc, e, &e.borders.l, values);
    }
}

void
set_borders_color (Doc* doc, E* e, string[] values) {
    if (values.length >= 1) {
        set_border_color (doc, e, &e.borders.t, values);
        set_border_color (doc, e, &e.borders.t, values);
        set_border_color (doc, e, &e.borders.b, values);
        set_border_color (doc, e, &e.borders.l, values);
    }
}

void
set_pad (Doc* doc, E* e, string[] values) {
    if (values.length >= 4) {
        if (values[0].isNumeric) {
            e.pad.t = values[0].to!Y;
        }
        if (values[1].isNumeric) {
            e.pad.r = values[1].to!X;
        }
        if (values[2].isNumeric) {
            e.pad.b = values[1].to!Y;
        }
        if (values[3].isNumeric) {
            e.pad.l = values[1].to!X;
        }
    }
    else
    if (values.length >= 3) {
        //
    }
    else
    if (values.length >= 2) {
        if (values[0].isNumeric) {
            e.pad.r = e.pad.l = values[0].to!X;
        }
        if (values[1].isNumeric) {
            e.pad.t = e.pad.b = values[1].to!Y;
        }
    }
    else
    if (values.length == 1) {
        if (values[0].isNumeric) {
            e.pad.r = e.pad.l = values[0].to!X;
            e.pad.t = e.pad.b = values[0].to!Y;
        }
    }
}

void
set_pad_bg (Doc* doc, E* e, string[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (doc, values[0], &c))
            e.pad.bg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_border (Doc* doc, E* e, E.Border* border, string[] values) {    
    if (values.length >= 3) {
        set_border_w     (doc, e, border, values[0..1]);
        set_border_type  (doc, e, border, values[1..2]);
        set_border_color (doc, e, border, values[2..3]);
    }
}

void
set_border_w (Doc* doc, E* e, E.Border* border, string[] values) {
    if (values.length) {
        if (values[0].isNumeric)
            border.w = values[0].to!W;
    }
}

void
set_border_type (Doc* doc, E* e, E.Border* border, string[] values) {
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
set_border_color (Doc* doc, E* e, E.Border* border, string[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (doc, values[0], &c))
            border.color = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

bool
doc_parse_color (Doc* doc, string s, Color* color) {
    import std.string : startsWith;

    if (s.startsWith ("#"))
        return parse_color_hex (s, color);
    else
    if (s.startsWith ("rgb")) {
        //
    }
    else {
        string[] color_s = doc_get_klass_field_value (doc,s);
        if (color_s.length)
            return parse_color (color_s[0], color); 
    }

    return false;
}

void
set_content_image (Doc* doc, E* e, string[] values) {
    if (values.length) {
        e.content.image.src = values[0];
    }
}


void
set_content_text (Doc* doc, E* e, string[] values) {
    if (values.length) {
        e.content.text.s = values.join (" ");
    }
}

void
set_text_fg (Doc* doc, E* e, string[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (doc, values[0], &c))
            e.content.text.fg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_text_bg (Doc* doc, E* e, string[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (doc, values[0], &c))
            e.content.text.bg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_text_pos_type (Doc* doc, E* e, string[] values) {
    if (values.length) {
        switch (values[0]) {
            case "9"    : e.content.text.pos_type = E.PosType.t9; break;
            case "t9"   : e.content.text.pos_type = E.PosType.t9; break;
            case "3"    : e.content.text.pos_type = E.PosType.t3; break;
            case "t3"   : e.content.text.pos_type = E.PosType.t3; break;
            case "grid" : e.content.text.pos_type = E.PosType.grid; break;
            case "vbox" : e.content.text.pos_type = E.PosType.vbox; break;
            case "hbox" : e.content.text.pos_type = E.PosType.hbox; break;
            default:
                e.content.text.pos_type = E.PosType.none;
        }
    }
}

void
set_content_size_w (Doc* doc, E* e, string[] values) {
    if (values.length) {
        switch (values[0]) {
            case "e"      : e.content.size_w_type = E.Content.SizeType.e; break;
            case "fixed"  : e.content.size_w_type = E.Content.SizeType.fixed; break;
            case "max"    : e.content.size_w_type = E.Content.SizeType.max; break;
            case "image"  : e.content.size_w_type = E.Content.SizeType.image; break;
            case "text"   : e.content.size_w_type = E.Content.SizeType.text; break;
            case "childs" : e.content.size_w_type = E.Content.SizeType.childs; break;
            default: {
                if (isNumeric (values[0])) {
                    e.content.size.w      = values[0].to!W;
                    e.content.size_w_type = E.Content.SizeType.fixed;
                }
                else
                    e.content.size_w_type = E.Content.SizeType.max;
            }
        }
    }
}

void
set_content_size_h (Doc* doc, E* e, string[] values) {
    if (values.length) {
        switch (values[0]) {
            case "e"      : e.content.size_h_type = E.Content.SizeType.e; break;
            case "fixed"  : e.content.size_h_type = E.Content.SizeType.fixed; break;
            case "max"    : e.content.size_h_type = E.Content.SizeType.max; break;
            case "image"  : e.content.size_h_type = E.Content.SizeType.image; break;
            case "text"   : e.content.size_h_type = E.Content.SizeType.text; break;
            case "childs" : e.content.size_h_type = E.Content.SizeType.childs; break;
            default:
            if (isNumeric (values[0])) {
                e.content.size.h      = values[0].to!H;
                e.content.size_h_type = E.Content.SizeType.fixed;
            }
            else
                e.content.size_h_type = E.Content.SizeType.max;
        }
    }
}

void
set_content_size (Doc* doc, E* e, string[] values) {
    if (values.length >= 2) {
        set_content_size_w (doc, e, values[0..1]);
        set_content_size_h (doc, e, values[1..2]);
    }
    else
    if (values.length == 1) {
        set_content_size_w (doc, e, values);
        set_content_size_h (doc, e, values);
    }
}

void
set_content_size_type (Doc* doc, E* e, string[] values) {
    if (values.length) {
        switch (values[0]) {
            case "e"      : e.content.size_w_type = E.Content.SizeType.e; break;
            case "fixed"  : e.content.size_w_type = E.Content.SizeType.fixed; break;
            case "image"  : e.content.size_w_type = E.Content.SizeType.image; break;
            case "text"   : e.content.size_w_type = E.Content.SizeType.text; break;
            case "childs" : e.content.size_w_type = E.Content.SizeType.childs; break;
            case "max"    : e.content.size_w_type = E.Content.SizeType.max; break;
            default:
                e.content.size_w_type = E.Content.SizeType.e;
        }
    }
}

void
set_bg (Doc* doc, E* e, string[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (doc,values[0], &c))
            e.bg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_content (Doc* doc, E* e, string[] values) {
    if (values.length) {
        //
    }
}

void
set_on (Doc* doc, E* e, string[] values) {
    if (values.length) {
        string event  = values[0];
        if (values.length == 1) {
            // no action
        }
        else
        if (values.length >= 2) {
            e.on ~= E.On (event,values[1..$]);
        }
    }
}

void
set_e (Doc* doc, ETree* t, Klass* kls, string[] values) {
    auto e = t.e;
    if (values.length) {
        // add child to t
        //   set classes
        auto _t = new ETree (new E ());
        t.add_child (_t);
        _t.e.added_from = kls;
        if (values.length >= 2) {
            foreach (kls_name; values[1..$]) {
                _t.e.klasses ~= doc.find_klass_or_create (kls_name);
            }
        }
    }
}

string
extract_value (string bquoted) {
    writeln ("extract_value: ", bquoted);

    auto stripped = bquoted.strip ("`");
    auto ret = executeShell (stripped);  // (int status, string output)

    writeln (ret.status);
    writeln (ret.output);

   return ret.output.stripRight ();
}
