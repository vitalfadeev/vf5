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


auto
new_root () {
    auto root = new E ();
    root.size     = Size (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H);
    root.fn.event = &.event;
    return root;
}

void
on_click (Event* ev) {
    auto click_ev = cast (ClickUserEvent*) ev;
    _on_click (
        ev,
        click_ev.down_pos, 
        click_ev.up_pos, 
    );
}

void
_on_click (Event* ev, Pos down_pos, Pos up_pos) {
    //
    E* deepest;
    foreach (E* _e_tree; WalkChilds (ev.e)) {
        send_click_in_deep (
            ev, 
            _e_tree, 
            down_pos,
            up_pos,
            deepest);

            // focused
            //remove_class_from_all (_e_tree,"focused");
            //if (deepest !is null)
                //deepest.add_class (ev.doc,"focused");
    }

    //
    ev.e.update ();
    writeln ("deepest: ", *deepest);
    writeln ("deepest: ", deepest.content.image);
    if (deepest !is null)
        deepest.redraw ();
}

void
event (E* root, Event* ev) {
    // event
    //   KEYS  --> focused
    //   CLICK --> if in x,y e.rect -> send -> in deep
    //   MOUSE --> if in x,y e.rect -> send -> in deep
    //   *     --> all
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("ROOT.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                E* deepest;
                send_mouse_event_in_deep (ev, root, Pos (ev.button.x,ev.button.y), deepest);
                //ev.doc.update (ev.doc);
                //redraw_window (ev.app_window);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_RELEASED) {
                E* deepest;
                send_mouse_event_in_deep (ev, root, Pos (ev.button.x,ev.button.y), deepest);
                //remove_class_from_all (doc,"button-pressed");
                //ev.doc.update (ev.doc);
                //redraw_window (ev.app_window);
            }
            break;
        case SDL_KEYDOWN: break;// SDL_KeyboardEvent
        case SDL_KEYUP: break;
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.start  : send_event_in_tree (ev); break;
                case USER_EVENT.draw   : root.draw (ev); break;
                case USER_EVENT.redraw : root.draw (ev); break;
                case USER_EVENT.click  : on_click (ev); break;
                default:
            }
            break;
        case SDL_QUIT:
            return;
            break;
        default:
    }

    return;
}

