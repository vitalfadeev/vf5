module types;

import std.conv;
import bindbc.sdl;


alias ushort X;
alias ushort Y;
alias ushort W;
alias ushort H;
alias ushort R; // radius

struct 
Pos {
    X x;         // 0..16385
    Y y;         // 0..16385

    Pos
    opBinary (string op : "+") (Size size) {
        return Pos (cast(X)(x+size.w), cast(Y)(y+size.h));
    }

    Pos
    opBinary (string op : "+") (Pos b) {
        return Pos ((x+b.x).to!W, (y+b.y).to!H);
    }

    Pos
    opBinary (string op : "-") (Pos b) {
        return Pos ((x-b.x).to!W, (y-b.y).to!H);
    }

    void
    opOpAssign (string op : "+") (Pos b) {
        x += b.x;
        y += b.y;
    }

    void
    opOpAssign (string op : "-") (Pos b) {
        x -= b.x;
        y -= b.y;
    }
}

struct
Size {
    W w;         // 0..16385 
    H h;         // 0..16385

    Size
    opBinary (string op : "+") (Size b) {
        return Size ((w+b.w).to!W, (h+b.h).to!H);
    }

    Size
    opBinary (string op : "-") (Size b) {
        return Size ((w-b.w).to!W, (h-b.h).to!H);
    }

    void
    opOpAssign (string op : "+") (Size b) {
        w += b.w;
        h += b.h;
    }

    void
    opOpAssign (string op : "-") (Size b) {
        w -= b.w;
        h -= b.h;
    }
}

struct
Pad {
    Y t;
    X r;
    Y b;
    X l;
    Color bg;
    Pos   pos;
}


alias Color = SDL_Color;

alias Color BG;
