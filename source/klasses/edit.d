module klasses.edit;

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


struct 
Edit {
    Klass _super = 
        Klass (
            typeof(this).stringof.toLower, 
            [], 
            &.event,
            &.update,
            &.set, 
            &.draw, 
        );
    alias _super this;

    size_t cursor_pos;
}


// KLASS_EVENT_FN  
void 
event (UTree* kls_t, Event* ev, UTree* e_t) {
    assert (kls_t.uni.type == Uni.Type.klass);
    assert (  e_t.uni.type == Uni.Type.e);
    Klass* kls = kls_t.klass;
    E*     e   = e_t.e;

    if (ev.type != SDL_MOUSEMOTION)
        writeln ("EDIT.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN: break;
        case SDL_KEYDOWN:  // SDL_KeyboardEvent
            // backspace
            // del
            // left
            // right
            // a-z а-я
            break;
        case SDL_KEYUP: break;
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

