module draw;

import std.stdio;
import bindbc.sdl;
import e;
import types;


void
line (Pos pos, Pos pos2, W wid) {
    //
}

void
arc (Pos pos, Pos pos2, W wid) {
    //
}

void
fill_rect (SDL_Renderer* renderer, X x1, Y y1, X x2, Y y2) {
    SDL_Rect rect;
    rect.x = x1;
    rect.y = y1;
    rect.w = x2 - x1;
    rect.h = y2 - y1;
    SDL_RenderFillRect (renderer, &rect);
}

void
image (SDL_Renderer* renderer, void* ptr, X x1, Y y1, X x2, Y y2) {
    //
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
    //        x1     y1     x2       y2
    fill_rect (renderer, cast(X)(x),     cast(Y)(y),     cast(X)(x+l),     cast(Y)(y+t)); // 1
    fill_rect (renderer, cast(X)(x+l),   cast(Y)(y),     cast(X)(x+w-r),   cast(Y)(y+t)); // 2
    fill_rect (renderer, cast(X)(x+w-r), cast(Y)(y),     cast(X)(x+w),     cast(Y)(y+t)); // 3
    fill_rect (renderer, cast(X)(x+w-r), cast(Y)(y+t),   cast(X)(x+w),     cast(Y)(y+h-b)); // 4
    fill_rect (renderer, cast(X)(x+w-r), cast(Y)(y+h-b), cast(X)(x+w),     cast(Y)(y+h)); // 5
    fill_rect (renderer, cast(X)(x+l),   cast(Y)(y+h-b), cast(X)(x+w-r),   cast(Y)(y+h)); // 6
    fill_rect (renderer, cast(X)(x),     cast(Y)(y+h-b), cast(X)(x+l),     cast(Y)(y+h)); // 7
    fill_rect (renderer, cast(X)(x),     cast(Y)(y+t),   cast(X)(x+l),     cast(Y)(y+h-b)); // 8
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
    fill_rect (
        renderer, 
        cast(X)(e.pos.x+e.borders.l.w), 
        cast(Y)(e.pos.y+e.borders.t.w), 
        cast(X)(e.pos.x+e.size.w - e.borders.r.w), 
        cast(Y)(e.pos.y+e.size.h - e.borders.b.w)
    );
    //image (
    //    renderer, 
    //    null, 
    //    cast(X)(e.pos.x), 
    //    cast(X)(e.pos.y), 
    //    cast(X)(e.pos.x+e.size.w), 
    //    cast(X)(e.pos.y+e.size.h)
    //);
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

