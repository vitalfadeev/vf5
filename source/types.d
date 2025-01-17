module types;

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
}

struct
Size {
    W w;         // 0..16385 
    H h;         // 0..16385
}

struct
Pad {
    Y t;
    X r;
    Y b;
    X l;
}

struct
Color {
    SDL_Color color;
    alias color this;
}

alias Color BG;
