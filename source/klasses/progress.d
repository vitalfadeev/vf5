module klasses.progress;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import events;
import doc;
import etree;
import klass;
import e;
import types;
import pix : USER_EVENT;
import pix : ClickUserEvent;


struct 
Progress {
    Klass _super = 
        Klass (
            "progress", 
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
    if (ev.type != SDL_MOUSEMOTION)
        writeln ("PROGRESS.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");
    bool drag_started = false;
    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN: {
            // Drag start
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state  == SDL_PRESSED) {
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
        case SDL_USEREVENT: {
            switch (ev.user.code) {
                case USER_EVENT.click:
                    auto click_ev = cast (ClickUserEvent*) ev;
                    int percent;
                    if (t !is null) {
                        percent_from_click (t, click_ev.down_pos.x, click_ev.down_pos.y, &percent);
                        writeln ("progress.position: ", percent);
                        string[string] env = ["PROGRESS_POSITION" : percent.to!string];
                        go_on_event (doc,t,"progress.position",env);
                        // total = audtool current-song-length-seconds
                        // now   = audtool current-song-output-length-seconds
                        // seek  = total * precent
                        //         udtool playback-seek seek
                        // exec (`audtool playback-seek %s`, precent_to_time (precent));
                    }
                    break;
                default:
            }
            break;
        }
        case SDL_QUIT: break;
        default:
    }
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, Doc* doc, ETree* t) {
    // progress.position
    //   e e e
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
percent_from_click (ETree* t, int click_x, int click_y, int* percent) {
    auto e = t.e;
    auto offset_x = click_x - e.content.pos.x;
    int  w = e.size.w;
    *percent = 100 * offset_x / w;
}

void
set_progress_position (Doc* doc, ETree* t, E* e, string[] values) {
    if (values.length) {
        string percent = values[0];
        percent = percent.stripRight ("%");

        if (!isNumeric (percent))
            return;

        // 50%
        auto passed  = t.find ("progress-passed");
        auto current = t.find ("progress-current");
        auto rest    = t.find ("progress-rest");
        //passed.size.w = ...
        //current.pos.x = ...
        //rest.pos.x    = ...
        //rest.size.w   = ...
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
