module widget.progress;

import std.string;
import bindbc.sdl;
import events;
import doc;
import etree;
import klass;
import e;


// WIDGET_SET_FN
void
set (Doc* doc, ETree* t, Klass* kls, string field, string[] values) {
    auto e = t.e;

    switch (field) {
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

void 
event (Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    switch (ev.type) {
        case SDL_QUIT: break;
        case SDL_MOUSEBUTTONDOWN: break;
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
