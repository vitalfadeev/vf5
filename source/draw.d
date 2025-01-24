module draw;

import std.stdio;
import std.string;
import bindbc.sdl;
import bindbc.sdl.image;
import e;
import types;
import pix : SDLException, TTFException, global_font;


void
line (Pos pos, Pos pos2, W wid) {
    //
}

void
arc (Pos pos, Pos pos2, W wid) {
    //
}

void
fill_rect (SDL_Renderer* renderer, X x, Y y, W w, H h) {
    SDL_Rect rect;
    rect.x = x;
    rect.y = y;
    rect.w = w;
    rect.h = h;
    SDL_RenderFillRect (renderer, &rect);
}

void
image (SDL_Renderer* renderer, void* ptr, X x, Y y, W w, H h) {
    SDL_Surface* surface = cast (SDL_Surface*) ptr;
    SDL_Texture* texture = SDL_CreateTextureFromSurface (renderer, surface);

    //
    SDL_Rect dstrect = SDL_Rect (x, y, w, h);
    SDL_RenderCopy (renderer, texture, null, &dstrect);
    //SDL_RenderCopy (renderer, texture, null, null);

    //
    SDL_DestroyTexture (texture);
}


void
text (SDL_Renderer* renderer, string s, TTF_Font *font, X x, Y y, W w, H h) {
    int outw, outh;
    X _x = x;
    foreach (dchar c; s) {
        one_char (renderer, c, font, _x, y, w, h, &outw, &outh);
        _x += outw;
    }
}

void
one_char (SDL_Renderer* renderer, dchar c, TTF_Font *font, X x, Y y, W w, H h, int* outw, int* outh) {
    auto image = _one_char (renderer, c, x, y, font);

    //
    int SCREEN_WIDTH  = 640;
    int SCREEN_HEIGHT = 480;

    int iW, iH;
    SDL_QueryTexture (image, null, null, &iW, &iH);
    *outw = iW;
    *outh = iH;
    int cx = SCREEN_WIDTH / 2 - iW / 2;
    int cy = SCREEN_HEIGHT / 2 - iH / 2;

    //
    renderTexture (renderer, image, x, y);
}

SDL_Texture*
_one_char (SDL_Renderer* renderer, dchar c, X x, Y y, TTF_Font *font) {
    // e.text.s = s
    // each c; s
    //   e.rects = Rect (c)
    // one_char (e.rects[0].s)

    SDL_Color color = SDL_Color (0xFF,0xFF,0xFF,0xFF);
    SDL_Surface* surf = TTF_RenderGlyph32_Blended (font, c, color);
    if (surf is null)
        throw new TTFException ("TTF_RenderText");

    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surf);
    if (texture is null)
        throw new SDLException ("CreateTexture");

    SDL_FreeSurface (surf);

    return texture;
}

void
text_string (SDL_Renderer* renderer, string s, TTF_Font *font, X x, Y y, W w, H h) {
    auto image = _text_string (renderer, s, x, y, font);

    //
    int SCREEN_WIDTH  = 640;
    int SCREEN_HEIGHT = 480;

    int iW, iH;
    SDL_QueryTexture (image, null, null, &iW, &iH);
    int cx = SCREEN_WIDTH / 2 - iW / 2;
    int cy = SCREEN_HEIGHT / 2 - iH / 2;

    //
    renderTexture (renderer, image, x, y);
}

SDL_Texture*
_text_string (SDL_Renderer* renderer, string s, X x, Y y, TTF_Font *font) {
    // e.text.s = s
    // each c; s
    //   e.rects = Rect (c)
    // one_char (e.rects[0].s)

    SDL_Color color = SDL_Color (0xFF,0xFF,0xFF,0xFF);
    SDL_Surface* surf = TTF_RenderUTF8_Blended (font, s.toStringz, color);
    if (surf is null)
        throw new TTFException ("TTF_RenderText");

    SDL_Texture* texture = SDL_CreateTextureFromSurface(renderer, surf);
    if (texture is null)
        throw new SDLException ("CreateTexture");

    SDL_FreeSurface (surf);

    return texture;
}

void 
renderTexture (SDL_Renderer* renderer, SDL_Texture* tex, SDL_Rect dst, SDL_Rect* clip = null) {
    SDL_RenderCopy (renderer, tex, clip, &dst);
}
void 
renderTexture (SDL_Renderer* renderer, SDL_Texture* tex, int x, int y, SDL_Rect* clip = null) {
    SDL_Rect dst;
    dst.x = x;
    dst.y = y;
    if (clip !is null) {
        dst.w = clip.w;
        dst.h = clip.h;
    }
    else {
        SDL_QueryTexture (tex, null, null, &dst.w, &dst.h);
    }
    renderTexture (renderer, tex, dst, clip);
}

Pos
content_pos (E* e) {
    return Pos (
        cast(X)(e.pos.x+e.borders.l.w), 
        cast(Y)(e.pos.y+e.borders.t.w), 
    );
}

Size
content_size (E* e) {
    return Size (
        cast(W)(e.size.w - e.borders.l.w - e.borders.r.w), 
        cast(H)(e.size.h - e.borders.t.w - e.borders.b.w)
    );
}

TTF_Font*
open_font (string file_name, int font_size) {
    TTF_Font* font = TTF_OpenFont (file_name.toStringz, font_size);
    if (font !is null)
        return font;

    throw new TTFException ("TTF_OpenFont");
}

void
draw_e (SDL_Renderer* renderer, E* e) {
    draw_borders (renderer, e);
    draw_content (renderer, e);
/*
    // pad
    if (e.pad.t)
        fill_rect (e.pos, e.size); // 0 t
    if (e.pad.t)
    if (e.pad.r)
        fill_rect (e.pos, e.size); // 1 tr
    if (e.pad.r)
        fill_rect (e.pos, e.size); // 2 r
    if (e.pad.r)
    if (e.pad.b)
        fill_rect (e.pos, e.size); // 3 rb
    if (e.pad.b)
        fill_rect (e.pos, e.size); // 4 b
    if (e.pad.b)
    if (e.pad.l)
        fill_rect (e.pos, e.size); // 5 bl
    if (e.pad.l)
        fill_rect (e.pos, e.size); // 6 l
    if (e.pad.l)
    if (e.pad.t)
        fill_rect (e.pos, e.size); // 7 lt
    // center bg
    if (e.bg.color.a)
        fill_rect (e.pos, e.size); // center
    // image
    if (e.image.src.length != 0)
        image (e.image.ptr);
*/
    // border
/*
    auto p1 = Pos (cast(X)(e.pos.x + e.border.tl.w), e.pos.y);
    auto p2 = Pos (cast(X)(e.pos.x + e.size.w - e.border.tr.w), e.pos.y);
    if (e.border.t_type != e.Border.Type.none)
        line (p1, p2, 1); // 0 t
    auto p3 = Pos (cast(X)(e.pos.x + e.size.w), cast(Y)(e.pos.y + e.border.tr.h));
    if (e.border.tr.w != 0 && e.border.tr.h != 0) {
        line (p2, p3, 1); // 1
        arc  (p2, p3, 1); // 1
    }
    auto p4 = Pos (cast(X)(e.pos.x + e.size.w), cast(Y)(e.pos.y + e.size.h - e.border.br.h));
    if (e.border.r_type != e.Border.Type.none)
        line (p3, p4, 1); // 2 r
    auto p5 = Pos (cast(X)(e.pos.x + e.size.w - e.border.br.w), cast(Y)(e.pos.y + e.size.h));
    if (e.border.br.w != 0 && e.border.br.h != 0) {
        line (p4, p5, 1); // 3
        arc  (p4, p5, 1); // 3
    }
    auto p6 = Pos (cast(X)(e.pos.x + e.border.bl.w), cast(Y)(e.pos.y + e.size.h));
    if (e.border.b_type != e.Border.Type.none)
        line (p5, p6, 1); // 4 b
    auto p7 = Pos (e.pos.x, cast(Y)(e.pos.y + e.size.h - e.border.bl.h));
    if (e.border.bl.w != 0 && e.border.bl.h != 0) {
        line (p6, p7, 1); // 5
        arc  (p6, p7, 1); // 5
    }
    auto p8 = Pos (e.pos.x, cast(Y)(e.pos.y + e.border.tl.h));
    if (e.border.l_type != e.Border.Type.none)
        line (p7, p8, 1); // 6 l

    if (e.border.tl.w != 0 && e.border.tl.h != 0) {
        line (p8, p1, 1); // 7
        arc  (p8, p1, 1); // 7
    }
    */
}

void
draw () {
    //
}


void
draw8 (SDL_Renderer* renderer, X x, Y y, W w, H h, W t, W r, W b, W l) {
    // 1 2 3
    // 8   4
    // 7 6 5
    fill_rect (renderer, cast(X)(x),     cast(Y)(y),     cast(X)(l),     cast(Y)(t)); // 1
    fill_rect (renderer, cast(X)(x+l),   cast(Y)(y),     cast(X)(w-l-r), cast(Y)(t)); // 2
    fill_rect (renderer, cast(X)(x+w-r), cast(Y)(y),     cast(X)(r),     cast(Y)(t)); // 3
    fill_rect (renderer, cast(X)(x+w-r), cast(Y)(y+t),   cast(X)(r),     cast(Y)(h-t-b)); // 4
    fill_rect (renderer, cast(X)(x+w-r), cast(Y)(y+h-b), cast(X)(r),     cast(Y)(b)); // 5
    fill_rect (renderer, cast(X)(x+l),   cast(Y)(y+h-b), cast(X)(w-l-r), cast(Y)(b)); // 6
    fill_rect (renderer, cast(X)(x),     cast(Y)(y+h-b), cast(X)(l),     cast(Y)(b)); // 7
    fill_rect (renderer, cast(X)(x),     cast(Y)(y+t),   cast(X)(l),     cast(Y)(h-t-b)); // 8
}

void
draw_borders (SDL_Renderer* renderer, E* e) {
    SDL_SetRenderDrawColor (
        renderer, 
        e.borders.t.color.r,
        e.borders.t.color.g,
        e.borders.t.color.b,
        e.borders.t.color.a,
    );
    draw8 (
        renderer, 
        e.pos.x, 
        e.pos.y, 
        e.size.w, 
        e.size.h, 
        e.borders.t.w,
        e.borders.r.w,
        e.borders.b.w,
        e.borders.l.w
    );
}

void
draw_content (SDL_Renderer* renderer, E* e) {
    SDL_SetRenderDrawColor (renderer, 0x88, 0x88, 0x88, 0xFF);
    auto cp = content_pos (e);
    auto cs = content_size (e);
    fill_rect (renderer, cp.x, cp.y, cs.w, cs.h);

    if (e.content.image.ptr !is null)
        image (renderer, e.content.image.ptr, cp.x, cp.y, cs.w, cs.h);

    if (e.content.text.s.length)
        text (renderer, e.content.text.s, global_font, cp.x, cp.y, cs.w, cs.h);
}

// size = border + pad + image

// x,y        t.h
//         |       |
//     1   |   2   |   3        border
//         |       |      
//    -----+-------+------              
//         |       |               
// l.w 8   |       |   4  r.w   image  
//         |       |    
//    -----+-------+------              
//         |       |    
//     7   |   6   |   5 
//         |       |       
//            b.h           w,h

// SDL_SetRenderDrawColor (renderer, 0x00, 0x00, 0x00, 0xFF);
// SDL_RenderClear (renderer);
// SDL_SetRenderDrawColor (renderer, 0xFF, 0xFF, 0xFF, 0xFF);
// SDL_RenderDrawPoint (renderer, x, y);
// SDL_RenderDrawLine (renderer,0,0,100,100);
// SDL_RenderFillRect (renderer,&rect);
// SDL_RenderDrawRect (renderer,&rect);
// ...

