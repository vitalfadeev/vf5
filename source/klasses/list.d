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
//import pix : force_send_user_event;


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


void
update_scrollbar (E* list) {
    // find scrollbar
    //   set offset,limit,total
    //   update
    auto percent = (100 * list.generator.offset / list.generator.total).to!byte;
    auto size    = (100 * list.generator.limit  / list.generator.total).to!byte;
    if (auto scrollbar = find_scrollbar (list)) {
        force_send_user_event!update_scrollbar_UserEvent (
            scrollbar, 
            percent,
            size
        );

        //import klasses.scrollbar : scrollbar_update;
        //if (scrollbar !is null)
        //    scrollbar.scrollbar_update (offset,limit,total);
    }
}

E*
find_scrollbar (E* list) {
    return list.find_child ("scrollbar");
}


// KLASS_EVENT_FN  
void 
event (Klass* kls, Event* ev, E* e) {
    version (debug_event)
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
                if (ev_wheel.y < 0) {
//                    e.fields ~= new Field ("generator.offset", TString (TString.Type.string,"1"));
                    if (e.generator.offset < e.generator.offset.max) {
                        e.generator.offset += 1;

                        import pix : update;
                        import pix : send_e_redraw;
                        import pix : send_user_event;
                        update_scrollbar (e);
                        send_user_event!update_UserEvent ();
                        send_e_redraw (e);
                    }
                }
                else
                if (ev_wheel.y > 0) {
                    if (e.generator.offset >= 1) {
                        e.generator.offset -= 1;

                        import pix : update;
                        import pix : send_e_redraw;
                        import pix : send_user_event;
//assert (0, "update scrollbar");
// List
//   scrollbar-klass -----------+
//     pos.y 50                 |
// Scrollbar scrollbar-klass <--+
//
// List
//   defined_klasses
//     local-scrollbar-klass
//  
//   defined_klasses
//     dir-list-template-name-1
//     dir-list-template-name-2
//     dir-list-template-name-3
//     dir-list-template-name-20
//
// kls = list.find_klass ("local-scrollbar-klass")
// kls.fields ~= Field ("pos.y", 50)
// scrollbar.add_klass (kls)
//
// List
//   Wheel Up
//   Wheel Dn
//     update (offset,limit,total)
//     if changed
//       Event Update Scrollbar (offset,limit,total) 
//         to child Scrollbar
//
// Scrollbar
//   Event Scroll Up Request ()
//   Event Scroll Dn Request ()
//   Event Scroll Page Up Request ()
//   Event Scroll Page Dn Request ()
//   Event Scroll Start Request ()
//   Event Scroll End Request ()
//   Event Scroll Percent Request (percent)
//     to parent List
//
                        update_scrollbar (e);
                        send_user_event!update_UserEvent ();
                        send_e_redraw (e);
                    }
                }
                break;
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
update (Klass* kls, update_UserEvent* ev, E* e) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (Klass* kls, draw_UserEvent* ev, E* e) {
    //
}


