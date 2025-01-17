module events;

import bindbc.sdl;


struct
Event {
    SDL_Event _e;
    alias _e this;
    //Type type;
    //enum
    //Type {
    //    none,
    //    click,
    //    draw,
    //}
}

void
go (Event* event) {
    // event
    //   click
    //     add_class
    //       apply_classes
    //       update_pos_size
    //   draw
}


struct
Events {
    bool _go = true;
    Event ev;

    int
    opApply (int delegate (Event* ev) dg) {
        while (_go) {
            while (SDL_WaitEvent (&ev._e) > 0) {
                int result = dg (&ev);
                if (result)
                    return result;
            }
        }        

        return 0;
    }
}

