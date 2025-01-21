module events;

import bindbc.sdl;


alias Event = SDL_Event;

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
            while (SDL_WaitEvent (&ev) > 0) {
                int result = dg (&ev);
                if (result)
                    return result;
            }
        }        

        return 0;
    }
}

