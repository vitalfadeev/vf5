module klasses.e;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import etree;
import e : E,content;
import e_update : 
    go_on_event, apply_e_klasses, apply_e_fields,
    load_e_image, load_e_font, load_e_colors, load_e_text,
    update_e_size, update_e_pos, load_e_childs,
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
update (Klass* kls, UpdateUserEvent* ev, E* e) {
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
    if (1)
        e.update_e_size ();
    version (profile) time_step ("update_e_size");

    // 7
    if (1)
        e.update_e_pos ();
    version (profile) time_step ("update_e_pos");

    // 8
    if (e.generator.type != Generator.Type.none)
        e.load_e_childs ();
    version (profile) time_step ("load_e_childs");
}

// KLASS_SET_FN
void
set (Klass* kls, E* e, string field_id, TString[] values) {
    switch (field_id) {
        case "pos.x"             : set_pos_x              (e,values); break;
        case "pos.y"             : set_pos_y              (e,values); break;
        case "pos"               : set_pos                (e,values); break;
        case "pos.type"          : set_pos_type           (e,values); break;
        case "pos.group"         : set_pos_group          (e,values); break;
        case "pos.dir"           : set_pos_dir            (e,values); break;
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
draw (Klass* kls, DrawUserEvent* ev, E* e) {
    version (debug_event)
    writefln ("KLASS(%s).draw, E(%s), event %s", kls.name, e.e_klasses_to_string, *ev);
    e_klass_draw.draw (ev.renderer,e);
}

//
void
set_pos (E* e, TString[] values) {
    if (values.length >= 2) {
        if (values[1].type == TString.Type.string && values[1].s == "%") {
            set_pos_x_percent (e, values[0..1]);
            e.pos_type = E.PosType.percent;
        }
        else {
            set_pos_x (e, values[0..1]);
            set_pos_y (e, values[1..$]);
            //e.pos_type = E.PosType.fixed;
        }
    }
    else
    if (values.length == 1) {
        set_pos_x (e, values[0..1]);
        set_pos_y (e, values[0..1]);
        //e.pos_type = E.PosType.fixed;
    }
}

void
set_pos_type (E* e, TString[] values) {
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
            case "fixed"   : e.pos_type = E.PosType.fixed; break;
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
            case "fixed"   : e.pos_type = E.PosType.fixed; break;
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
set_pos_group (E* e, TString[] values) {
    if (values.length >= 1) {
        e.pos_group = values[0].s.to!ubyte;
    }
}

void
set_pos_dir (E* e, TString[] values) {
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
set_pos_x (E* e, TString[] values) {
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
set_pos_x_percent (E* e, TString[] values) {
    if (values.length) {
        string value = values[0].s;

        if (value.isNumeric)
            e.pos_percent = value.to!byte;
        else
            e.pos_percent = 0;
    }
}

void
set_pos_y (E* e, TString[] values) {
    if (values.length) {
        if (values[0].s.isNumeric ()) {
            e.pos.y = values[0].s.to!Y;
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
        set_border (e, &e.aura.border, values[0..$]);
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
set_border (E* e, E.Border* border, TString[] values) {    
    if (values.length >= 3) {
        set_border_w     (e, border, values[0..1]);
        set_border_type  (e, border, values[1..2]);
        set_border_color (e, border, values[2..3]);
    }
}

void
set_border_w (E* e, E.Border* border, TString[] values) {
    if (values.length) {
        if (values[0].s.isNumeric)
            border.w = values[0].s.to!W;
    }
}

void
set_border_type (E* e, E.Border* border, TString[] values) {
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
set_border_color (E* e, E.Border* border, TString[] values) {
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
