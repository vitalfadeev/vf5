import std.conv;
import std.format;
import std.stdio;
import bindbc.loader;
import bindbc.sdl;
import bindbc.sdl.image;
import doc;
import events;
import draw;
import etree;
import types;


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

    // Event Loop
    foreach (Event* ev; Events ())
        if (event (doc, ev, window, renderer) == 1)
            break;

    return 0;
}

void
draw_doc (SDL_Renderer* renderer, Doc* doc) {
    // clear
    SDL_SetRenderDrawColor (renderer, 0x00, 0x00, 0x00, 0xFF);
    SDL_RenderClear (renderer);
    // draw
    foreach (t; WalkTree (doc.tree))
        if (!t.e.hidden)
            draw_e (renderer, t.e);
    // rasterize
    SDL_RenderPresent (renderer);
}

int
event (Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer) {
    switch (ev.type) {
        case SDL_QUIT:
            return 1;
            break;
        case SDL_MOUSEBUTTONDOWN:
            // doc.tree.event (ev);
            if (ev.button.button == SDL_BUTTON_LEFT)
            if (ev.button.state == SDL_PRESSED) 
            if (ev.button.clicks == 1) {
                // tree_apply_klasses (doc.tree);
                auto clicked_e = doc.find_e_at_pos (Pos (ev.button.x.to!X, ev.button.y.to!Y));
                if (clicked_e !is null) {
                    writeln (ev.type, ": e: ", *clicked_e);
                    // on
                    foreach (_on; clicked_e.on) {
                        if (ev.type.to!string == _on.event) {
                            go_event_action (clicked_e, _on.action);
                        }
                    }

                    // focused
                    //add_class (doc, clicked_e, "hidden");
                    remove_class (doc, "focused");
                    add_class (doc, clicked_e, "focused");
                    import app : tree_apply_klasses;
                    tree_apply_klasses (doc.tree);
                    writeln (ev.type, ": e: ", *clicked_e);
                    doc.update_pos_size ();
                    //SDL_UpdateWindowSurface (window);
                    draw_doc (renderer,doc);
                }
            }
            break;
        case SDL_WINDOWEVENT:
            switch (ev.window.event) {
                case SDL_WINDOWEVENT_EXPOSED: draw_doc (renderer, doc); break; // event.window.windowID
                case SDL_WINDOWEVENT_SHOWN: break;        // event.window.windowID
                case SDL_WINDOWEVENT_HIDDEN: break;       // event.window.windowID
                case SDL_WINDOWEVENT_MOVED: break;        // event.window.windowID event.window.data1 event.window.data2 (x y)
                case SDL_WINDOWEVENT_RESIZED: break;      // event.window.windowID event.window.data1 event.window.data2 (width height)
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
            string us;
            switch (us) {
                case "player.play_pause": break;
                default:
            }
            break;
        default:
    }

    return 0;
}


//
void 
init_sdl () {
    // SDL
    version (Windows)
        SDLSupport ret = loadSDL ("sdl2.dll");
    else
        SDLSupport ret = loadSDL();
    writeln ("SDL: ", ret);

    if (ret != sdlSupport) {
        if (ret == SDLSupport.noLibrary) 
            throw new Exception ("The SDL shared library failed to load");
        else 
        if (ret == SDLSupport.badLibrary) 
            throw new Exception ("One or more symbols failed to load. The likely cause is that the shared library is for a lower version than bindbc-sdl was configured to load (via SDL_204, GLFW_2010 etc.)");
    }

    //if (SDL_Init (SDL_INIT_EVERYTHING) < 0)
    if (SDL_Init (SDL_INIT_VIDEO | SDL_INIT_EVENTS) < 0)
        throw new Exception ("The SDL init failed: " ~ SDL_GetError ().to!string);

    // IMG
    version (SDL_Image) {    
        auto sdlimage_ret = loadSDLImage ();
        writeln ("SDL_Image: ", sdlimage_ret);
        if (sdlimage_ret < sdlImageSupport) // 2.6.3
            throw new Exception ("The SDL_Image shared library failed to load");
        
        auto flags = IMG_INIT_PNG; // | IMG_INIT_JPG;
        if (IMG_Init (flags) != flags)
            throw new Exception ("The SDL_Image init failed");
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
new_window () {
    // Window
    SDL_Window* window = 
        SDL_CreateWindow (
            __FILE_FULL_PATH__, // "SDL2 Window",
            SDL_WINDOWPOS_CENTERED,
            SDL_WINDOWPOS_CENTERED,
            640, 480,
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


//
class 
SDLException : Exception {
    this (string msg) {
        super (format!"%s: %s" (SDL_GetError().to!string, msg));
    }
}
