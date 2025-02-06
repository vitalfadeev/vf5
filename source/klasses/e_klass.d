module klasses.e;

import std.stdio;
import std.string;
import std.conv;
import std.process;
import bindbc.sdl;
import events;
import doc;
import etree;
import klass;
import e;
import types;
import txt_parser : parse_color_hex, parse_color;
import pix : USER_EVENT;


struct 
E_Klass {
    Klass _super = 
        Klass (
            "e", 
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
event (Klass* kls, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer, ETree* t) {
    auto e = t.e;

    if (ev.type != SDL_MOUSEMOTION)
        writeln ("KLASS: ", kls.name, ".EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.start:
                    foreach (_on; e.on)
                        if (_on.event == "start")
                            exec_action (doc, _on.action);
                    break;
                case USER_EVENT.click:
                    foreach (_on; e.on)
                        if (_on.event == "click")
                            exec_action (doc, _on.action);
                    break;
                default:
            }
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
set (Klass* kls, Doc* doc, ETree* t, string field_id, string[] values) {
    auto e = t.e;

    switch (field_id) {
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
        case "text.font"        : set_content_text_font (doc,e,values); break;
        case "text.font.family" : set_content_text_font_family (doc,e,values); break;
        case "text.font.size"   : set_content_text_font_size   (doc,e,values); break;
        case "text.font.file"   : set_content_text_font_file   (doc,e,values); break;
        case "bg"               : set_bg                (doc,e,values); break;
        case "on"               : set_on                (doc,e,values); break;
        //case "e"                : set_e                 (doc,t,kls,values); break;
        default:
    }
}

// KLASS_DRAW_FN
void
draw (Klass* kls, SDL_Renderer* renderer, ETree* t) {
    import draws : draw_e;
    draw_e (renderer,t.e);
}

//
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
set_content_text_font (Doc* doc, E* e, string[] values) {
    if (values.length >= 2) {
        set_content_text_font_file (doc,e,values[0..1]);
        set_content_text_font_size (doc,e,values[1..2]);
    }
    if (values.length >= 1) {
        set_content_text_font_file (doc,e,values[0..1]);
    }
}

static 
string[] global_font_files;

void
set_content_text_font_file (Doc* doc, E* e, string[] values) {
    if (values.length) {
        // collect font names
        global_font_files ~= values[0];
        e.content.text.font.file = values[0];
    }
}

void
set_content_text_font_family (Doc* doc, E* e, string[] values) {
    if (values.length) {
        e.content.text.font.family = values[0];
    }
}

void
set_content_text_font_size (Doc* doc, E* e, string[] values) {
    if (values.length) {
        e.content.text.font.size = values[0].to!ubyte;
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

//void
//set_e (Doc* doc, ETree* t, Klass* kls, string[] values) {
//    auto e = t.e;
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

string
extract_value (Doc* doc, string bquoted) {
    //writeln ("extract_value: ", bquoted);

    auto stripped = bquoted.strip ("`");
    auto converted = extract_class_field_value (doc,stripped);
    auto ret = executeShell (converted);  // (int status, string output)

    //writeln (ret.status);
    //writeln (ret.output);

   return ret.output.stripRight ();
}


string
extract_class_field_value (Doc* doc, string s) {
    string[] cmd = doc_get_klass_field_value (doc,s);
    if (cmd.length)
        return cmd.join (" ");
    else
        return s;
}

