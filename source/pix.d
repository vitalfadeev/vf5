import std.conv;
import std.format;
import std.stdio;
import bindbc.sdl;
import bindbc.sdl.image;
import bindbc.sdl.ttf;
import doc;
import etree;
import klass;
import events;
import draws;
import types;
import std.string : fromStringz; 
import std.string : toStringz;
import std.algorithm.searching : canFind;

alias PIX_EVENT_FN  = int  function (Pix* pix, Event* ev, SDL_Window* window, SDL_Renderer* renderer, Doc* doc);
alias PIX_UPDATE_FN = void function (Pix* pix, Doc* doc);
alias PIX_DRAW_FN   = void function (Pix* pix, SDL_Renderer* renderer, Doc* doc);
alias PIX_GO_FN     = int  function (Pix* pix, Doc* doc);

struct 
Pix {
    PIX_EVENT_FN  event  = &.event;
    PIX_UPDATE_FN update = &.update;
    PIX_DRAW_FN   draw   = &.draw;
    PIX_GO_FN     go     = &.go;

    void
    setup () {
        init_sdl ();
    }
}

enum 
USER_EVENT : Sint32 {
    start = 1,
    redraw,
    click,
}


int 
go (Pix* pix, Doc* doc) {
    // Window, Surface
    SDL_Window* window = new_window (__FILE_FULL_PATH__);

    // Renderer
    SDL_Renderer* renderer = new_renderer (window);

    //
    doc.window = new Window (window);

    // Event "start"
    send_user_event (StartUserEvent ());

    // Event Loop
    foreach (Event* ev; Events ())
        if (pix.event (pix,ev,window,renderer,doc) == 1)
            break;

    return 0;
}


void
translate (Event* ev) {
    click_translate (ev);
}

void
click_translate (Event* ev) {
    static Pos down_pos;

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                // save pos down
                down_pos = Pos (ev.button.x.to!X, ev.button.y.to!Y);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            // load pos down
            // get  pos up
            // send click (down_pos, up_pos)
            Pos up_pos = Pos (ev.button.x.to!X, ev.button.y.to!Y);
            send_user_event (USER_EVENT.click, down_pos.toVoidPtr, up_pos.toVoidPtr);
            down_pos = Pos ();
            break;
        default:
    }
}

// foreach (ev; Events)
//   vf.event (ev)
//   tree
//     e
//      foreach (kls; klasses)  // widget
//        kls.event (ev)

int
event (Pix* pix, Event* ev, SDL_Window* window, SDL_Renderer* renderer, Doc* doc) {
    //if (ev.type != SDL_MOUSEMOTION)
    //    writeln ("PIX.EVENT: ", ev.type);
    translate (ev);

    switch (ev.type) {
        case SDL_WINDOWEVENT:
            switch (ev.window.event) {
                case SDL_WINDOWEVENT_EXPOSED: pix.draw (pix,renderer,doc); break; // event.window.windowID
                case SDL_WINDOWEVENT_SHOWN: break;        // event.window.windowID
                case SDL_WINDOWEVENT_HIDDEN: break;       // event.window.windowID
                case SDL_WINDOWEVENT_MOVED: break;        // event.window.windowID event.window.data1 event.window.data2 (x y)
                case SDL_WINDOWEVENT_RESIZED: pix.update (pix,doc); break; // event.window.windowID event.window.data1 event.window.data2 (width height)
                case SDL_WINDOWEVENT_SIZE_CHANGED: break; // event.window.windowID event.window.data1 event.window.data2 (width height)
                case SDL_WINDOWEVENT_MINIMIZED: break;    // event.window.windowID
                case SDL_WINDOWEVENT_MAXIMIZED: break;    // event.window.windowID
                case SDL_WINDOWEVENT_RESTORED: break;     // event.window.windowID
                case SDL_WINDOWEVENT_ENTER: break;        // event.window.windowID
                case SDL_WINDOWEVENT_LEAVE: break;        // event.window.windowID
                case SDL_WINDOWEVENT_FOCUS_GAINED: break; // event.window.windowID
                case SDL_WINDOWEVENT_FOCUS_LOST: break;   // event.window.windowID
                case SDL_WINDOWEVENT_CLOSE: break;        // event.window.windowID
                //case SDL_WINDOWEVENT_TAKE_FOCUS: break;   // event.window.windowID
                //case SDL_WINDOWEVENT_HIT_TEST: break;     // event.window.windowID
                default:
                    SDL_Log ("Window %d got unknown event %d",
                        ev.window.windowID, ev.window.event);
            }
            break;
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.redraw : pix.draw (pix,renderer,doc); break;
                default: auto result = doc.event (doc,ev,window,renderer); if (result) return result;
            }
            break;
        case SDL_QUIT: auto result = doc.event (doc,ev,window,renderer); if (result) return result; else return 1;
        default: auto result = doc.event (doc,ev,window,renderer); if (result) return result;
    }

    return 0;
}

void
update (Pix* pix, Doc* doc) {
    doc.update (doc); 
}

void
draw (Pix* pix, SDL_Renderer* renderer, Doc* doc) {
    // clear
    SDL_SetRenderDrawColor (renderer, 0x00, 0x00, 0x00, 0xFF);
    SDL_RenderClear (renderer);
    // draw
    doc.draw (doc,renderer);
    // rasterize
    SDL_RenderPresent (renderer);
}



//
void 
init_sdl () {
    // SDL
    version (Windows)
        SDLSupport ret = loadSDL ("sdl2.dll");
    else
        SDLSupport ret = loadSDL();
    
    if (ret != sdlSupport) {
        if (ret == SDLSupport.noLibrary) 
            throw new Exception ("The SDL shared library failed to load");
        else 
        if (ret == SDLSupport.badLibrary) 
            throw new Exception ("One or more symbols failed to load. The likely cause is that the shared library is for a lower version than bindbc-sdl was configured to load (via SDL_204, GLFW_2010 etc.)");
    }

    //if (SDL_Init (SDL_INIT_EVERYTHING) < 0)
    if (SDL_Init (SDL_INIT_VIDEO | SDL_INIT_EVENTS) < 0)
        throw new SDLException ("The SDL init failed");

    SDL_version sdl_ver;
    SDL_GetVersion (&sdl_ver);
    writeln ("SDL bindbc: ", ret, " lib: ", sdl_ver);

    // IMG
    auto sdlimage_ret = loadSDLImage ();
    writeln ("SDL_Image: ", sdlimage_ret);
    if (sdlimage_ret < sdlImageSupport) // 2.6.3
        throw new Exception ("The SDL_Image shared library failed to load");
    
    auto flags = IMG_INIT_PNG; // | IMG_INIT_JPG;
    if (IMG_Init (flags) != flags)
        throw new IMGException ("The SDL_Image init failed");

    // TTF
    auto sdlttf_ret = loadSDLTTF (); // SDLTTFSupport
    writeln ("SDL_TTF: ", sdlttf_ret);
    if (sdlttf_ret < sdlTTFSupport) // 2.0.20
        throw new TTFException ("The SDL_TTF shared library failed to load:");
    
    if (TTF_Init () == -1)
        throw new TTFException ("Failed to initialise SDL_TTF");
}

/**
FreeImage error handler
@param fif Format / Plugin responsible for the error 
@param message Error message
*/
/*
void FreeImageErrorHandler(FREE_IMAGE_FORMAT fif, const char *message) {
    printf("\n*** "); 
    printf("%s Format\n", FreeImage_GetFormatFromFIF(fif));
    printf(message);
    printf(" ***\n");
}
*/



//
SDL_Window*
new_window (string window_title) {
    // Window
    SDL_Window* window = 
        SDL_CreateWindow (
            window_title.toStringz, // "SDL2 Window",
            SDL_WINDOWPOS_CENTERED,
            SDL_WINDOWPOS_CENTERED,
            DEFAULT_WINDOW_W, DEFAULT_WINDOW_H,
            SDL_WINDOW_RESIZABLE
        );

    if (!window)
        throw new SDLException ("Failed to create window");

    // Update
    SDL_UpdateWindowSurface (window);

    return window;
}


//
SDL_Renderer* 
new_renderer (SDL_Window* window) {
    return SDL_CreateRenderer (window, -1, SDL_RENDERER_SOFTWARE);
}


TTF_Font*
open_font (string file_name, int font_size) {
    //TTF_Font* font = TTF_OpenFont (file_name.toStringz, font_size);
    TTF_Font* font = TTF_OpenFontDPI (file_name.toStringz, font_size, 102, 102);
    if (font !is null)
        return font;

    throw new TTFException ("TTF_OpenFont");
}

struct
Window {
    SDL_Window* _super;

    Size
    size () {
        int w,h;
        SDL_GetWindowSize (_super, &w, &h);
        return Size (w.to!W,h.to!H);
    }
}


void
send_user_event (StartUserEvent ev) {
    SDL_PushEvent (cast(SDL_Event*)&ev);
}

void
send_user_event (ClickUserEvent ev) {
    SDL_PushEvent (cast(SDL_Event*)&ev);
}

void
send_user_event (USER_EVENT user_event_id) {
    SDL_Event ev;
    ev.type      = SDL_USEREVENT;
    ev.user.code = user_event_id;
    SDL_PushEvent (&ev);
}

void
send_user_event (USER_EVENT user_event_id, void* data1, void* data2) {
    SDL_Event ev;
    ev.type       = SDL_USEREVENT;
    ev.user.code  = user_event_id;
    ev.user.data1 = data1;
    ev.user.data2 = data2;
    SDL_PushEvent (&ev);
}

void
send_redraw_window (SDL_Window* window) {
    send_user_event (USER_EVENT.redraw);
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

struct
StartUserEvent {
    SDL_UserEvent _super = {
        SDL_USEREVENT, 
        /* timestamp */ 0, 
        /* WindowId  */ 0, 
        USER_EVENT.start
    };
    alias _super this;
}

struct
ClickUserEvent {
    SDL_UserEvent _super = {
        SDL_USEREVENT, 
        /* timestamp */ 0, 
        /* WindowId  */ 0, 
        USER_EVENT.click
    };
    alias _super this;

    this (SDL_Event* ev) {
        _super = ev.user;
    }

    this (SDL_UserEvent ev) {
        _super = ev;
    }

    this (Pos down_pos, Pos up_pos) {
        _super.type  = SDL_USEREVENT;
        _super.code  = USER_EVENT.click;
        _super.data1 = down_pos.toVoidPtr;
        _super.data2 = up_pos.toVoidPtr;
    }

    Pos
    down_pos () {
        return Pos.from_VoidPtr (_super.data1);
    }

    Pos
    up_pos () {
        return Pos.from_VoidPtr (_super.data2);
    }
}

//
class 
SDLException : Exception {
    this (string msg) {
        super (format!"%s: %s" (SDL_GetError().to!string, msg));
    }
}

class 
TTFException : Exception{
    this (string s) {
        super (
            format!"%s: %s"(s, fromStringz(TTF_GetError()))
        );
    }
}

class 
IMGException : Exception{
    this (string s) {
        super (
            format!"%s: %s"(s, fromStringz(IMG_GetError()))
        );
    }
}
