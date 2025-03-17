module events;

import std.format : format;
import std.conv : to;
import bindbc.sdl;
import types : Pos;
import etree;
import e : E;


struct
Event {
    union {
        SDL_Event _super;
        UserEvent _user;
    }
    alias _super this;
    alias sdl = _super;

    SDL_Window*   app_window;
    SDL_Renderer* renderer;

    string
    toString () {
        return 
            format!
                "Event(%s,%s)" 
                (type, 
                (type == SDL_USEREVENT) ? 
                    (cast(USER_EVENT)user.code).to!string : 
                    ""
                );
    }
}

enum 
USER_EVENT : Sint32 {
    start = 1,
    update,
    draw,
    redraw,
    click,
}


union
UserEvent {
    Uint32 type = SDL_USEREVENT;
    union {
        SDL_UserEvent   user;
        StartUserEvent  start;
        UpdateUserEvent update;
        DrawUserEvent   draw;
        RedrawUserEvent redraw;
        ClickUserEvent  click;
    }

    this (UpdateUserEvent ev) {
        this.update = ev;
    }

    this (StartUserEvent ev) {
        this.start = ev;
    }

    this (DrawUserEvent ev) {
        this.draw = ev;
    }

    this (RedrawUserEvent ev) {
        this.redraw = ev;
    }

    this (ClickUserEvent ev) {
        this.click = ev;
    }
}

struct
StartUserEvent {
    Uint32 type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.start;
}

struct
UpdateUserEvent {
    Uint32        type = SDL_USEREVENT;
    Uint32        timestamp;
    Uint32        windowID;
    Sint32        code = USER_EVENT.update;
    E*            e;

    this (E* e) {
        this.e = e;
    }
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

