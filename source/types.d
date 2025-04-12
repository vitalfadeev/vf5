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
Flex {
    uint length;    // 0 50 100
    uint capacity;  // 100
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
L {
    int x;
    alias x this;
}

struct
_Loc (N) {
    L[N] s;
    // v
    // 1: loc x
    // 2: loc x,y
    // 3: loc x,y,z

    // v
    // 1 loc: dot  x,y
    // 2 loc: line x,y x,y
    // 3 loc: tri  x,y x,y x,y
    // 4 loc: rect x,y x,y x,y x,y

    // loc in ?
    // 1: loc in loc
    // 2: loc in line
    // 3: loc in tri
    // 4: loc in rect
}

enum ORDS = 2;
alias Loc = _Loc!ORDS; // 2 coords: x,y

struct
Form (N) {
    Loc[N] s;
}

alias Form1 = Form!1;
alias Form2 = Form!2;
alias Form3 = Form!3;
alias Form4 = Form!4;

bool
has (bool INCLUDE_A=true, bool INCLUDE_B=true) (Form2 a, Form1 b) {
    // a has b  // line has dot 
    // xy[2] has xy[1]  // xy..xy has xy

    static
    if (INCLUDE_A && INCLUDE_B) 
        return (
            (a[0].x <= b[0].x) && (b[0].x <= a[1].x) &&
            (a[0].y <= b[0].y) && (b[0].y <= a[1].y)
        );
    else
    static
    if (INCLUDE_A && !INCLUDE_B) 
        return (
            (a[0].x <= b[0].x) && (b[0].x < a[1].x) &&
            (a[0].y <= b[0].y) && (b[0].y < a[1].y)
        );
    else
    static
    if (!INCLUDE_A && INCLUDE_B) 
        return (
            (a[0].x < b[0].x) && (b[0].x <= a[1].x) &&
            (a[0].y < b[0].y) && (b[0].y <= a[1].y)
        );
    else
    static
    if (!INCLUDE_A && !INCLUDE_B) 
        return (
            (a[0].x < b[0].x) && (b[0].x < a[1].x) &&
            (a[0].y < b[0].y) && (b[0].y < a[1].y)
        );
}

bool
has (Form3 a, Form1 b) {
    // a has b  // tri has dot 
    // xy[3] has xy[1]  // xy..xy..xy has xy

    Loc[3] ordered;  // by y  // by 0, by 1, by 2, ...
}

bool
has (Form4 a, Form1 b) {
    // a has b  // rect has dot 
    // xy[4] has xy[1]  // xy..xy..xy..xy has xy
}

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


