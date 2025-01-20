// App
//   Windows 
//   Renderers
//   Events
//   
//   Doc
//     tree
//     classes

version (app):
struct
App {
    import bindbc.sdl;

    SDL_Window*   window;
    SDL_Renderer* renderer;
    Doc*          doc;
    Events        events;

    void
    setup () {
        doc = new Doc ();
        doc.tree = new ETree ();
        txt_reader.go (doc, txt_reader.text);
        tree_apply_klasses (doc.tree);

        window   = new_window ();
        renderer = new_renderer (window);
    }

    void
    go () {
        // Event Loop
        foreach (Event* ev; events)
            if (event (ev, window, renderer) == 1)
                break;
    }

    int
    event (Event* ev, Window* window, Renderer* renderer) {
        switch (ev.type) {
            case SDL_QUIT:
                return 1;
                break;
            case SDL_MOUSEBUTTONDOWN:
                break;
            default:
        }

        return 0;
    }
}
