module widget_progress;

import std.string;
import bindbc.sdl;
import events;
import doc;
import etree;
import klass;
import e;
import std.stdio : writeln;

//if (kls.widget_set_fn !is null)
//    kls.widget_set_fn (doc,t,kls,field,values);
// widget is e ? ...with "widget" klass ?

struct 
Widget_Progress_Klass {
    Klass _super = 
        Klass (
            "widget-progress", 
            [], 
            &.set, 
            &.event
        );
    alias _super this;
}


// WIDGET_SET_FN
void
set (Doc* doc, ETree* t, Klass* kls, string field_id, string[] values) {
    auto e = t.e;

    switch (field_id) {
        case "progress"            : set_progress_position (doc,t,e,values); break;
        case "progress.position"   : set_progress_position (doc,t,e,values); break;
        default:
    }
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
    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN: break;
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
