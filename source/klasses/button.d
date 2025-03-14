module klasses.button;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import etree;
import e;
import e_update;
import klass;
import types;
import tstring;
import events;
import pix : send_e_redraw;


struct 
Button {
    Klass _super = 
        Klass (
            typeof(this).stringof.toLower, 
            [], 
            [], 
            [], 
            Klass.Fn (
                &.event,
                &.update,
                &.set, 
                &.draw, 
                null
            )
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
            if (ev.button.state == SDL_PRESSED)
            if (event_for_me (kls,ev,e)) {
                e.add_class ("button.pressed");
                e.send_e_update ();
                e.send_e_redraw ();
            }
            break;

        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED)
            if (e.has_class ("button.pressed")) {
                e.remove_class ("button.pressed");
                e.send_e_update ();
                e.send_e_redraw ();
            }
            break;

        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.click:
                    if (event_for_me (kls,cast (ClickUserEvent*) ev,e))
                        go_on_event (e,"click");
                    break;
                default:
            }
            break;
        default:
    }
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, Event* ev, E* e) {
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
