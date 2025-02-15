module klasses.check;

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
Check {
    Klass _super = 
        Klass (
            "check", 
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
        writeln ("CHECK.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.click : 
                    e.trigger_class (ev.doc_t,"check.pressed");
                    emit ("on check.pressed", doc_t, e_t);
                    e_t.redraw ();
                    break;
                default:
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

