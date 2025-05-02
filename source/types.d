module types;

import std.conv;
import bindbc.sdl;
public import color;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;


alias L = int;  // length

enum 
IL {  // location index
    X = 0,
    Y = 1,
};
enum NIL = IL.max+1;     // N locations: 1 = X, 2 = XY, 3 = XYZ
alias Loc    = _Loc!NIL;  // 2 coords: x,y
alias Length = Loc;      // 2 coords: x,y
alias Deep   = int;

struct
_Loc (uint N) {  // SIMD vector
    L[N] s;

    this (L[N] s) {
        this.s = s;
    }

    this (L...) (L l) {
        static
        foreach (i,_L; L)
            s[i] = l[i];
    }

    auto ref
    opIndex (size_t i) {
        return s[i];
    }

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

    typeof (this)
    opBinary (string op : "+") (typeof (this) b) {
        L[N] _s;

        static
        foreach (i; 0..N)
            _s[i] += b.s[i];

        return typeof (this) (_s);
    }

    typeof (this)
    opBinary (string op : "-") (typeof (this) b) {
        L[N] _s;

        static
        foreach (i; 0..N)
            _s[i] -= b.s[i];

        return typeof (this) (_s);
    }
}

struct
Loca {
    Loc loc;   
    Loc length;
}


struct
Form (uint N) {
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

struct 
_Balance {
    L length;    // 0 50 100
    L capacity;  // 100

    auto
    of (L l) {
        return 
            (capacity) ?
                l * length / capacity : 
                0;
    }
}
alias Balance = _Balance;

// Way
// 1: -x +x
// 2: -x +x  -y +y
// 3: -x +x  -y +y  -z +z
struct
_Way (uint N) {
    ubyte[N] v;    // x y z, x y x, y x x, x x x
        Loc  length; // 1 16 16, 1 16 0, 1 16 0, 1 0 0, -1 0 0
}
alias Way = _Way!NIL;

struct
_DefLoc (uint N) {
    _Loc[N] loc;

    struct
    _Loc {        
        Type        type;     // fixed | balance
        union {
            L       stat;     // static   // 10,10
            Balance balance;  // balance  // 1/100,50/100
        }
    }

    enum
    Type : ubyte {
        _,
        stat,     // 1,1
        balance,  // 1/100 50/100
    }

    void
    set (Type type, L x_length, L x_capacity, L y_length, L y_capacity) {
        if (type == Type.balance) {
            this.type[0]             = type;
            this.type[1]             = type;
            this.balance.length[0]   = x_length;
            this.balance.length[1]   = y_length;
            this.balance.capacity[0] = x_capacity;
            this.balance.capacity[1] = y_capacity;
        }
    }

    // X, LocType.flex,  0,1
    void
    set (IL il, Type type, L length, L capacity) {
        this.loc[il].type = type;
        if (type == Type.balance) {
            this.loc[il].balance.length   = length;
            this.loc[il].balance.capacity = capacity;
        }
    }

    void
    set (IL il, Type type) {
        this.type[il] = type;
    }

    void
    set (IL il, Type type, L l) {
        this.loc[il].type = type;
        if (type == Type.stat)
            this.loc[il].stat = l;
    }

    bool
    opEqual (typeof(this) b) {
        static
        foreach (i; 0..N) {
            if (loc[i].type == b.loc[i].type) {
                final
                switch (lov[i].type) {
                    case Type.stat    : return (this.stat    == b.stat);
                    case Type.balance : return (this.balance == b.balance);
                }
            }
            else {
                assert (0, "deferent loc types");
            }
        }
    }
}
alias DefLoc = _DefLoc!NIL;


struct
_DefLength (uint N) {
    _Length[N] len;

    struct
    _Length {
        Type        type;
        union {
            L       stat;
            Balance balance;
        }
    }

    enum 
    Type {
        pra,   // default
        stat,
        balance,
        core,
        window,
        max_,
    }

    void
    set (IL il, Type type) {
        this.len[il].type = type;
    }

    void
    set (IL il, Type type, L l) {
        this.len[il].type = type;
        if (type == Type.stat)
            this.len[il].stat = l;
    }
}
alias DefLength = _DefLength!NIL;


struct
Window {
    SDL_Window* _super;
    alias _super this;

    Loc
    loc () {
        Loc loc;
        SDL_GetWindowPos  (_super, &loc[0], &loc[1]);
        return loc;
    }

    Loc
    length () {
        Loc loc;
        SDL_GetWindowSize (_super, &loc[0], &loc[1]);
        return loc;
    }
}


//alias Limit = Pos;

/*
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
    opBinary (string op : "+") (Loc  size) {
        return Loc (x+size.w, y+size.h);
    }

    Pos
    opBinary (string op : "-") (Loc  size) {
        return Loc (x-size.w, y-size.h);
    }

    Pos
    opBinary (string op : "+") (Loc b) {
        return Loc ((x+b.x).to!W, (y+b.y).to!H);
    }

    Pos
    opBinary (string op : "-") (Loc b) {
        return Loc ((x-b.x).to!W, (y-b.y).to!H);
    }

    void
    opOpAssign (string op : "+") (Loc b) {
        x += b.x;
        y += b.y;
    }

    int
    opCmp (Loc b) {
        if (x.v == b.v)
            return 0;
        else
        if (x.v > b.v)
            return 1;
        else
            return -1;
    }


    void
    opOpAssign (string op : "-") (Loc b) {
        x -= b.x;
        y -= b.y;
    }

    void*
    toVoidPtr () {
        struct
        VoidPtr {
            union {
                Loc   pos;
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
                Loc   pos;
            }
        }
        return VoidPtr (ptr).pos;
    }
}
*/

/*
struct
Loc  {
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
    opBinary (string op : "+") (Loc  b) {
        return Loc ((w+b.w).to!W, (h+b.h).to!H);
    }

    Size
    opBinary (string op : "-") (Loc  b) {
        return Loc ((w-b.w).to!W, (h-b.h).to!H);
    }

    Size
    opBinary (string op : "/") (int b) {
        return Loc ((w/b).to!W, (h/b).to!H);
    }

    void
    opOpAssign (string op : "+") (Loc  b) {
        w += b.w;
        h += b.h;
    }

    void
    opOpAssign (string op : "-") (Loc  b) {
        w -= b.w;
        h -= b.h;
    }
}
*/

/*
bool
pos_in_rect (Loc loc, Loc rect_pos, Loc  rect_size) {
    if (rect_pos.x <= pos.x && rect_pos.x + rect_size.w > pos.x)
    if (rect_pos.y <= pos.y && rect_pos.y + rect_size.h > pos.y)
        return true;

    return false;
}
*/
