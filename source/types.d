module types;

import std.conv;
import bindbc.sdl;
public import color;


alias Uint32 X;
alias Uint32 Y;
alias Uint32 W;
alias Uint32 H;
alias Uint32 R; // radius

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

    void*
    toVoidPtr () {
        struct
        VoidPtr {
            union {
                Pos   pos;
                void* ptr;
            }
        }
        return VoidPtr (this).ptr;
    }

    static
    Pos
    from_VoidPtr (void* ptr) {
        struct
        VoidPtr {
            union {
                void* ptr;
                Pos   pos;
            }
        }
        return VoidPtr (ptr).pos;
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

bool
pos_in_rect (Pos pos, Pos rect_pos, Size rect_size) {
    if (rect_pos.x <= pos.x && rect_pos.x + rect_size.w > pos.x)
    if (rect_pos.y <= pos.y && rect_pos.y + rect_size.h > pos.y)
        return true;

    return false;
}


