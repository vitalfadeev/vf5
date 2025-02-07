module draws;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import bindbc.sdl.image;
import e;
import types;
import doc : max;
import pix : SDLException, TTFException;


void
line (Pos pos, Pos pos2, W wid) {
    //
}

void
arc (Pos pos, Pos pos2, W wid) {
    //
}

void
fill_rect (SDL_Renderer* renderer, int x, int y, int w, int h) {
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
_text (SDL_Renderer* renderer, E.Content.Text.TextRect[] rects, TTF_Font* font, Color color, X x, Y y, W w, H h) {
    // clip w h
    // from text.rects
    foreach (ref rec; rects)
        if (rec.s.length) {
            auto char_x = rec.pos.x + x;
            auto char_y = rec.pos.y + y;
            one_string (renderer, rec.s, font, color, char_x, char_y, rec.size.w, rec.size.h);
        }
}

Size
get_text_size (string s, TTF_Font* font, Color color) {
    int w, h;
    auto ret = TTF_SizeUTF8 (font, s.toStringz, &w, &h);
    
    return Size (w.to!W,h.to!W);
}


void
one_string (SDL_Renderer* renderer, string s, TTF_Font* font, Color color, int x, int y, int w, int h) {
    color = Color (0xFF, 0xFF, 0xFF, 0xFF);
    auto image = _one_string (renderer, s, font, color);
    render_texture (renderer, image, x, y, w, h);
}

SDL_Texture*
_one_string (SDL_Renderer* renderer, string s, TTF_Font* font, Color color) {
    // e.text.s = s
    // each c; s
    //   e.rects = Rect (c)
    // one_char (e.rects[0].s)

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
render_texture (SDL_Renderer* renderer, SDL_Texture* tex, SDL_Rect dst) {
    SDL_RenderCopy (renderer, tex, null, &dst);
}
void 
render_texture (SDL_Renderer* renderer, SDL_Texture* tex, int x, int y, int w, int h) {
    SDL_Rect dst;
    dst.x = x;
    dst.y = y;
    dst.w = w;
    dst.h = h;
    render_texture (renderer, tex, dst);
}

// e.pos  = border + pad + content
// e.size = border + pad + content
Pos
e_pos (E* e) {
    return e.pos;
}

Pos
borders_pos (E* e) {
    return e.pos;
}

Size
borders_size (E* e) {
    return e_size (e);
}

Pos
pad_pos (E* e) {
    return e.pad.pos;
}

Size
pad_size (E* e) {
    return Size (
        (e.pad.l + e.content.size.w + e.pad.r).to!W,
        (e.pad.t + e.content.size.h + e.pad.b).to!H,
    );
}

Pos
content_pos (E* e) {
    return e.content.pos;
}

Pos
text_pos (E* e) {
    return content_pos (e);
}

Pos
image_pos (E* e) {
    return content_pos (e);
}


Size
e_size (E* e) {
    return e.size;
}

Size
content_size (E* e) {
    return e.content.size;
}

void
draw_e (SDL_Renderer* renderer, E* e) {
    draw_borders (renderer,e);
    draw_content_with_pad (renderer,e);
    draw_click_decoration (renderer,e);
}

void
draw_click_decoration (SDL_Renderer* renderer, E* e) {
    // shade around content, inside borders. in pad or content. shade bg
}


void
color_decor (Color color, ubyte tome, ubyte contrast, ubyte bright) {
    // tone +- 
    // contrast +- 
    // bright +- 
    // tcb
}

void
color_decor (Color color, Color_tcb tcb) {
    // tone +- 
    // contrast +- 
    // bright +- 
    // tcb
}


void
draw8 (SDL_Renderer* renderer, int x, int y, int w, int h, W t, W r, W b, W l) {
    // 1 2 3
    // 8   4
    // 7 6 5
    fill_rect (renderer, x,     y,     l,     t); // 1
    fill_rect (renderer, x+l,   y,     w-l-r, t); // 2
    fill_rect (renderer, x+w-r, y,     r,     t); // 3
    fill_rect (renderer, x+w-r, y+t,   r,     h-t-b); // 4
    fill_rect (renderer, x+w-r, y+h-b, r,     b); // 5
    fill_rect (renderer, x+l,   y+h-b, w-l-r, b); // 6
    fill_rect (renderer, x,     y+h-b, l,     b); // 7
    fill_rect (renderer, x,     y+t,   l,     h-t-b); // 8
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

    auto pos  = borders_pos  (e);
    auto size = borders_size (e);

    if (size.w > 0 && size.h > 0)
    draw8 (
        renderer, 
        pos.x, 
        pos.y, 
        size.w, 
        size.h, 
        e.borders.t.w,
        e.borders.r.w,
        e.borders.b.w,
        e.borders.l.w
    );
}

void
draw_content_with_pad (SDL_Renderer* renderer, E* e) {
    auto _pad_pos      = pad_pos (e);
    auto _pad_size     = pad_size (e);
    auto _content_pos  = content_pos (e);
    auto _content_size = content_size (e);

    draw_pad (renderer,e,_pad_pos,_pad_size);
    draw_content (renderer,e,_content_pos,_content_size);
}

void
draw_pad (SDL_Renderer* renderer, E* e, Pos _pad_pos, Size _pad_size) {
    auto color = e.pad.bg;
    SDL_SetRenderDrawColor (renderer, color.r, color.g, color.b, color.a);
    fill_rect (renderer, _pad_pos.x, _pad_pos.y, _pad_size.w, _pad_size.h);
}

void
draw_content (SDL_Renderer* renderer, E* e, Pos content_pos, Size content_size) {
    if (e.content.image.ptr !is null)
        draw_image_bg (renderer,e,content_pos,content_size);
    
    if (e.content.text.s.length)
        draw_text_bg  (renderer,e,content_pos,content_size);

    if (e.content.image.ptr !is null)
        image (renderer, e.content.image.ptr, content_pos.x, content_pos.y, content_size.w, content_size.h);

    if (e.content.text.s.length)
        draw_text (renderer, e, content_pos, content_size);
}

void
draw_text_bg (SDL_Renderer* renderer, E* e, Pos content_pos, Size content_size) {
    auto color = e.content.text.bg;
    SDL_SetRenderDrawColor (renderer, color.r, color.g, color.b, color.a);
    fill_rect (renderer, content_pos.x, content_pos.y, content_size.w, content_size.h);
}

void
draw_image_bg (SDL_Renderer* renderer, E* e, Pos content_pos, Size content_size) {
    auto color = e.content.image.bg;
    SDL_SetRenderDrawColor (renderer, color.r, color.g, color.b, color.a);
    fill_rect (renderer, content_pos.x, content_pos.y, content_size.w, content_size.h);
}


void
draw_text (SDL_Renderer* renderer, E* e, Pos cp, Size cs) {
    // fill rects
    //   e.content.text.rects
    //   rect.pos = pos;
    // draw rects
    //   foreach rect rects
    //   one_char
    _text (
        renderer, 
        e.content.text.rects, 
        e.content.text.font.ptr, 
        e.content.text.fg, 
        cp.x, cp.y, 
        cs.w, cs.h);
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

