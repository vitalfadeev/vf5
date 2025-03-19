module klasses.list;

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


struct 
List {
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
            )
        );
    alias _super this;
}


// KLASS_EVENT_FN  
void 
event (Klass* kls, Event* ev, E* e) {
    if (ev.type != SDL_MOUSEMOTION)
        writefln ("LIST.event: %s, for: %s", *ev, *e);

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN: break;
        case SDL_MOUSEWHEEL: {
            auto ev_wheel = &ev.wheel;

            // ev_wheel
            //   .x  >0 right    <0 left
            //   .y  >0 forward  <0 back
            //   .direction == SDL_MOUSEWHEEL_NORMAL
            //   .direction == SDL_MOUSEWHEEL_FLIPPED
            //   .mouseX
            //   .mouseY

            if (event_for_me (kls,ev_wheel,e)) {
                writeln ("event_for_me");
                if (ev_wheel.y < 0) {
//                    e.fields ~= new Field ("generator.offset", TString (TString.Type.string,"1"));
                    if (e.generator.offset < e.generator.offset.max) 
                        e.generator.offset += 1;
                }
                else
                if (ev_wheel.y > 0) {
                    if (e.generator.offset >= 1)
                        e.generator.offset -= 1;
                }

                import pix : update;
                import pix : send_e_redraw;
                update (e);
                send_e_redraw (e);
            }

            break;
        }
        case SDL_KEYDOWN: {  // SDL_KeyboardEvent
            if (ev.key.keysym.sym == SDLK_UP) {
                // go up
            }
            if (ev.key.keysym.sym == SDLK_DOWN) {
                // go down
                //   find selected
                //   select next 
                //   update
                //   redraw
            }
            break;
        }
        case SDL_KEYUP: break;
        default:
    }
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, UpdateUserEvent* ev, E* e) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (Klass* kls, DrawUserEvent* ev, E* e) {
    //
}


