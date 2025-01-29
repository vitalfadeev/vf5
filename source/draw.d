module draw;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import bindbc.sdl.image;
import e;
import types;
import doc : max;
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
_text (SDL_Renderer* renderer, E.Content.Text.TextRect[] rects, TTF_Font* font, Color color, X x, Y y, W w, H h) {
    // from text.rects
    foreach (ref rec; rects)
        if (rec.s.length)
            one_string (renderer, rec.s, font, color, rec.pos.x, rec.pos.y, rec.size.w, rec.size.h);
}

Size
get_text_size (string s, TTF_Font* font, Color color) {
    int w, h;
    auto ret = TTF_SizeUTF8 (font, s.toStringz, &w, &h);
    
    return Size (w.to!W,h.to!W);
}


void
one_string (SDL_Renderer* renderer, string s, TTF_Font* font, Color color, X x, Y y, W w, H h) {
    font = global_font;
    color = Color (0xFF, 0xFF, 0xFF, 0xFF);
    writeln ("string: x,y: ", x, " ", y, " w,h: ", w, " ", h);
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

Pos
content_pos (E* e) {
    return Pos (
        cast(X)(e.pos.x+e.borders.l.w), 
        cast(Y)(e.pos.y+e.borders.t.w), 
    );
}

Size
content_size (E* e) {
    if ((e.size.w >= e.borders.l.w + e.borders.r.w) &&
        (e.size.h >= e.borders.l.w + e.borders.r.w))
        return Size (
            (e.size.w - e.borders.l.w - e.borders.r.w).to!W, 
            (e.size.h - e.borders.t.w - e.borders.b.w).to!H
        );
    else
        return Size (0,0);
}

void
draw_e (SDL_Renderer* renderer, E* e) {
    draw_borders (renderer,e);
    draw_content (renderer,e);
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
    //SDL_SetRenderDrawColor (renderer, 0xFF, 0xFF, 0xFF, 0xFF);
    writeln (e.pos, " ", e.size, 
        " ", e.borders.t.w, ",", e.borders.r.w,
        " ", e.borders.b.w, ",", e.borders.l.w);

    if (e.size.w > 0 && e.size.h > 0)
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
    auto color = e.bg;
    SDL_SetRenderDrawColor (renderer, color.r, color.g, color.b, color.a);
    SDL_SetRenderDrawColor (renderer, 0xFF, 0xFF, 0xFF, 0xFF);
    auto cp = content_pos (e);
    auto cs = content_size (e);
    //writeln ("cp,cs: ", cp, " ", cs);
    writeln ("p,s  : ", e.pos, " ", e.size);
    writeln ("cp,cs: ", e.content.pos, " ", e.content.size);
    writeln ("tp,ts: ", e.content.text.pos, " ", e.content.text.size);
    //fill_rect (renderer, cp.x, cp.y, cs.w, cs.h);

    if (e.content.image.ptr !is null)
        image (renderer, e.content.image.ptr, cp.x, cp.y, cs.w, cs.h);

    writeln ("e.content.text.s: ", e.content.text.s);
    if (e.content.text.s.length)
        draw_text (renderer, e, cp, cs);
}


void
draw_text (SDL_Renderer* renderer, E* e, Pos cp, Size cs) {
    // fill rects
    //   e.content.text.rects
    //   rect.pos = pos;
    // draw rects
    //   foreach rect rects
    //   one_char
    _text (renderer, e.content.text.rects, global_font, e.content.text.color, cp.x, cp.y, cs.w, cs.h);
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

