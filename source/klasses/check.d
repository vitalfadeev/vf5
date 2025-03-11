module klasses.check;

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
Check {
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
        writeln ("CHECK.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.click : 
                    e.trigger_class (ev.doc,"check.pressed");
                    //emit ("on check.pressed", doc_t, e_t);
                    ev.doc.update (ev.doc);
                    e.redraw ();
                    break;
                default:
            }
            break;
        default:
    }
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, Doc* doc, E* e) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, Doc* doc, E* e, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (Klass* kls, SDL_Renderer* renderer, E* e) {
    //
}

