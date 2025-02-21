module klasses.progress;

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
Progress {
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
}


// KLASS_EVENT_FN  
void 
event (UTree* kls_t, Event* ev, UTree* e_t) {
    assert (kls_t.uni.type == Uni.Type.klass);
    assert (  e_t.uni.type == Uni.Type.e);

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
                    if (e_t !is null) {
                        percent_from_click (e_t, click_ev.down_pos.x, click_ev.down_pos.y, &percent);
                        writeln ("progress.position: ", percent);
                        string[string] env = ["PROGRESS_POSITION" : percent.to!string];
                        go_on_event (ev.doc_t,e_t,"progress.position",env);
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
update (UTree* kls_t, UTree* doc_t, UTree* t) {
    // progress.position
    //   e e e
}

// KLASS_SET_FN
void 
set (UTree* kls_t, UTree* doc_t, UTree* t, string field_id, TString[] values) {
    auto e = t.e;

    switch (field_id) {
        case "progress"            : set_progress_position (doc_t,t,e,values); break;
        case "progress.position"   : set_progress_position (doc_t,t,e,values); break;
        default:
    }
}

// KLASS_DRAW_FN
void
draw (UTree* kls_t, SDL_Renderer* renderer, UTree* t) {
    //
}

void
percent_from_click (UTree* t, int click_x, int click_y, int* percent) {
    auto e = t.e;
    auto offset_x = click_x - e.content.pos.x;
    int  w = e.size.w;
    *percent = 100 * offset_x / w;
}

void
set_progress_position (UTree* doc_t, UTree* t, E* e, TString[] values) {
    if (values.length) {
        string percent = values[0].s;
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


UTree*
find (UTree* t, string kls_name) {
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
