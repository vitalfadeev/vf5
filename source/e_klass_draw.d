module e_klass_draw;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import bindbc.sdl.image;
import e;
import e_update : max;
import types;
import pix : FONT_PTR, SDLException, TTFException;


void
line (Pos pos, Pos pos2, W wid) {
    // hickLineColor (SDL_Renderer *renderer, Sint16 x1, Sint16 y1, Sint16 x2, Sint16 y2, Uint8 width, Uint32 color)
}

void
arc (Pos pos, Pos pos2, W wid) {
    // aaArcColor (SDL_Renderer * renderer, float cx, float cy, float rx, float ry, float start, float end, float thick, Uint32 color);
    // thickArcColor (SDL_Renderer * renderer, Sint16 x, Sint16 y, Sint16 rad, Sint16 start, Sint16 end, Uint32 color, Uint8 thick);

    //arcColor     (   SDL_Renderer *      renderer,
    //    Sint16      x,
    //    Sint16      y,
    //    Sint16      rad,
    //    Sint16      start,
    //    Sint16      end,
    //    Uint32      color 
    //)       
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
draw_rect (SDL_Renderer* renderer, int x, int y, int w, int h, int bold) {
    SDL_Rect rect;
    rect.x = x;
    rect.y = y;
    rect.w = w;
    rect.h = h;
    // bold
    SDL_RenderDrawRect (renderer, &rect);
}

void
image (SDL_Renderer* renderer, IMAGE_PTR ptr, X x, Y y, W w, H h) {
    SDL_Surface* surface = ptr;
    SDL_Texture* texture = SDL_CreateTextureFromSurface (renderer, surface);

    //
    SDL_Rect dstrect = SDL_Rect (x, y, w, h);
    SDL_RenderCopy (renderer, texture, null, &dstrect);
    //SDL_RenderCopy (renderer, texture, null, null);

    //
    SDL_DestroyTexture (texture);
}


void
_text (SDL_Renderer* renderer, E.Content.Text.TextRect[] rects, FONT_PTR font, Color color, X x, Y y, W w, H h) {
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
get_text_size (string s, FONT_PTR font, Color color) {
    int w, h;
    auto ret = TTF_SizeUTF8 (font, s.toStringz, &w, &h);
    
    return Size (w.to!W,h.to!W);
}


void
one_string (SDL_Renderer* renderer, string s, FONT_PTR font, Color color, int x, int y, int w, int h) {
    auto image = _one_string (renderer,s,font,color);
    _render_texture (renderer,image,x,y,w,h);
}

SDL_Texture*
_one_string (SDL_Renderer* renderer, string s, FONT_PTR font, Color color) {
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
_render_texture (SDL_Renderer* renderer, SDL_Texture* tex, int x, int y, int w, int h) {
    SDL_Rect dst;
    dst.x = x;
    dst.y = y;
    dst.w = w;
    dst.h = h;
    _render_texture (renderer, tex, dst);
}
void 
_render_texture (SDL_Renderer* renderer, SDL_Texture* tex, SDL_Rect dst) {
    SDL_RenderCopy (renderer, tex, null, &dst);
}

// e.pos  = border + pad + content
// e.size = border + pad + content
Pos
e_pos (E* e) {
    return e.pos;
}

Pos
aura_borders_pos (E* e) {
    return e.aura.pos;
}

Size
aura_borders_size (E* e) {
    auto _content_size = e.content.size;
    auto _aura_size    = _content_size + e.aura.size + e.aura.size;
    return _aura_size;
}

Size
aura_real_size (E* e) {
    auto _content_size = e.content.size;
    auto _aura_size    = _content_size + e.aura.size + e.aura.size;
    return _aura_size;
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
draw (SDL_Renderer* renderer, E* e) {
    draw_content_with_aura (renderer,e);
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
draw_aura_borders (SDL_Renderer* renderer, E* e) {
    auto color = e.aura.border.color;
    SDL_SetRenderDrawColor (renderer, color.r,color.g,color.b,color.a,);

    auto pos  = aura_borders_pos  (e);
    auto size = aura_borders_size (e);

    if (size.w > 0 && size.h > 0)
        switch (e.aura.form.type) {
            case E.Form.Type.rect: 
                draw_rect (renderer, pos.x, pos.y, size.w, size.h, e.aura.border.w);
                //draw8 (
                //    renderer, 
                //    pos.x, 
                //    pos.y, 
                //    size.w, 
                //    size.h, 
                //    e.aura.border.w,
                //    e.aura.border.w,
                //    e.aura.border.w,
                //    e.aura.border.w
                //);
                break;
            default:
        }
}

void
draw_content_with_aura (SDL_Renderer* renderer, E* e) {
    auto _content_pos  = content_pos (e);
    auto _content_size = content_size (e);
    auto _aura_pos     = e.aura.pos;
    auto _aura_size    = aura_real_size (e);

    if (e.aura.size.w != 0 && e.aura.size.h != 0 && e.aura.color.a != 0)
        draw_aura (renderer,e,_aura_pos,_aura_size);
    if (e.aura.border.type != E.Border.Type.none && e.aura.border.color.a != 0)
        draw_aura_borders (renderer,e);
    if (e.content.size.w != 0 && e.content.size.h != 0 && e.content.color.a != 0)
        draw_content_bg (renderer,e,_content_pos,_content_size);
    if (e.content.size.w != 0 && e.content.size.h != 0)
        draw_content (renderer,e,_content_pos,_content_size);
}

void
draw_aura (SDL_Renderer* renderer, E* e, Pos _aura_pos, Size _aura_size) {
    auto color = e.aura.color;
    SDL_SetRenderDrawColor (renderer, color.r, color.g, color.b, color.a);
    fill_rect (renderer, _aura_pos.x, _aura_pos.y, _aura_size.w, _aura_size.h);
}

void
draw_content_bg (SDL_Renderer* renderer, E* e, Pos _content_pos, Size _content_size) {
    auto color = e.content.color;
    SDL_SetRenderDrawColor (renderer, color.r, color.g, color.b, color.a);
    fill_rect (renderer, _content_pos.x, _content_pos.y, _content_size.w, _content_size.h);
}

void
draw_content (SDL_Renderer* renderer, E* e, Pos content_pos, Size content_size) {
    if (e.content.image.ptr !is null)
        draw_image_bg (renderer,e,content_pos,content_size);
    
    if (e.content.text.s.length && e.content.text.bg.a != 0)
        draw_text_bg  (renderer,e,content_pos,content_size);

    if (e.content.image.ptr !is null)
        image (renderer, e.content.image.ptr, content_pos.x, content_pos.y, content_size.w, content_size.h);

    if (e.content.text.s.length && e.content.text.fg.a != 0)
        draw_text (renderer,e,content_pos,content_size);
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

