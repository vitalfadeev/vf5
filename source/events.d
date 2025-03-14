module events;

import bindbc.sdl;
import types : Pos;
import etree;
import e : E;


struct
Event {
    SDL_Event _super;
    alias _super this;
    alias sdl = _super;

    SDL_Window*   app_window;
    SDL_Renderer* renderer;
}

enum 
USER_EVENT : Sint32 {
    start = 1,
    draw,
    redraw,
    click,
}


union
UserEvent {
    Uint32 type; // SDL_USEREVENT
    SDL_UserEvent   user;
    StartUserEvent  start;
    DrawUserEvent   draw;
    RedrawUserEvent redraw;
    ClickUserEvent  click;
}

struct
StartUserEvent {
    Uint32 type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.start;
}

struct
DrawUserEvent {
    Uint32        type = SDL_USEREVENT;
    Uint32        timestamp;
    Uint32        windowID;
    Sint32        code = USER_EVENT.draw;
    E*            e;
    SDL_Renderer* renderer;;
}

struct
RedrawUserEvent {
    Uint32        type = SDL_USEREVENT;
    Uint32        timestamp;
    Uint32        windowID;
    Sint32        code = USER_EVENT.redraw;
    E*            e;
    SDL_Renderer* renderer;;

    this (E* e) {
        this.e = e;
    }
}

struct
ClickUserEvent {
    Uint32 type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.click;
    Pos    down_pos;
    Pos    up_pos;


    this (Pos down_pos, Pos up_pos) {
        this.down_pos = down_pos;
        this.up_pos   = up_pos;
    }
}

