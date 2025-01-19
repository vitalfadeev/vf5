version (freeimage):
/*
    // FreeImage
    FISupport fi_ret = loadFreeImage ();
    writeln ("FreeImage: ", fi_ret);
    if (fi_ret != fiSupport) {
        // Handle error. For most use cases, its reasonable to use the the error handling API in
        // bindbc-loader to retrieve error messages for logging and then abort. If necessary, it's
        // possible to determine the root cause via the return value:

        if (fi_ret == FISupport.noLibrary) {
            throw new Exception ("FreeImage shared library failed to load");
        }
        else if (FISupport.badLibrary) {
            // One or more symbols failed to load. The likely cause is that the
            // shared library is for a lower version than bindbc-freeimage was configured
            // to load.
            throw new Exception ("FreeImage: One or more symbols failed to load");
        }
    }    

    FreeImage_Initialise ();
    //FreeImage_SetOutputMessage (&FreeImageErrorHandler);
*/


/*
FIBITMAP *dib = GenericLoader (fname, 0);

if (dib) {
    SDL_Surface* surface = get_sdl_surface (dib, 0);
    e.content.image.ptr = surface;

    // free the loaded FIBITMAP
    //FreeImage_Unload (dib);
}
*/
// ----------------------------------------------------------

/** Generic image loader

  @param lpszPathName Pointer to the full file name
  @param flag Optional load flag constant
  @return Returns the loaded dib if successful, returns NULL otherwise
*/

/*
FIBITMAP* 
GenericLoader (const char* lpszPathName, int flag) {   
    FREE_IMAGE_FORMAT fif = FIF_UNKNOWN;
    // check the file signature and deduce its format
    // (the second argument is currently not used by FreeImage)
    
    fif = FreeImage_GetFileType (lpszPathName, 0);
    
    if(fif == FIF_UNKNOWN) {
        // no signature ?
        // try to guess the file format from the file extension
        fif = FreeImage_GetFIFFromFilename(lpszPathName);
    }
    
    // check that the plugin has reading capabilities ...
    if((fif != FIF_UNKNOWN) && FreeImage_FIFSupportsReading(fif)) {
        // ok, let's load the file
        FIBITMAP *dib = FreeImage_Load(fif, lpszPathName, flag);
        
        // unless a bad file format, we are done !
        return dib;
    }
    
    return null;
}

SDL_Surface *
get_sdl_surface (FIBITMAP *freeimage_bitmap, int is_grayscale) {
    // Loaded image is upside down, so flip it.
    FreeImage_FlipVertical (freeimage_bitmap);

    SDL_Surface *sdl_surface = SDL_CreateRGBSurfaceFrom (
        FreeImage_GetBits(freeimage_bitmap),
        FreeImage_GetWidth(freeimage_bitmap),
        FreeImage_GetHeight(freeimage_bitmap),
        FreeImage_GetBPP(freeimage_bitmap),
        FreeImage_GetPitch(freeimage_bitmap),
        FreeImage_GetRedMask(freeimage_bitmap),
        FreeImage_GetGreenMask(freeimage_bitmap),
        FreeImage_GetBlueMask(freeimage_bitmap),
        0 
    );

    if (sdl_surface == null) {
        //throw new Exception ("Failed to create surface: %s\n", SDL_GetError());
        throw new Exception ("Failed to create surface");
    }

    if (is_grayscale) {
        // To display a grayscale image we need to create a custom palette.
        SDL_Color[256] colors;
        int i;
        for (i = 0; i < 256; i++) {
            colors[i].r = colors[i].g = colors[i].b = cast(ubyte)i;
        }
        SDL_SetPaletteColors (sdl_surface.format.palette, colors.ptr, 0, colors.length);
    }

    return sdl_surface;
}
*/
