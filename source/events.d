module events;

import std.format : format;
import std.conv : to;
import bindbc.sdl;
import types : Loc;
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

    Window*       window;
    SDL_Renderer* renderer;
    Klasses*      klasses;

    string
    toString () {
        return 
            format!
                "Event(%s,%s)" 
                (cast (_SDL_EventType_decode) type, 
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
    scroll_up_request,
    scroll_dn_request,
    scroll_page_up_request,
    scroll_page_dn_request,
    scroll_start_request,
    scroll_end_request,
    scroll_percent_request,
    update_scrollbar,
}


union
UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    union {
        SDL_UserEvent                    user;
        start_UserEvent                  start;
        update_UserEvent                 update;
        draw_UserEvent                   draw;
        redraw_UserEvent                 redraw;
        click_UserEvent                  click;
        scroll_up_request_UserEvent      scroll_up_request;
        scroll_dn_request_UserEvent      scroll_dn_request;
        scroll_page_up_request_UserEvent scroll_page_up_request;
        scroll_page_dn_request_UserEvent scroll_page_dn_request;
        scroll_start_request_UserEvent   scroll_start_request;
        scroll_end_request_UserEvent     scroll_end_request;
        scroll_percent_request_UserEvent scroll_percent_request;
        update_scrollbar_UserEvent       update_scrollbar;
    }

    this (update_UserEvent ev) {
        this.update = ev;
    }

    this (start_UserEvent ev) {
        this.start = ev;
    }

    this (draw_UserEvent ev) {
        this.draw = ev;
    }

    this (redraw_UserEvent ev) {
        this.redraw = ev;
    }

    this (click_UserEvent ev) {
        this.click = ev;
    }

    this (update_scrollbar_UserEvent ev) {
        this.update_scrollbar = ev;
    }
}

struct
start_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.start;
}

struct
update_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32        timestamp;
    Uint32        windowID;
    Sint32        code = USER_EVENT.update;
    E*            e;
    E*            root;
    Window*       window;

    this (E* e) {
        this.e = e;
    }
}

struct
draw_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32        timestamp;
    Uint32        windowID;
    Sint32        code = USER_EVENT.draw;
    E*            e;
    SDL_Renderer* renderer;
    Loc[]         offsets;
}

struct
redraw_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
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
click_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.click;
    Loc    down_loc;
    Loc    up_loc;


    this (Loc down_loc, Loc up_loc) {
        this.down_loc = down_loc;
        this.up_loc   = up_loc;
    }
}

struct
scroll_up_request_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.scroll_up_request;
}

struct
scroll_dn_request_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.scroll_dn_request;
}

struct
scroll_page_up_request_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.scroll_page_up_request;
}

struct
scroll_page_dn_request_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.scroll_page_dn_request;
}

struct
scroll_start_request_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.scroll_start_request;
}

struct
scroll_end_request_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.scroll_end_request;
}

struct
scroll_percent_request_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.scroll_percent_request;
    int    percent;

    this (int percent) {
        this.percent = percent;
    }
}

struct
update_scrollbar_UserEvent {
    SDL_EventType type = SDL_USEREVENT;
    Uint32 timestamp;
    Uint32 windowID;
    Sint32 code = USER_EVENT.update_scrollbar;
    byte   pos_percent;
    byte   size_percent;


    this (byte pos_percent, byte size_persent) {
        this.pos_percent  = pos_percent;
        this.size_percent = size_percent;
    }
}



//
enum  _SDL_EventType_decode : SDL_EventType {
    SDL_FIRSTEVENT                = 0,
    SDL_QUIT                      = 0x100,
    SDL_APP_TERMINATING           = 0x101,
    SDL_APP_LOWMEMORY             = 0x102,
    SDL_APP_WILLENTERBACKGROUND   = 0x103,
    SDL_APP_DIDENTERBACKGROUND    = 0x104,
    SDL_APP_WILLENTERFOREGROUND   = 0x105,
    SDL_APP_DIDENTERFOREGROUND    = 0x106,
    SDL_WINDOWEVENT               = 0x200,
    SDL_SYSWMEVENT                = 0x201,
    SDL_KEYDOWN                   = 0x300,
    SDL_KEYUP                     = 0x301,
    SDL_TEXTEDITING               = 0x302,
    SDL_TEXTINPUT                 = 0x303,
    SDL_MOUSEMOTION               = 0x400,
    SDL_MOUSEBUTTONDOWN           = 0x401,
    SDL_MOUSEBUTTONUP             = 0x402,
    SDL_MOUSEWHEEL                = 0x403,
    SDL_JOYAXISMOTION             = 0x600,
    SDL_JOYBALLMOTION             = 0x601,
    SDL_JOYHATMOTION              = 0x602,
    SDL_JOYBUTTONDOWN             = 0x603,
    SDL_JOYBUTTONUP               = 0x604,
    SDL_JOYDEVICEADDED            = 0x605,
    SDL_JOYDEVICEREMOVED          = 0x606,
    SDL_CONTROLLERAXISMOTION      = 0x650,
    SDL_CONTROLLERBUTTONDOWN      = 0x651,
    SDL_CONTROLLERBUTTONUP        = 0x652,
    SDL_CONTROLLERDEVICEADDED     = 0x653,
    SDL_CONTROLLERDEVICEREMOVED   = 0x654,
    SDL_CONTROLLERDEVICEREMAPPED  = 0x655,
    SDL_FINGERDOWN                = 0x700,
    SDL_FINGERUP                  = 0x701,
    SDL_FINGERMOTION              = 0x702,
    SDL_DOLLARGESTURE             = 0x800,
    SDL_DOLLARRECORD              = 0x801,
    SDL_MULTIGESTURE              = 0x802,
    SDL_CLIPBOARDUPDATE           = 0x900,
    SDL_DROPFILE                  = 0x1000,
    SDL_USEREVENT                 = 0x8000,
    SDL_LASTEVENT                 = 0xFFFF,
    SDL_RENDER_TARGETS_RESET      = 0x2000,
    SDL_KEYMAPCHANGED             = 0x304,
    SDL_AUDIODEVICEADDED          = 0x1100,
    SDL_AUDIODEVICEREMOVED        = 0x1101,
    SDL_RENDER_DEVICE_RESET       = 0x2001,
    SDL_DROPTEXT                  = 0x1001,
    SDL_DROPBEGIN                 = 0x1002,
    SDL_DROPCOMPLETE              = 0x1003,
    SDL_DISPLAYEVENT              = 0x150,
    SDL_SENSORUPDATE              = 0x1200,
    SDL_LOCALECHANGED             = 0x107,
    SDL_CONTROLLERTOUCHPADDOWN    = 0x656,
    SDL_CONTROLLERTOUCHPADMOTION  = 0x657,
    SDL_CONTROLLERTOUCHPADUP      = 0x658,
    SDL_CONTROLLERSENSORUPDATE    = 0x659,
    SDL_TEXTEDITING_EXT           = 0x305,
    SDL_JOYBATTERYUPDATED         = 0x607,
    SDL_CONTROLLERUPDATECOMPLETE_RESERVED_FOR_SDL3 = 0x65A,
    SDL_CONTROLLERSTEAMHANDLEUPDATED = 0x65B,
}
