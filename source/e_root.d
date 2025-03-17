module e_root;

import std.stdio;
import std.conv;
import bindbc.sdl;
import etree;
import e;
import e_update;
import klass;
import pix;
import txt_reader;
import events;
import types;


void
send_event_in_tree (E* root, Event* ev) {
    // klass event
    foreach (_e; WalkTree (root)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
    }
}

void
send_click_in_deep (E* e, Event* ev, Pos down_pos, Pos up_pos, ref E* deepest) {
    bool 
    valid_e (E* e) {
        return (
            pos_in_rect (down_pos, e.pos, e.size) &&
            pos_in_rect (up_pos,   e.pos, e.size)
        );
    }

    // klass event
    foreach (_e; FindDeepest (e,&valid_e)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
        deepest = _e;
    }
}


//void
//event (E* root, Event* ev) {
//    // event
//    //   KEYS  --> focused
//    //   CLICK --> if in x,y e.rect -> send -> in deep
//    //   MOUSE --> if in x,y e.rect -> send -> in deep
//    //   *     --> all
//    if (ev.type != SDL_MOUSEMOTION)
//        writefln ("ROOT(%s).event: %s", root.e_klasses_to_string, *ev);

//    switch (ev.type) {
//        //case SDL_MOUSEBUTTONDOWN:
//        //    if (ev.button.button == SDL_BUTTON_LEFT)
//        //    if (ev.button.state == SDL_PRESSED) {
//        //        E* deepest;
//        //        //send_mouse_event_in_deep (ev, root, Pos (ev.button.x,ev.button.y), deepest);
//        //        //ev.doc.update (ev.doc);
//        //        //redraw_window (ev.app_window);
//        //    }
//        //    break;
//        //case SDL_MOUSEBUTTONUP:
//        //    if (ev.button.button == SDL_BUTTON_LEFT)
//        //    if (ev.button.state == SDL_RELEASED) {
//        //        E* deepest;
//        //        //send_mouse_event_in_deep (ev, root, Pos (ev.button.x,ev.button.y), deepest);
//        //        root.remove_class_from_all ("button.pressed");
//        //        root.update ();
//        //        root.redraw ();
//        //        //redraw_window (ev.app_window);
//        //    }
//        //    break;
//        case SDL_KEYDOWN: 
//            break;// SDL_KeyboardEvent
//        case SDL_KEYUP: 
//            break;
//        case SDL_USEREVENT:
//            switch (ev.user.code) {
//                case USER_EVENT.start  : root.event (ev); break;
//                case USER_EVENT.update : root.event (ev); break;
//                case USER_EVENT.draw   : root.event (ev); break;
//                case USER_EVENT.redraw : root.event (ev); break;
//                case USER_EVENT.click  : root.event (ev); break;
//                default:
//            }
//            break;
//        case SDL_QUIT:
//            break;
//        default:
//            root.event (ev); break;
//    }

//    return;
//}

