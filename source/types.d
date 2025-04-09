module types;

import std.conv;
import bindbc.sdl;
public import color;


alias COORD = int;
alias X = COORD;
alias Y = COORD;
alias W = COORD;
alias H = COORD;
alias R = COORD; // radius

enum 
ORD {
    X,
    Y
};
enum ORDS = ORD.max+1;

alias Deep = int;

struct 
Balance {
    int length;    // -50 0 +50
    int capacity;  // 100
}

struct 
Pos {
    union {
        struct {
            X x;         // 0..16385
            Y y;         // 0..16385
        }
        COORD[ORD] v;
    }

    Pos
    opBinary (string op : "+") (Size size) {
        return Pos (x+size.w, y+size.h);
    }

    Pos
    opBinary (string op : "-") (Size size) {
        return Pos (x-size.w, y-size.h);
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

    int
    opCmp (Pos b) {
        if (x.v == b.v)
            return 0;
        else
        if (x.v > b.v)
            return 1;
        else
            return -1;
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
Pos_ {
    Type[N] type;
    union {
        Vec_!N     fixed;
        Balance[N] balance;
    }
    Vec_!N calculated;

    enum
    Type {
        _,
        fixed,
        balance,
    }
}

struct
Size_ (N) {
    Type[N] type = Type.parent;
    union {
        Vec_!N     fixed;
        Balance[N] balance;
    }
    Vec_!N calculated;

    enum 
    Type {
        fixed,
        balance,
        //
        parent, // default
        content,
        window,
    }
}

struct
PosSize_ (N) {
    Pos_!N  pos;  // 1. a
    Size_!N size; // 2. b
}

struct
Vec_ (N) {
   COORD[N] s;
}

alias Pos2     = Pos_!2;
alias Size2    = Size_!2;
alias PosSize2 = PosSize_!2;
alias Vec2     = Vec_!2;


alias Limit = Pos;

struct
Size {
    union {
        struct {
            W w;         // 0..16385 
            H h;         // 0..16385
        };
        COORD[ORDS] v;
    }
    alias x = w;
    alias y = h;

    Size
    opBinary (string op : "+") (Size b) {
        return Size ((w+b.w).to!W, (h+b.h).to!H);
    }

    Size
    opBinary (string op : "-") (Size b) {
        return Size ((w-b.w).to!W, (h-b.h).to!H);
    }

    Size
    opBinary (string op : "/") (int b) {
        return Size ((w/b).to!W, (h/b).to!H);
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


