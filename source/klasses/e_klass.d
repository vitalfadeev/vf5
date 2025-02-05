module klasses.e;

import bindbc.sdl;
import events;
import doc;
import etree;
import klass;
import e;


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
    //
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
