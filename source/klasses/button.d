module klasses.button;

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
import pix : redraw;


struct 
Button {
    Klass _super = 
        Klass (
            typeof(this).stringof.toLower, 
            [], 
            [], 
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
event (Klass* kls, Event* ev, E* e) {
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("BUTTON.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                ev.e.add_class ("button.pressed");
                ev.e.update (ev.e);
                e.redraw ();
            }
            break;
        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED) {
                ev.e.remove_class ("button.pressed");
                ev.e.update (ev.e);
                e.redraw ();
            }
            break;
        default:
    }
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, E* e) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (Klass* kls, Event* ev, E* e) {
    //
}

