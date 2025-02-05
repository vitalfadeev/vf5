import std.conv;
import std.format;
import std.stdio;
//import bindbc.loader;
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


struct 
pix {
    //
}

// Init
void
pix_init () {
    init_sdl ();
}



int 
pix_go (Doc* doc) {
    // Window, Surface
    SDL_Window* window = new_window ();

    // Renderer
    SDL_Renderer* renderer = new_renderer (window);

    //
    doc.window = new Window (window);

    // Event Loop
    foreach (Event* ev; Events ())
        if (event (ev,window,renderer,doc) == 1)
            break;

    return 0;
}

// foreach (ev; Events)
//   vf.event (ev)
//   tree
//     e
//      foreach (kls; klasses)  // widget
//        kls.event (ev)

int
event (Event* ev, SDL_Window* window, SDL_Renderer* renderer, Doc* doc) {
    auto result = doc.event (doc,ev,window,renderer);
    if (result)
        return result;

    switch (ev.type) {
        case SDL_WINDOWEVENT:
            switch (ev.window.event) {
                case SDL_WINDOWEVENT_EXPOSED: draw (renderer,doc); break; // event.window.windowID
                case SDL_WINDOWEVENT_SHOWN: break;        // event.window.windowID
                case SDL_WINDOWEVENT_HIDDEN: break;       // event.window.windowID
                case SDL_WINDOWEVENT_MOVED: break;        // event.window.windowID event.window.data1 event.window.data2 (x y)
                case SDL_WINDOWEVENT_RESIZED: update (doc); break; // event.window.windowID event.window.data1 event.window.data2 (width height)
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
        case SDL_QUIT: return 1;
        default:
    }

    return 0;
}

void
update (Doc* doc) {
    doc.update (doc); 
}

void
draw (SDL_Renderer* renderer, Doc* doc) {
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
    //version (SDL_Image) {    
        auto sdlimage_ret = loadSDLImage ();
        writeln ("SDL_Image: ", sdlimage_ret);
        if (sdlimage_ret < sdlImageSupport) // 2.6.3
            throw new Exception ("The SDL_Image shared library failed to load");
        
        auto flags = IMG_INIT_PNG; // | IMG_INIT_JPG;
        if (IMG_Init (flags) != flags)
            throw new Exception ("The SDL_Image init failed");
    //}

    // TTF
    //version (SDL_TTF) {
        auto sdlttf_ret = loadSDLTTF (); // SDLTTFSupport
        writeln ("SDL_TTF: ", sdlttf_ret);
        if (sdlttf_ret < sdlTTFSupport) // 2.0.20
            throw new TTFException ("The SDL_TTF shared library failed to load:");
        
        if (TTF_Init () == -1)
            throw new TTFException ("Failed to initialise SDL_TTF");
    //}
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
new_window () {
    // Window
    SDL_Window* window = 
        SDL_CreateWindow (
            __FILE_FULL_PATH__, // "SDL2 Window",
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
