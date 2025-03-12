import std.conv;
import std.format;
import std.stdio;
import bindbc.sdl;
import bindbc.sdl.image;
import bindbc.sdl.ttf;
import bindbc.sdlgfx;
import doc;
import etree;
import klass;
import events;
import draws;
import types;
import std.string : fromStringz; 
import std.string : toStringz;
import std.algorithm.searching : canFind;
import e : E;

alias PIX_EVENT_FN  = int  function (Pix* pix, Event* ev);
alias PIX_UPDATE_FN = void function (Pix* pix, E* e);
alias PIX_DRAW_FN   = void function (Pix* pix, SDL_Renderer* renderer, E* e);
alias PIX_GO_FN     = int  function (Pix* pix, E* e);

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


int 
go (Pix* pix, E* e) {
    // Window, Surface
    SDL_Window* window = new_window (__FILE_FULL_PATH__);

    // Renderer
    SDL_Renderer* renderer = new_renderer (window);

    //
    e.window = new Window (window);

    // Event "start"
    send_user_event!StartUserEvent ();

    // Event Loop
    foreach (Event* ev; Events ()) {
        ev.e          = e;
        ev.app_window = window;
        ev.renderer   = renderer;

        if (pix.event (pix,ev) == 1)
            break;
    }

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
            send_user_event!ClickUserEvent (down_pos, up_pos);
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

void
_redraw (Pix* pix, SDL_Renderer* renderer, E* e, RedrawUserEvent* ev) {
    pix.draw (pix,renderer,ev.e);
}

int
event (Pix* pix, Event* ev) {
    //if (ev.type != SDL_MOUSEMOTION)
    //    writeln ("PIX.EVENT: ", ev.type);
    translate (ev);

    switch (ev.type) {
        case SDL_WINDOWEVENT:
            switch (ev.window.event) {
                case SDL_WINDOWEVENT_EXPOSED: pix.draw (pix,ev.renderer,ev.e); break; // event.window.windowID
                case SDL_WINDOWEVENT_SHOWN: break;        // event.window.windowID
                case SDL_WINDOWEVENT_HIDDEN: break;       // event.window.windowID
                case SDL_WINDOWEVENT_MOVED: break;        // event.window.windowID event.window.data1 event.window.data2 (x y)
                case SDL_WINDOWEVENT_RESIZED: pix.update (pix,ev.e); break; // event.window.windowID event.window.data1 event.window.data2 (width height)
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
                case USER_EVENT.redraw : _redraw (pix,ev.renderer,ev.e,cast (RedrawUserEvent*) ev); break;
                default: ev.e.event (ev.e,ev);
            }
            break;
        case SDL_QUIT: ev.e.event (ev.e,ev); return 1;
        default: ev.e.event (ev.e,ev);
    }

    return 0;
}

void
update (Pix* pix, E* root) {
    root.update (root); 
}

void
draw (Pix* pix, SDL_Renderer* renderer, E* e) {
    // Clip to e
    if (e !is null) {
        SDL_Rect clip_rect;
        clip_rect.x = e.pos.x;
        clip_rect.y = e.pos.y;
        clip_rect.w = e.size.w;
        clip_rect.h = e.size.h;
        writeln (clip_rect);
        SDL_RenderSetClipRect (renderer,&clip_rect);
    }

    // clear
    if (e is null) {
        SDL_SetRenderDrawColor (renderer, 0x00, 0x00, 0x00, 0xFF);
        SDL_RenderClear (renderer);
    }

    // draw
    e.draw (e,renderer);
    // rasterize
    SDL_RenderPresent (renderer);

    // clear clip
    if (e !is null) {
        SDL_RenderSetClipRect (renderer,null);
    }
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
    auto sdl_image_ret = loadSDLImage ();
    writeln ("SDL_Image: ", sdl_image_ret);
    if (sdl_image_ret < sdlImageSupport) // 2.6.3
        throw new Exception ("The SDL_Image shared library failed to load");
    
    auto flags = IMG_INIT_PNG; // | IMG_INIT_JPG;
    if (IMG_Init (flags) != flags)
        throw new IMGException ("The SDL_Image init failed");

    // TTF
    auto sdl_ttf_ret = loadSDLTTF (); // SDLTTFSupport
    writeln ("SDL_TTF: ", sdl_ttf_ret);
    if (sdl_ttf_ret < sdlTTFSupport) // 2.0.20
        throw new TTFException ("The SDL_TTF shared library failed to load:");
    
    if (TTF_Init () == -1)
        throw new TTFException ("Failed to initialise SDL_TTF");

    // GFX
    // libSDL2_gfx.so
    auto sdl_gfx_ret = loadSDLgfx (); // SDLgfxSupport
    writeln ("SDL_GFX: ", sdl_gfx_ret);
    if (sdl_gfx_ret != SDLgfxSupport.SDLgfx) {
        if (sdl_gfx_ret == SDLgfxSupport.noLibrary) 
            throw new Exception ("The SDL GFX shared library failed to load");
        else 
        if (sdl_gfx_ret == SDLgfxSupport.badLibrary) 
            throw new Exception ("SDL GFX: One or more symbols failed to load.");
    }
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
send_user_event (EVT,ARGS...) (ARGS args) {
    auto evt = EVT (args);
    SDL_PushEvent (cast(SDL_Event*)&evt);
}


void
redraw_window (SDL_Window* window) {
    send_user_event!RedrawUserEvent ();
}

void
redraw (E* e) {
    send_user_event!RedrawUserEvent (e);
}

struct
Events {
    bool _go = true;
    Event ev;

    int
    opApply (int delegate (Event* ev) dg) {
        while (_go) {
            while (SDL_WaitEvent (&ev.sdl) > 0) {
                int result = dg (&ev);
                if (result)
                    return result;
            }
        }        

        return 0;
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
