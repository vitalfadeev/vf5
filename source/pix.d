module pix;

import std.conv;
import std.format;
import std.stdio;
import std.string : fromStringz; 
import std.string : toStringz;
import std.algorithm.searching : canFind;
import bindbc.sdl;
import bindbc.sdlgfx;
import etree;
import e : E;
import e_update;
import klass;
import events;
import types;

alias IMAGE_PTR = SDL_Surface*;
alias FONT_PTR  = TTF_Font*;
alias TEXT_PTR  = SDL_Texture*;

struct 
Pix {
    E* focused;

    this (string[] args) {
        this._init ();
    }

    void
    _init () {
        init_sdl ();
    }

    void
    go (Events* events, E* root, Klasses* klasses) {
        go (&this,events,root,klasses);
    }
}


void
go (Pix* pix, Events* events, E* root, Klasses* klasses) {
    // Window, Renderer, Custom Window
    auto sdl_window = new_sdl_window (__FILE_FULL_PATH__);
    auto renderer   = new_sdl_renderer (sdl_window);
    auto window     = Window (sdl_window);

    // Save root,klasses,window,renderer into event
    events.init_base_event (root,klasses,window,renderer);

    // update, start
    events ~= update_UserEvent ();
    events ~= start_UserEvent ();

    // Event Loop
    writefln ("\n======== PIX start event loop ========");
    foreach (Event* ev; events)
        event (pix,ev);
    writefln ("\n======== PIX   end event loop ========");
}


void
translate (Event* ev) {
    click_translate (ev);
}

void
click_translate (Event* ev) {
    static Loc down_pos;

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN:
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) {
                // save loc down
                down_pos = Loc (ev.button.x, ev.button.y);
            }
            break;
        case SDL_MOUSEBUTTONUP:
            // load loc down
            // get  loc up
            // send click (down_pos, up_pos)
            Loc up_pos = Loc (ev.button.x, ev.button.y);
            Events () ~= click_UserEvent (down_pos, up_pos);
            down_pos = Loc ();
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
event (Pix* pix, Event* ev) {
    if (ev.type != SDL_MOUSEMOTION) 
        writefln ("\nPIX.event: %s", *ev);

    translate (ev);

    switch (ev.type) {
        case SDL_WINDOWEVENT:
            switch (ev.window.event) {
                case SDL_WINDOWEVENT_EXPOSED      : draw (ev); break; // event.window.windowID
                case SDL_WINDOWEVENT_SHOWN        : break;  // event.window.windowID
                case SDL_WINDOWEVENT_HIDDEN       : break;  // event.window.windowID
                case SDL_WINDOWEVENT_MOVED        : break;  // event.window.windowID event.window.data1 event.window.data2 (x y)
                case SDL_WINDOWEVENT_RESIZED      : update_draw (ev); break; // event.window.windowID event.window.data1 event.window.data2 (width height)
                case SDL_WINDOWEVENT_SIZE_CHANGED : break;  // event.window.windowID event.window.data1 event.window.data2 (width height)
                case SDL_WINDOWEVENT_MINIMIZED    : break;  // event.window.windowID
                case SDL_WINDOWEVENT_MAXIMIZED    : break;  // event.window.windowID
                case SDL_WINDOWEVENT_RESTORED     : break;  // event.window.windowID
                case SDL_WINDOWEVENT_ENTER        : break;  // event.window.windowID
                case SDL_WINDOWEVENT_LEAVE        : break;  // event.window.windowID
                case SDL_WINDOWEVENT_FOCUS_GAINED : break;  // event.window.windowID
                case SDL_WINDOWEVENT_FOCUS_LOST   : break;  // event.window.windowID
                case SDL_WINDOWEVENT_CLOSE        : break;  // event.window.windowID
                //case SDL_WINDOWEVENT_TAKE_FOCUS : break;  // event.window.windowID
                //case SDL_WINDOWEVENT_HIT_TEST   : break;  // event.window.windowID
                default                           : SDL_Log ("Window %d got unknown event %d",ev.window.windowID, ev.window.event);
            }
            break;
        case SDL_MOUSEBUTTONDOWN : 
        case SDL_MOUSEBUTTONUP   :  {
            focus (pix,ev);
            send_to_focused (pix,ev); 
            break;
        }
        case SDL_MOUSEWHEEL      : {
            focus (pix,ev);
            send_to_focused (pix,ev); 
            break;
        }
        case SDL_KEYDOWN         : 
        case SDL_KEYUP           : {
            send_to_focused (pix,ev); 
            break;
        }
        case SDL_USEREVENT       :
            switch (ev.user.code) {
                case USER_EVENT.update : update      (ev,&ev._user.update); break;
                case USER_EVENT.draw   : update_draw (ev,&ev._user.draw); break;
                case USER_EVENT.redraw : update_draw (ev,&ev._user.redraw); break;
                case USER_EVENT.click  : 
                    focus (pix,ev);
                    send_to_focused (pix,ev); 
                    break;
                default                : //root.event  (ev);
            }
            break;
        case SDL_QUIT: break;
        default: 
    }
}

void
update (Event* ev) {
    update_UserEvent update_ev;
    update (ev,&update_ev); 
}
void
update (Event* ev, update_UserEvent* update_ev) {
    update_ev.root   = ev.root; 
    update_ev.window = ev.window; 
    update (update_ev); 
}
void
update (update_UserEvent* ev) {
    update (ev.root,ev); 
    e_update_length_loc (ev.root,null,ev);
}

void
update_draw (Event* ev) {
    update (ev);
    draw_UserEvent draw_ev;
    update_draw (ev,&draw_ev);
} 
void
update_draw (Event* ev,draw_UserEvent* draw_ev) {
    update (ev);
    draw_ev.root     = ev.root;
    draw_ev.window   = ev.window;
    draw_ev.renderer = ev.renderer;
    draw (draw_ev);
} 
void
update_draw (Event* ev,redraw_UserEvent* draw_ev) {
    update (ev);
    draw_ev.root     = ev.root;
    draw_ev.window   = ev.window;
    draw_ev.renderer = ev.renderer;
    draw (draw_ev);
} 

//void
//draw (Pix* pix, Event* ev) {
//    draw_UserEvent draw_ev;
//    draw_ev.root     = ev.root;
//    draw_ev.window   = ev.window;
//    draw_ev.renderer = ev.renderer;
//    draw (pix,&draw_ev);
//}
void
draw (draw_UserEvent* ev) {
    auto renderer = ev.renderer;
    auto root     = ev.root;
    auto e        = ev.root;

    if (ev.code == USER_EVENT.redraw)
        e = ev.e;

    // Clip to e
    if (e !is null) {
        SDL_Rect clip_rect;
        clip_rect.x = e.pos.x;
        clip_rect.y = e.pos.y;
        clip_rect.w = e.size.w;
        clip_rect.h = e.size.h;
        SDL_RenderSetClipRect (renderer,&clip_rect);
    }

    // clear
    if (e is null) {
        SDL_SetRenderDrawColor (renderer, 0x00, 0x00, 0x00, 0xFF);
        SDL_RenderClear (renderer);
    }

    // setup offsets for relative rendering
    ev.offset.reserve (7);
    ev.offset ~= Loc (0,0);

    // draw
    //   recursive in e
    if (e !is null)
        draw (e,ev);

    // rasterize
    SDL_RenderPresent (renderer);

    // clear clip
    if (e !is null) {
        SDL_RenderSetClipRect (renderer,null);
    }
}

Loc
target_pos (click_UserEvent* ev) {
    return ev.up_loc;
}
Loc
target_pos (SDL_MouseWheelEvent* ev) {
    return Loc (ev.mouseX, ev.mouseY);
}
Loc
target_pos (SDL_MouseButtonEvent* ev) {
    return Loc (ev.x, ev.y);
}

void
focus (Pix* pix, Event* ev) {
    switch (ev.type) {
        case SDL_WINDOWEVENT: 
            break;
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.click : 
                    auto deepest = find_deepest (ev.root, target_pos (&ev._user.click));
                    pix.set_focus (deepest);
                    break;
                default: 
            }
            break;
        case SDL_MOUSEBUTTONDOWN : 
        case SDL_MOUSEBUTTONUP   : {
            auto deepest = find_deepest (ev.root, target_pos (&ev.button));
            pix.set_focus (deepest);
            break;
        }
        case SDL_MOUSEWHEEL      : {
            auto deepest = find_deepest (ev.root, target_pos (&ev.wheel));
            pix.set_focus (deepest);
            break;
        }
        case SDL_KEYDOWN         : break;
        case SDL_KEYUP           : break;
        default: 
    }
}

void
set_focus (Pix* pix, E* e) {
    pix.focused = e;
}

void
send_to_focused (Pix* pix, Event* ev) {
    if (pix.focused !is null)
        pix.focused.event (ev);
}

E*
find_deepest (E* root, Loc loc) {
    E* deepest;

    bool 
    valid_e (E* e) {
        return pos_in_rect (pos, e.pos, e.size);
    }

    // klass event
    foreach (_e; WalkInDeep (root,&valid_e))
        deepest = _e;

    return deepest;
}

//
void 
init_sdl () {
    // SDL
    version (Windows)
        SDLSupport _sdl_support = loadSDL ("sdl2.dll");
    else
        SDLSupport _sdl_support = loadSDL ();

    if (_sdl_support != sdlSupport) {
        if (_sdl_support == SDLSupport.noLibrary) 
            throw new Exception ("The SDL shared library failed to load");
        else 
        if (_sdl_support == SDLSupport.badLibrary) 
            throw new Exception ("One or more symbols failed to load. The likely cause is that the shared library is for a lower version than bindbc-sdl was configured to load (via SDL_204, GLFW_2010 etc.)");
    }

    //if (SDL_Init (SDL_INIT_EVERYTHING) < 0)
    if (SDL_Init (SDL_INIT_VIDEO | SDL_INIT_EVENTS) < 0)
        throw new SDLException ("The SDL init failed");

    SDL_version sdl_ver;
    SDL_GetVersion (&sdl_ver);

    // IMG
    if (bindSDLImage) {
        auto _sdl_image_support = loadSDLImage ();
        if (_sdl_image_support < sdlImageSupport) // 2.6.3
            throw new Exception ("The SDL_Image shared library failed to load");
        
        auto flags = IMG_INIT_PNG; // | IMG_INIT_JPG;
        if (IMG_Init (flags) != flags)
            throw new IMGException ("The SDL_Image init failed");
    }

    // TTF
    if (bindSDLTTF) {
        auto _sdl_ttf_support = loadSDLTTF (); // SDLTTFSupport
        if (_sdl_ttf_support < sdlTTFSupport) // 2.0.20
            throw new TTFException ("The SDL_TTF shared library failed to load:");
        
        if (TTF_Init () == -1)
            throw new TTFException ("Failed to initialise SDL_TTF");
    }

    // GFX
    // libSDL2_gfx.so
    auto _sdl_gfx_support = loadSDLgfx (); // SDLgfxSupport
    if (_sdl_gfx_support != SDLgfxSupport.SDLgfx) {
        if (_sdl_gfx_support == SDLgfxSupport.noLibrary) 
            throw new Exception ("The SDL GFX shared library failed to load");
        else 
        if (_sdl_gfx_support == SDLgfxSupport.badLibrary) 
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
new_sdl_window (string window_title) {
    // Window
    auto window = 
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
new_sdl_renderer (SDL_Window* window) {
    return SDL_CreateRenderer (window, -1, SDL_RENDERER_SOFTWARE);
}


TTF_Font*
open_font (string file_name, int font_size) {
    //TTF_Font* font = TTF_OpenFont (file_name.toStringz, font_size);
    auto font = TTF_OpenFontDPI (file_name.toStringz, font_size, 102, 102);
    if (font !is null)
        return font;

    throw new TTFException ("TTF_OpenFont");
}


//void
//send_user_event (EVT,ARGS...) (ARGS args) {
//    Event ev;
//    ev._user = UserEvent (EVT (args));
//    SDL_PushEvent (&ev.sdl);
//}

//void
//force_send_user_event (EVT,ARGS...) (E* e, ARGS args) {
//    Event ev;
//    ev._user = UserEvent (EVT (args));
//    e.event (&ev);
//}

//void
//direct_user_event (EVT,ARGS...) (Pix* pix, Event* ev, E* root, ARGS args) {
//    Event direct_ev = *ev;
//    direct_ev._user = UserEvent (EVT (args));
//    pix.event (&direct_ev,root); 
//}


void
send_event_in_deep (Event* ev, E* e, Loc loc) {
    bool 
    valid_e (E* e) {
        return (
            pos_in_rect (pos, e.pos, e.size)
        );
    }

    // klass event
    foreach (_e; etree.WalkInDeep (e,&valid_e)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
    }
}

void
send_mouse_event_in_deep (Event* ev, E* e, Loc loc, ref E* deepest) {
    bool 
    valid_e (E* e) {
        return (
            pos_in_rect (pos, e.pos, e.size)
        );
    }

    // klass event
    foreach (_e; WalkInDeep (e,&valid_e)) {
        //writeln (*_t);
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
        deepest = _e;
    }
}

void
redraw_window (SDL_Window* window) {
    Events () ~= redraw_UserEvent ();
}

void
send_e_redraw (E* e) {
    Events () ~= redraw_UserEvent (e);
}

struct
Events {
    bool _go = true;
    Event ev;

    this (string[] args) {
        //
    }

    int
    opApply (int delegate (Event* ev) dg) {
        while (_go) {
            while (SDL_WaitEvent (&ev.sdl) > 0) {
                if (auto result = dg (&ev))
                    return result;
                if (ev.type == SDL_QUIT)
                    return 0;
            }
        }        

        return 0;
    }

    void
    push_user_event (EVT,ARGS...) (ARGS args) {
        Event ev;
        ev._user = UserEvent (EVT (args));
        SDL_PushEvent (&ev.sdl);
    }

    void
    opOpAssign (string op : "~", EVT) (EVT ev) {
        SDL_PushEvent (cast (SDL_Event*) &ev);
    }

    void
    init_base_event (E* root, Klasses* klasses, Window* window, SDL_Renderer* renderer) {
        with (ev) {
            root     = root;
            klasses  = klasses;
            window   = window;
            renderer = renderer;
        }        
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
