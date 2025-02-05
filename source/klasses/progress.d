module klasses.progress;

import std.string;
import bindbc.sdl;
import events;
import doc;
import etree;
import klass;
import e;
import std.stdio : writeln;
import types : Pos;

//if (kls.widget_set_fn !is null)
//    kls.widget_set_fn (doc,t,kls,field,values);
// widget is e ? ...with "widget" klass ?

struct 
Progress_Klass {
    Klass _super = 
        Klass (
            "progress_klass", 
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
event (Klass* kls, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer, ETree* t) {
    //
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, Doc* doc, ETree* t) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, Doc* doc, ETree* t, string field_id, string[] values) {
    auto e = t.e;

    switch (field_id) {
        case "progress"            : set_progress_position (doc,t,e,values); break;
        case "progress.position"   : set_progress_position (doc,t,e,values); break;
        default:
    }
}

// KLASS_DRAW_FN
void
draw (Klass* kls, SDL_Renderer* renderer, ETree* t) {
    //
}

void
set_progress_position (Doc* doc, ETree* t, E* e, string[] values) {
    if (values.length) {
        string percent = values[0];
        percent = percent.stripRight ("%");

        if (!isNumeric (percent))
            return;

        // 50%
        auto passed  = t.find ("widget-progress-passed");
        auto current = t.find ("widget-progress-current");
        auto rest    = t.find ("widget-progress-rest");
        //passed.size.w = ...
        //current.pos.x = ...
        //rest.pos.x    = ...
        //rest.size.w   = ...
    }
}

// WIDGET_EVENT_FN
void 
event (Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    bool drag_started = false;
    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN: {
            // Drag start
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                // tree_apply_klasses (doc.tree);
                //auto clicked_e = doc.find_e_at_pos (Pos (ev.button.x.to!X, ev.button.y.to!Y));
                //if (clicked_e !is null) {
                //    drag_started = true;
                //}
            }
            break;
        }
        case SDL_MOUSEMOTION: {
            // Drag
            // ev.motion.state
            // ev.motion.x, ev.motion.y
            //
            // e.redraw () // rect 1
            // e.pos + delta
            // e.update ()
            // e.redraw () // rect 2
            break;
        }
        case SDL_MOUSEBUTTONUP: {
            // Drop
            // ev.button
            // ev.button.button
            // ev.button.state
            // ev.button.x, ev.button.y
            break;
        }
        case SDL_WINDOWEVENT: break;
        case SDL_USEREVENT: break;
        case SDL_QUIT: break;
        default:
    }
}


ETree*
find (ETree* t, string kls_name) {
    return null;
}

// widget["progress"]
//
// widget_progress_set_position ()
//   passed.size.w = ...
//   current.pos.x = ...
//   rest.pos.x    = ...
//   rest.size.w   = ...

// Click
//   command audtool jump-to ...
//   update
//   draw
