module klasses.e;

import std.stdio;
import std.string;
import std.conv;
import std.range : back;
import bindbc.sdl;
import etree;
import e : E;
import e_update : 
    go_on_event, apply_e_klasses, apply_e_fields,
    load_e_image, load_e_font, load_e_colors, load_e_text,
    e_update_size_pos, load_e_childs,
    doc_get_klass_field_value;
import e_klass_draw;
import e_generator : Generator;
import klass : Klass;
import events;
import tstring;
import types;
import txt_parser : parse_color_hex, parse_color, parse_color_tcb;


struct 
E_Klass {
    Klass _super = 
        Klass (
            "e", 
            [],  
            [],  
            [],  
            Klass.Fn (
                &.event,     // event
                &.update,    // update
                &.set,       // set
                &.draw,      // draw
            )
        );
    alias _super this;
}

// KLASS_EVENT_FN
void
event (Klass* kls, Event* ev, E* e) {
    version (debug_event)
    if (ev.type != SDL_MOUSEMOTION)
        writefln ("KLASS(%s).event: %s", kls.name, *ev);

    switch (ev.type) {
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.update : kls.update (&ev._user.update,e); break;
                case USER_EVENT.draw   : kls.draw   (&ev._user.draw,e); break;
                case USER_EVENT.redraw : kls.draw   (&ev._user.draw,e); break;
                case USER_EVENT.start  : go_on_event (e,"start"); break;
                default                :
            }

            break;
        default: 
    }
}


// KLASS_UPDATE_FN
void
update (Klass* kls, update_UserEvent* ev, E* e) {
    version (debug_event)
    writefln ("KLASS(%s).update, E(%s), event %s", kls.name, e.e_klasses_to_string, *ev);
    version (profile) writefln ("%-60s", e.toString);
    e.reset ();
    version (profile) time_step ("");

    // 1
    if (e.klasses.length)
        e.apply_e_klasses ();
    if (e.fields.length)
        e.apply_e_fields (null,null);
    version (profile) time_step ("apply_e_klasses");

    // 2
    if (e.content.image.src.length)
        load_e_image (e);
    version (profile) time_step ("load_e_image");

    // 3
    if (e.content.text.s.length)
        e.load_e_font ();
    version (profile) time_step ("load_e_font");
    
    // 4
    e.load_e_colors ();
    version (profile) time_step ("load_e_colors");

    // 5
    if (e.content.text.s.length)
        e.load_e_text ();
    version (profile) time_step ("load_e_text");

    // 6
    if (e.generator.type != Generator.Type.none)
        e.load_e_childs ();
    version (profile) time_step ("load_e_childs");

}

// KLASS_SET_FN
void
set (Klass* kls, E* e, string field_id, TString[] values) {
    switch (field_id) {
        case "loc"               : set_loc                (e,values); break;
        case "loc.x"             : set_loc_x              (e,values); break;
        case "loc.y"             : set_loc_y              (e,values); break;
        case "loc.balance"       : set_loc_balance        (e,values); break;
        case "loc.balance.x"     : set_loc_balance_x      (e,values); break;
        case "loc.balance.y"     : set_loc_balance_y      (e,values); break;
        case "way"               : set_way                (e,values); break;
        //case "organize.childs"   : set_organize_childs    (e,values); break;
        case "size.w"            : set_size_w             (e,values); break;
        case "size.h"            : set_size_h             (e,values); break;
        case "size"              : set_size               (e,values); break;
        case "hidden"            : set_hidden             (e,values); break;
        case "popup"             : set_popup              (e,values); break;
        case "aura.borders"      : set_aura_borders       (e,values); break;
        case "borders"           : set_aura_borders       (e,values); break;
        case "aura.borders.color": set_aura_borders_color (e,values); break;
        case "borders.color"     : set_aura_borders_color (e,values); break;
        case "aura"              : set_aura               (e,values); break;
        case "aura.bg"           : set_aura_color         (e,values); break;
        case "aura.color"        : set_aura_color         (e,values); break;
        case "content.image"     : set_content_image      (e,values); break;
        case "content.text"      : set_content_text       (e,values); break;
        case "content"           : set_content            (e,values); break;
        case "image"             : set_content_image      (e,values); break;
        case "text"              : set_content_text       (e,values); break;
        case "text.color"        : set_text_fg            (e,values); break;
        case "text.fg"           : set_text_fg            (e,values); break;
        case "text.bg"           : set_text_bg            (e,values); break;
        case "text.pos.type"     : set_text_pos_type      (e,values); break;
        case "content.size.w"    : set_content_size_w     (e,values); break;
        case "content.size.h"    : set_content_size_h     (e,values); break;
        case "content.size"      : set_content_size       (e,values); break;
        case "content.size.type" : set_content_siztype    (e,values); break;
        case "text.font"         : set_content_text_font  (e,values); break;
        case "text.font.family"  : set_content_text_font_family (e,values); break;
        case "text.font.size"    : set_content_text_font_size   (e,values); break;
        case "text.font.file"    : set_content_text_font_file   (e,values); break;
        case "bg"                : set_bg                 (e,values); break;
        case "content.color"     : set_bg                 (e,values); break;
        case "generator"         : set_generator          (e,values); break;
        case "template"          : set_generator_template (e,values); break;
        case "generator.template": set_generator_template (e,values); break;
        case "generator.fields"  : set_generator_fields   (e,values); break;
        case "on"                : set_on                 (e,values); break;
        default:
            writefln ("IGNORED: %s: %s", field_id, values);
    }
}

// KLASS_DRAW_FN
void
draw (Klass* kls, draw_UserEvent* ev, E* e) {
    version (debug_event)
    writefln ("KLASS(%s).draw, E(%s), event %s", kls.name, e.e_klasses_to_string, *ev);
    e_klass_draw.draw (ev.renderer,ev.offset.back,e);
}

//
void
set_loc (E* e, TString[] values) {
    if (values.length >= 2) {
        set_loc_x (e, values[0..1]);
        set_loc_y (e, values[1..$]);
    }
    else
    if (values.length == 1) {
        set_loc_x (e, values[0..1]);
        //set_loc_y (e, values[0..1]);
    }
}

bool
is_percent (Balance) (string s, Balance* percent) {
    auto perc_pos = s.indexOf ("%");
    if (perc_pos != -1) {
        if (s[0..perc_pos].isNumeric ()) {
            *percent = s[0..perc_pos].to!Balance;
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
set_loc_balance (E* e, TString[] values) {
    if (values.length >= 2) {
        set_loc_balance_x (e,values[0..1]);
        set_loc_balance_y (e,values[1..$]);
    }
    else
    if (values.length >= 1) {
        set_loc_balance_x (e,values);
        set_loc_balance_y (e,values);
    }
}

void
set_loc_balance_x (E* e, TString[] values) {
    if (values.length >= 1) {
        e.loc_balance[OX] = _parse_balance (values[0].s);
    }
}

void
set_loc_balance_y (E* e, TString[] values) {
    if (values.length >= 1) {
        e.loc_balance[OY] = _parse_balance (values[0].s);
    }
}

bool
_parse_balance (string s, ref L length, ref L capacity) {
    // +50/100
    // 0
    // +1/2
    //  1/2
    // -1/2
    // +50
    // -50
    //
    // 0%
    // 100%

    string c = s;

    //_read_sign (s);
    //_read_1 (s);
    //_read_div (s);
    //_read_2 (s);

    byte _sign = +1;
    int _1;
    byte _div;
    int _2;

    _wait_sign:
    if (c.length) {
        if (c[0] == '+') {
            _sign = +1;
            c = c[1..$];
        }
        if (c[0] == '-') {
            _sign = -1;
            c = c[1..$];
        }
    }

    _wait_1:
    int _int_1;
    if (auto readed=_read_integer (c,_int_1)) {
        length = _int_1;
        capacity = 100;

        c = c[readed..$];

        if (_int_1 == 0) {
            // 0;
            capacity = 1;
            goto end;
        }
    }

    _wait_div:
    if (auto readed = _read_div (c)) {
        //_div;
        c = c[readed..$];

        _wait_2:
        int _int_2;
        if (auto readed2 = _read_integer (c,_int_2)) {
            if (_int_2 == 0)
                capacity = 1;
            else
                capacity = _int_2;
        }
    }

    end:
    length *= _sign;

    return true;
}

auto
_read_integer (string s, ref int _int) {
    _int = 0;
    size_t i;

    for (i=0; i < s.length && _is_int (s[i]); i++)
        _int = _int * 10 + _atoi (s[i]);

    return i;
}

bool
_is_int (char c) {
    return 
        c >= '0' && c <= '9';
}

int
_atoi (char c) {
    return c - '0';
}

auto
_read_div (string s) {
    if (s.length)
    if (s[0] == '/')
        return 1;

    return 0;
}


void
set_way (E* e, TString[] values) {
    if (values.length >= 1) {
        switch (values[0].s) {
            case "r": e.way = E.Way.r; break;
            case "l": e.way = E.Way.l; break;
            case "t": e.way = E.Way.u; break;
            case "u": e.way = E.Way.u; break;
            case "b": e.way = E.Way.d; break;
            case "d": e.way = E.Way.d; break;
            case "_": e.way = E.Way._; break;
            case ".": e.way = E.Way._; break;
            default:
        }
    }
}

void
set_organize_childs (E* e, TString[] values) {
    if (values.length >= 1) {
        switch (values[0].s) {
            case "max": e.organize_childs = E.OrganizeChilds.max_; break;
            default:
        }
    }
}

void
set_loc_x (E* e, TString[] values) {
    if (values.length) {
        _set_loc_x (e,values[0].s);
    }
}

void
set_loc_y (E* e, TString[] values) {
    if (values.length) {
        _set_loc_y (e,values[0].s);
    }
}

void
_set_loc_x (E* e, string value) {
    // loc  right
    // loc  l
    // loc  r
    // loc  c
    // loc  0%
    // loc  100%
    // loc  50%
    // loc  0
    // loc  10
    // loc  10 10
    // loc  l u
    // loc  l d
    // loc  l c
    // loc  lu
    // loc  cu
    // loc  ru
    // loc .
    // loc way
    // way r
    // way l
    // way d
    // way u
    // way .
    //
    // loc.type.x r
    // loc.type.x l
    // loc.type.x c
    // loc.type.x way
    // loc.type.y u
    // loc.type.y d
    // loc.type.y c
    // loc.type.y way

    const X = 0;
    const Y = 1;

    auto _loc = &e.def_loc;

    switch (value) {
        case "lu"    : *_loc = DefLoc (LocType.flex, -1,1, -1,1); break;
        case "cu"    : *_loc = DefLoc (LocType.flex,  0,1, -1,1); break;
        case "ru"    : *_loc = DefLoc (LocType.flex,  1,1, -1,1); break;
        case "rc"    : _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 0,1); break;
        case "rd"    : _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "cd"    : _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 0,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "ld"    : _typ = LocType.flex; _loc.flex [X] = FlexLoc (-1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "lc"    : _typ = LocType.flex; _loc.flex [X] = FlexLoc (-1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,0); break;
        case "cc"    : _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 0,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 0,1); break;
        case "r"     : _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 1,1); break;
        case "right" : _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 1,1); break;
        case "c"     : _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 0,1); break;
        case "center": _typ = LocType.flex; _loc.flex [X] = FlexLoc ( 0,1); break;
        case "l"     : _typ = LocType.flex; _loc.flex [X] = FlexLoc (-1,1); break;
        case "left"  : _typ = LocType.flex; _loc.flex [X] = FlexLoc (-1,1); break;
        case "_"     : _typ = E.PosType._; break;
        case "."     : _typ = E.PosType._; break;
        default      :
            if (value.isNumeric ()) { // 50
                e.pos_type[OX] = E.PosType.fixed;
                e.pos.x       = value.to!X;
            }
    }
}

void
_set_loc_y (E* e, string value) {
    switch (value) {
        case "lu"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance (-1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance (-1,1); break;
        case "cu"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance ( 0,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance (-1,1); break;
        case "ru"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance ( 1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance (-1,1); break;
        case "rc"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance ( 1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 0,1); break;
        case "rd"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance ( 1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "cd"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance ( 0,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "ld"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance (-1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "lc"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance (-1,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,0); break;
        case "cc"    : e.pos_type[OX] = E.PosType.balance; e.pos_balance[OX] = Balance ( 0,1); e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 0,1); break;
        case "u"     : e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "up"    : e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 1,1); break;
        case "c"     : e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 0,1); break;
        case "center": e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance ( 0,1); break;
        case "d"     : e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance (-1,1); break;
        case "dn"    : e.pos_type[OY] = E.PosType.balance; e.pos_balance[OY] = Balance (-1,1); break;
        case "_"     : e.pos_type[OY] = E.PosType._; break;
        case "."     : e.pos_type[OY] = E.PosType._; break;
        default      :
            if (value.isNumeric ()) { // 50
                e.pos_type[OY] = E.PosType.fixed;
                e.pos.y       = value.to!Y;
            }
    }
}

void
set_size (E* e, TString[] values) {
    if (values.length >= 2) {
        set_size_w (e, values[0..1]);
        set_size_h (e, values[1..2]);
    }
    else
    if (values.length == 1) {
        set_size_w (e, values[0..1]);
        set_size_h (e, values[0..1]);
    }
}

void
set_size_w (E* e, TString[] values) {
    if (values.length) {
        switch (values[0].s) {
            case "fixed"   : e.size_w_type = E.SizeType.fixed;  break;
            case "content" : e.size_w_type = E.SizeType.content; break;
            case "parent"  : e.size_w_type = E.SizeType.parent;  break;
            case "window"  : e.size_w_type = E.SizeType.window;  break;
            case "max"     : e.size_w_type = E.SizeType.max;  break;
            default : 
                if (values[0].s.isNumeric ()) {
                    e.size_w_type = E.SizeType.fixed;
                    e.size.w = values[0].s.to!W;
                }
                else {
                    throw new Exception ("unsupported size.w: " ~ values[0].s);
                }
        }
    }
}

void
set_size_h (E* e, TString[] values) {
    if (values.length) {
        switch (values[0].s) {
            case "fixed"   : e.size_h_type = E.SizeType.fixed;  break;
            case "content" : e.size_h_type = E.SizeType.content; break;
            case "parent"  : e.size_h_type = E.SizeType.parent;  break;
            case "window"  : e.size_h_type = E.SizeType.window;  break;
            case "max"     : e.size_h_type = E.SizeType.max;  break;
            default : 
                if (values[0].s.isNumeric ()) {
                    e.size_h_type = E.SizeType.fixed;
                    e.size.h      = values[0].s.to!H;
                }
                else {
                    throw new Exception ("unsupported size.h: " ~ values[0].s);
                }
        }
    }
}

void
set_hidden (E* e, TString[] values) {
    if (values.length) {
        if (values[0].s.isNumeric)
            e.hidden = values[0].s.to!int != 0;
    }
}

void
set_popup (E* e, TString[] values) {
    // e.popup = "popup-file";
}

void
set_aura_borders (E* e, TString[] values) {
    if (values.length >= 1) {
        set_border (e, &e.border, values[0..$]);
    }
}


void
set_aura_borders_color (E* e, TString[] values) {
    if (values.length >= 1) {
        set_border_color (e, &e.aura.border, values);
    }
}

void
set_aura (E* e, TString[] values) {
    if (values.length >= 2) {
        if (values[0].s.isNumeric)
            e.aura.size.w = values[0].s.to!X;

        if (values[1].s.isNumeric)
            e.aura.size.h = values[1].s.to!Y;
    }
    else
    if (values.length == 1) {
        if (values[0].s.isNumeric) {
            e.aura.size.w = values[0].s.to!X;
            e.aura.size.h = values[0].s.to!Y;
        }
    }
}

void
set_aura_color (E* e, TString[] values) {
    if (values.length) {
        Color c = e.aura.color;
        if (doc_parse_color (e, values, &c))
            e.aura.color = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_border (Border) (E* e, Border* border, TString[] values) {    
    if (values.length >= 2) {
        set_border_w     (e, border, values[0..1]);
        set_border_color (e, border, values[2..3]);
    }
}

void
set_border_w (Border) (E* e, Border* border, TString[] values) {
    if (values.length) {
        if (values[0].s.isNumeric)
            border.length = values[0].s.to!L;
    }
}

void
set_border_color (Border) (E* e, Border* border, TString[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (e, values, &c))
            border.color = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

bool
doc_parse_color (E* root, TString[] tss, Color* color) {
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
        TString[] color_s = doc_get_klass_field_value (root,tss[0].s);
        if (color_s.length)
            return parse_color (color_s, color); 
    }

    return false;
}

void
set_content_image (E* e, TString[] values) {
    if (values.length) {
        e.content.image.src = values[0].s;
    }
}


void
set_content_text (E* e, TString[] values) {
    if (values.length) {
        e.content.text.s = values.join (" ");
    }
}

void
set_text_fg (E* e, TString[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (e, values, &c))
            e.content.text.fg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_text_bg (E* e, TString[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (e, values, &c))
            e.content.text.bg = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_text_pos_type (E* e, TString[] values) {
    if (values.length) {
        switch (values[0].s) {
            case "_"       : e.content.text.pos_type = E.PosType._; break;
            default        : e.content.text.pos_type = E.PosType._;
        }
    }
}

void
set_content_size_w (E* e, TString[] values) {
    if (values.length) {
        switch (values[0].s) {
            case "e"      : e.content.size_w_type = E.Content.SizeType.e; break;
            case "fixed"  : e.content.size_w_type = E.Content.SizeType.fixed; break;
            case "childs" : e.content.size_w_type = E.Content.SizeType.childs; break;
            case "image"  : e.content.size_w_type = E.Content.SizeType.image; break;
            case "text"   : e.content.size_w_type = E.Content.SizeType.text; break;
            case "max"    : e.content.size_w_type = E.Content.SizeType.max; break;
            case "childs_image_text" : e.content.size_w_type = E.Content.SizeType.childs_image_text; break;
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
set_content_size_h (E* e, TString[] values) {
    if (values.length) {
        switch (values[0].s) {
            case "e"      : e.content.size_h_type = E.Content.SizeType.e; break;
            case "fixed"  : e.content.size_h_type = E.Content.SizeType.fixed; break;
            case "childs" : e.content.size_h_type = E.Content.SizeType.childs; break;
            case "image"  : e.content.size_h_type = E.Content.SizeType.image; break;
            case "text"   : e.content.size_h_type = E.Content.SizeType.text; break;
            case "max"    : e.content.size_h_type = E.Content.SizeType.max; break;
            case "childs_image_text" : e.content.size_w_type = E.Content.SizeType.childs_image_text; break;
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
set_content_size (E* e, TString[] values) {
    if (values.length >= 2) {
        set_content_size_w (e, values[0..1]);
        set_content_size_h (e, values[1..2]);
    }
    else
    if (values.length == 1) {
        set_content_size_w (e, values);
        set_content_size_h (e, values);
    }
}

void
set_content_siztype (E* e, TString[] values) {
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
set_content_text_font (E* e, TString[] values) {
    if (values.length >= 2) {
        set_content_text_font_file (e,values[0..1]);
        set_content_text_font_size (e,values[1..2]);
    }
    if (values.length >= 1) {
        set_content_text_font_file (e,values[0..1]);
    }
}

void
set_content_text_font_file (E* e, TString[] values) {
    if (values.length) {
        e.content.text.font.file = values[0].s;
    }
}

void
set_content_text_font_family (E* e, TString[] values) {
    if (values.length) {
        e.content.text.font.family = values[0].s;
    }
}

void
set_content_text_font_size (E* e, TString[] values) {
    if (values.length) {
        e.content.text.font.size = values[0].s.to!ubyte;
    }
}

void
set_bg (E* e, TString[] values) {
    if (values.length) {
        Color c;
        if (doc_parse_color (e,values, &c))
            e.content.color = c;
        else
            throw new Exception ("unsupported color: " ~ values.to!string);
    }
}

void
set_generator (E* e, TString[] values) {
    if (values.length >= 1) {
        Generator.Type type;

        switch (values[0].s) {
            case "none"  : type = Generator.Type.none;  break;
            case "cmd"   : type = Generator.Type.cmd;   break;
            case "fs"    : type = Generator.Type.fs;    break;
            case "klass" : type = Generator.Type.klass; break;
            default      : type = Generator.Type.none;   break;
        }
        e.generator.type = type;

        //
        parse_generator_args (e,type,values);
    }
}

void
parse_generator_args (E* e, Generator.Type type, TString[] values) {
    final
    switch (type) {
        case Generator.Type.none  : break;
        case Generator.Type.cmd   : parse_generator_args_cmd   (e,values); break;
        case Generator.Type.fs    : parse_generator_args_fs    (e,values); break;
        case Generator.Type.klass : parse_generator_args_klass (e,values); break;
    }
}

void
parse_generator_args_cmd (E* e, TString[] values) {
    e.generator.cmd.command = values[1];
    
    for (size_t i=2; i < values.length; i++) {
        switch (values[i].s) {
            case "delimiter" : 
                i++; 
                if (i < values.length) {
                    e.generator.cmd.delimiter = values[i];
                }
                break;
            case "require_delimiter" : 
                e.generator.cmd.require_delimiter = true;
                break;
            case "skip":
                i++; 
                if (i < values.length) {
                    if (values[i].s.isNumeric)
                        e.generator.cmd.skip = values[i].s.to!size_t; 
                }
                break;
            case "fields":
                i++; 
                if (i < values.length) {
                    set_generator_fields (e,values[i..i+1]);
                }
                break;
            default:
        }
    }
}

void
parse_generator_args_fs (E* e, TString[] values) {
    e.generator.fs.path = values[1];

    for (size_t i=2; i < values.length; i++) {
        switch (values[i].s) {
            case "fields":
                i++; 
                if (i < values.length) {
                    set_generator_fields (e,values[i..i+1]);
                }
                break;
            default:
        }
    }
}

void
parse_generator_args_klass (E* e, TString[] values) {
    e.generator.klass.klass = values[1];

    for (size_t i=2; i < values.length; i++) {
        switch (values[i].s) {
            case "fields":
                i++; 
                if (i < values.length) {
                    set_generator_fields (e,values[i..i+1]);
                }
                break;
            default:
        }
    }
}

void
set_generator_template (E* e, TString[] values) {
    if (values.length) {
        e.generator._template = values[0].s;
    }
}

void
set_generator_fields (E* e, TString[] values) {
    if (values.length) {
        e.generator.fields = values[0].s.split (",");
    }
}

void
set_content (E* e, TString[] values) {
    if (values.length) {
        //
    }
}

void
set_on (E* e, TString[] values) {
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
