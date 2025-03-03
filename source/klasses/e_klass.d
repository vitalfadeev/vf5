module klasses.e;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import tstring;
import events;
import doc;
import etree;
import klass;
import e;
import types;
import txt_parser : parse_color_hex, parse_color, parse_color_tcb;


struct 
E_Klass {
    Klass _super = 
        Klass (
            "e", 
            [],  
            [],  
            &.event,     // event
            &.update,    // update
            &.set,       // set
            &.draw,      // draw
        );
    alias _super this;
}

// KLASS_EVENT_FN
void
event (Klass* kls, Event* ev, ETree* t) {
    E* e = &t.e;

    if (ev.type != SDL_MOUSEMOTION)
        writeln ("KLASS: ", kls.name, ".EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_USEREVENT:
            go_on_event (ev.doc,t,(cast(USER_EVENT)ev.user.code).to!string);
            break;
        default:
    }
}

// KLASS_UPDATE_FN
void
update (Klass* kls, Doc* doc, ETree* t) {
    //
}

// KLASS_SET_FN
void
set (Klass* kls, Doc* doc, ETree* t, string field_id, TString[] values) {
    E* e = &t.e;

    switch (field_id) {
        case "pos.x"            : set_pos_x             (doc,t,values); break;
        case "pos.y"            : set_pos_y             (doc,t,values); break;
        case "pos"              : set_pos               (doc,t,values); break;
        case "pos.type"         : set_pos_type          (doc,t,values); break;
        case "pos.group"        : set_pos_group         (doc,t,values); break;
        case "pos.dir"          : set_pos_dir           (doc,t,values); break;
        case "size.w"           : set_size_w            (doc,t,values); break;
        case "size.h"           : set_size_h            (doc,t,values); break;
        case "size"             : set_size              (doc,t,values); break;
        case "hidden"           : set_hidden            (doc,t,values); break;
        case "popup"            : set_popup             (doc,t,values); break;
        case "borders"          : set_borders           (doc,t,values); break;
        case "borders.t"        : set_border_t          (doc,t,values); break;
        case "borders.r"        : set_border_r          (doc,t,values); break;
        case "borders.b"        : set_border_b          (doc,t,values); break;
        case "borders.l"        : set_border_l          (doc,t,values); break;
        case "borders.color"    : set_borders_color     (doc,t,values); break;
        case "pad"              : set_pad               (doc,t,values); break;
        case "pad.bg"           : set_pad_bg            (doc,t,values); break;
        case "content.image"    : set_content_image     (doc,t,values); break;
        case "content.text"     : set_content_text      (doc,t,values); break;
        case "content"          : set_content           (doc,t,values); break;
        case "image"            : set_content_image     (doc,t,values); break;
        case "text"             : set_content_text      (doc,t,values); break;
        case "text.color"       : set_text_fg           (doc,t,values); break;
        case "text.fg"          : set_text_fg           (doc,t,values); break;
        case "text.bg"          : set_text_bg           (doc,t,values); break;
        case "text.pos.type"    : set_text_pos_type     (doc,t,values); break;
        case "content.size.w"   : set_content_size_w    (doc,t,values); break;
        case "content.size.h"   : set_content_size_h    (doc,t,values); break;
        case "content.size"     : set_content_size      (doc,t,values); break;
        case "content.size.type": set_content_siztype (doc,t,values); break;
        case "text.font"        : set_content_text_font (doc,t,values); break;
        case "text.font.family" : set_content_text_font_family (doc,t,values); break;
        case "text.font.size"   : set_content_text_font_size   (doc,t,values); break;
        case "text.font.file"   : set_content_text_font_file   (doc,t,values); break;
        case "bg"               : set_bg                (doc,t,values); break;
        case "on"               : set_on                (doc,t,values); break;
        //case "e"                : set_e                 (doc,t,kls,values); break;
        default:
    }
}

// KLASS_DRAW_FN
void
draw (Klass* kls, SDL_Renderer* renderer, ETree* t) {
    import draws : draw_e;
    E* e = &t.e;
    draw_e (renderer,e);
}

//
void
set_pos (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;
    
    if (values.length >= 2) {
        if (values[1].type == TString.Type.string && values[1].s == "%") {
            set_pos_x_percent (doc, t, values[0..1]);
            e.pos_type = E.PosType.percent;
        }
        else {
            set_pos_x (doc, t, values[0..1]);
            set_pos_y (doc, t, values[1..$]);
        }
    }
    else
    if (values.length == 1) {
        set_pos_x (doc, t, values[0..1]);
        set_pos_y (doc, t, values[0..1]);
    }
}

void
set_pos_type (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 2) {
        switch (values[0].s) {
            case "9"       : e.pos_type = E.PosType.t9; break;
            case "t9"      : e.pos_type = E.PosType.t9; break;
            case "3"       : e.pos_type = E.PosType.t3; break;
            case "t3"      : e.pos_type = E.PosType.t3; break;
            case "grid"    : e.pos_type = E.PosType.grid; break;
            case "vbox"    : e.pos_type = E.PosType.vbox; break;
            case "hbox"    : e.pos_type = E.PosType.hbox; break;
            case "percent" : e.pos_type = E.PosType.percent; break;
            default: {
                if (is_percent (values[0].s,&e.pos_percent)) // 50%
                    e.pos_type = E.PosType.percent;
                else
                    e.pos_type = E.PosType.none;
            }
        }
        switch (values[1].s) {
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
        switch (values[0].s) {
            case "9"       : e.pos_type = E.PosType.t9; break;
            case "t9"      : e.pos_type = E.PosType.t9; break;
            case "3"       : e.pos_type = E.PosType.t3; break;
            case "t3"      : e.pos_type = E.PosType.t3; break;
            case "grid"    : e.pos_type = E.PosType.grid; break;
            case "vbox"    : e.pos_type = E.PosType.vbox; e.pos_dir = E.PosDir.b; break;
            case "hbox"    : e.pos_type = E.PosType.hbox; e.pos_dir = E.PosDir.r; break;
            case "percent" : e.pos_type = E.PosType.percent; break;
            default: {
                if (is_percent (values[0].s,&e.pos_percent)) // 50%
                    e.pos_type = E.PosType.percent;
                else
                    e.pos_type = E.PosType.none;
            }
        }
    }
}

bool
is_percent (string s, byte* percent) {
    auto perc_pos = s.indexOf ("%");
    if (perc_pos != -1) {
        if (s[0..perc_pos].isNumeric ()) {
            *percent = s[0..perc_pos].to!byte;
            return true;
        }
    }

    return false;
}

bool
is_numeric (string s, int* num) {
    if (s.isNumeric) {
        *num = s.to!int;
        return true;
    }

    return false;
}

void
set_pos_group (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;
    
    if (values.length >= 1) {
        e.pos_group = values[0].s.to!ubyte;
    }
}

void
set_pos_dir (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 1) {
        switch (values[0].s) {
            case "r": e.pos_dir = E.PosDir.r; break;
            case "l": e.pos_dir = E.PosDir.l; break;
            case "t": e.pos_dir = E.PosDir.b; break;
            case "b": e.pos_dir = E.PosDir.l; break;
            default:
        }
    }
}

void
set_pos_x (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        string value = values[0].s;

        if (value.is_percent (&e.pos_percent)) { // 50%
            e.pos_type = E.PosType.percent;
        }
        else
        if (value.isNumeric ()) { // 50
            e.pos.x = value.to!X;
        }
    }
}

void
set_pos_x_percent (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        string value = values[0].s;

        if (value.isNumeric)
            e.pos_percent = value.to!byte;
        else
            e.pos_percent = 0;
    }
}

void
set_pos_y (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        if (values[0].s.isNumeric ()) {
            e.pos.y = values[0].s.to!Y;
        }
    }
}

void
set_size (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 2) {
        set_size_w (doc, t, values[0..1]);
        set_size_h (doc, t, values[1..2]);
    }
    else
    if (values.length == 1) {
        set_size_w (doc, t, values[0..1]);
        set_size_h (doc, t, values[0..1]);
    }
}

void
set_size_w (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        switch (values[0].s) {
            case "fixed"   : e.size_w_type = E.SizeType.fixed;  break;
            case "content" : e.size_w_type = E.SizeType.content; break;
            case "parent"  : e.size_w_type = E.SizeType.parent;  break;
            case "window"  : e.size_w_type = E.SizeType.window;  break;
            case "max"     : e.size_w_type = E.SizeType.max;  break;
            default : 
                if (values[0].s.isNumeric ()) {
                    e.size.w = values[0].s.to!W;
                    e.size_w_type = E.SizeType.fixed;
                }
                else {
                    throw new Exception ("unsupported size.w: " ~ values[0].s);
                }
        }
    }
}

void
set_size_h (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        switch (values[0].s) {
            case "fixed"   : e.size_h_type = E.SizeType.fixed;  break;
            case "content" : e.size_h_type = E.SizeType.content; break;
            case "parent"  : e.size_h_type = E.SizeType.parent;  break;
            case "window"  : e.size_w_type = E.SizeType.window;  break;
            case "max"     : e.size_w_type = E.SizeType.max;  break;
            default : 
                if (values[0].s.isNumeric ()) {
                    e.size.h = values[0].s.to!H;
                    e.size_h_type = E.SizeType.fixed;
                }
                else {
                    throw new Exception ("unsupported size.h: " ~ values[0].s);
                }
        }
    }
}

void
set_hidden (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        if (values[0].s.isNumeric)
            e.hidden = values[0].s.to!int != 0;
    }
}

void
set_popup (Doc* doc, ETree* t, TString[] values) {
    // e.popup = "popup-file";
}

void
set_borders (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 3) {
        set_border (doc, t, &e.borders.t, values[0..$]);
        set_border (doc, t, &e.borders.r, values[0..$]);
        set_border (doc, t, &e.borders.b, values[0..$]);
        set_border (doc, t, &e.borders.l, values[0..$]);
    }
    else
    if (values.length >= 2) {
        set_border (doc, t, &e.borders.t, values[0..$]);
        set_border (doc, t, &e.borders.r, values[0..$]);
        set_border (doc, t, &e.borders.b, values[0..$]);
        set_border (doc, t, &e.borders.l, values[0..$]);
    }
    else
    if (values.length == 1) {
        set_border (doc, t, &e.borders.t, values[0..$]);
        set_border (doc, t, &e.borders.r, values[0..$]);
        set_border (doc, t, &e.borders.b, values[0..$]);
        set_border (doc, t, &e.borders.l, values[0..$]);
    }
}

void
set_border_t (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 3) {
        set_border (doc, t, &e.borders.t, values);
    }
}

void
set_border_r (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 3) {
        set_border (doc, t, &e.borders.r, values);
    }
}

void
set_border_b (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 3) {
        set_border (doc, t, &e.borders.b, values);
    }
}

void
set_border_l (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 3) {
        set_border (doc, t, &e.borders.l, values);
    }
}

void
set_borders_color (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 1) {
        set_border_color (doc, t, &e.borders.t, values);
        set_border_color (doc, t, &e.borders.t, values);
        set_border_color (doc, t, &e.borders.b, values);
        set_border_color (doc, t, &e.borders.l, values);
    }
}

void
set_pad (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 4) {
        if (values[0].s.isNumeric) {
            e.pad.t = values[0].s.to!Y;
        }
        if (values[1].s.isNumeric) {
            e.pad.r = values[1].s.to!X;
        }
        if (values[2].s.isNumeric) {
            e.pad.b = values[1].s.to!Y;
        }
        if (values[3].s.isNumeric) {
            e.pad.l = values[1].s.to!X;
        }
    }
    else
    if (values.length >= 3) {
        //
    }
    else
    if (values.length >= 2) {
        if (values[0].s.isNumeric) {
            e.pad.r = e.pad.l = values[0].s.to!X;
        }
        if (values[1].s.isNumeric) {
            e.pad.t = e.pad.b = values[1].s.to!Y;
        }
    }
    else
    if (values.length == 1) {
        if (values[0].s.isNumeric) {
            e.pad.r = e.pad.l = values[0].s.to!X;
            e.pad.t = e.pad.b = values[0].s.to!Y;
        }
    }
}

void
set_pad_bg (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        Color c = e.pad.bg;
        if (doc_parse_color (doc, values, &c))
            e.pad.bg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_border (Doc* doc, ETree* t, E.Border* border, TString[] values) {    
    E* e = &t.e;

    if (values.length >= 3) {
        set_border_w     (doc, t, border, values[0..1]);
        set_border_type  (doc, t, border, values[1..2]);
        set_border_color (doc, t, border, values[2..3]);
    }
}

void
set_border_w (Doc* doc, ETree* t, E.Border* border, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        if (values[0].s.isNumeric)
            border.w = values[0].s.to!W;
    }
}

void
set_border_type (Doc* doc, ETree* t, E.Border* border, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        if (values[0].s == "none")
            border.type = E.Border.Type.none;
        if (values[0].s == "solid")
            border.type = E.Border.Type.solid;
        if (values[0].s == "dash")
            border.type = E.Border.Type.dash;
    }
}

void
set_border_color (Doc* doc, ETree* t, E.Border* border, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        Color c;
        if (doc_parse_color (doc, values, &c))
            border.color = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

bool
doc_parse_color (Doc* doc, TString[] tss, Color* color) {
    import std.string : startsWith;


    if (tss[0].s.startsWith ("#"))
        return parse_color_hex (tss[0].s, color);
    else
    if (tss[0].s.startsWith ("rgb")) {
        // rgb()
        // rgb 0 0 0
    }
    else
    if (tss[0].s.startsWith ("tcb")) {
        // tcb +0 +0 -25
        return parse_color_tcb (tss,color);
    }
    else {
        TString[] color_s = doc_get_klass_field_value (doc,tss[0].s);
        if (color_s.length)
            return parse_color (color_s, color); 
    }

    return false;
}

void
set_content_image (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        e.content.image.src = values[0].s;
    }
}


void
set_content_text (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        e.content.text.s = values.join (" ");
    }
}

void
set_text_fg (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        Color c;
        if (doc_parse_color (doc, values, &c))
            e.content.text.fg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_text_bg (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        Color c;
        if (doc_parse_color (doc, values, &c))
            e.content.text.bg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_text_pos_type (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        switch (values[0].s) {
            case "9"       : e.content.text.pos_type = E.PosType.t9; break;
            case "t9"      : e.content.text.pos_type = E.PosType.t9; break;
            case "3"       : e.content.text.pos_type = E.PosType.t3; break;
            case "t3"      : e.content.text.pos_type = E.PosType.t3; break;
            case "grid"    : e.content.text.pos_type = E.PosType.grid; break;
            case "vbox"    : e.content.text.pos_type = E.PosType.vbox; break;
            case "hbox"    : e.content.text.pos_type = E.PosType.hbox; break;
            case "percent" : e.content.text.pos_type = E.PosType.percent; break;
            default:
                e.content.text.pos_type = E.PosType.none;
        }
    }
}

void
set_content_size_w (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        switch (values[0].s) {
            case "e"      : e.content.size_w_type = E.Content.SizeType.e; break;
            case "fixed"  : e.content.size_w_type = E.Content.SizeType.fixed; break;
            case "max"    : e.content.size_w_type = E.Content.SizeType.max; break;
            case "image"  : e.content.size_w_type = E.Content.SizeType.image; break;
            case "text"   : e.content.size_w_type = E.Content.SizeType.text; break;
            case "childs" : e.content.size_w_type = E.Content.SizeType.childs; break;
            default: {
                if (isNumeric (values[0].s)) {
                    e.content.size.w      = values[0].s.to!W;
                    e.content.size_w_type = E.Content.SizeType.fixed;
                }
                else
                    e.content.size_w_type = E.Content.SizeType.max;
            }
        }
    }
}

void
set_content_size_h (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        switch (values[0].s) {
            case "e"      : e.content.size_h_type = E.Content.SizeType.e; break;
            case "fixed"  : e.content.size_h_type = E.Content.SizeType.fixed; break;
            case "max"    : e.content.size_h_type = E.Content.SizeType.max; break;
            case "image"  : e.content.size_h_type = E.Content.SizeType.image; break;
            case "text"   : e.content.size_h_type = E.Content.SizeType.text; break;
            case "childs" : e.content.size_h_type = E.Content.SizeType.childs; break;
            default:
            if (isNumeric (values[0].s)) {
                e.content.size.h      = values[0].s.to!H;
                e.content.size_h_type = E.Content.SizeType.fixed;
            }
            else
                e.content.size_h_type = E.Content.SizeType.max;
        }
    }
}

void
set_content_size (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 2) {
        set_content_size_w (doc, t, values[0..1]);
        set_content_size_h (doc, t, values[1..2]);
    }
    else
    if (values.length == 1) {
        set_content_size_w (doc, t, values);
        set_content_size_h (doc, t, values);
    }
}

void
set_content_siztype (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        switch (values[0].s) {
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
set_content_text_font (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length >= 2) {
        set_content_text_font_file (doc,t,values[0..1]);
        set_content_text_font_size (doc,t,values[1..2]);
    }
    if (values.length >= 1) {
        set_content_text_font_file (doc,t,values[0..1]);
    }
}

static 
string[] global_font_files;

void
set_content_text_font_file (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        // collect font names
        global_font_files ~= values[0].s;
        e.content.text.font.file = values[0].s;
    }
}

void
set_content_text_font_family (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        e.content.text.font.family = values[0].s;
    }
}

void
set_content_text_font_size (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        e.content.text.font.size = values[0].s.to!ubyte;
    }
}

void
set_bg (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        Color c;
        if (doc_parse_color (doc,values, &c))
            e.bg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_content (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        //
    }
}

void
set_on (Doc* doc, ETree* t, TString[] values) {
    E* e = &t.e;

    if (values.length) {
        string event  = values[0].s;
        if (values.length == 1) {
            // no action
        }
        else
        if (values.length >= 2) {
            e.on ~= E.On (event,values[1..$]);
        }
    }
}

//void
//set_e (Doc* doc, ETree* t, Klass* kls, TString[] values) {
//    E* e = &t.e;
//    if (values.length) {
//        // add child to t
//        //   set classes
//        auto _t = new ETree (new E ());
//        t.add_child (_t);
//        _t.e.added_from = kls;
//        if (values.length >= 2) {
//            foreach (kls_name; values[1..$]) {
//                _t.e.klasses ~= doc.find_klass_or_create (kls_name);
//            }
//        }
//    }
//}
