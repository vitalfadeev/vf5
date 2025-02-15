module klasses.button;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import tstring;
import events;
import doc;
import utree;
import klass;
import e;
import types;
import pix : redraw;


struct 
Button {
    Klass _super = 
        Klass (
            "button", 
            [], 
            &.event,
            &.update,
            &.set, 
            &.draw, 
        );
    alias _super this;
}


// KLASS_EVENT_FN  
void 
event (UTree* kls_t, Event* ev, UTree* e_t) {
    Klass* kls = kls_t.klass;
    E*     e   = e_t.e;

    if (ev.type != SDL_MOUSEMOTION)
        writeln ("BUTTON.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                e.add_class (ev.doc_t,"button.pressed");
                e_t.redraw ();
                //writeln ("BUTTON: SDL_MOUSEBUTTONDOWN: button.pressed");
                //ev.doc_t.doc.update (ev.doc_t);
                //import pix;
                //pix.redraw_window (ev.app_window);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED) {
                e.remove_class (ev.doc_t,"button.pressed");
                e_t.redraw ();
                //remove_class_from_all (doc_t,"button-pressed");
                //ev.doc_t.doc.update (ev.doc_t);
                //redraw_window (ev.app_window);
            }
            break;
        default:
    }
}

// KLASS_UPDATE_FN 
void 
update (UTree* kls_t, UTree* doc_t, UTree* t) {
    //
}

// KLASS_SET_FN
void 
set (UTree* kls_t, UTree* doc_t, UTree* t, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (UTree* kls_t, SDL_Renderer* renderer, UTree* t) {
    //
}

