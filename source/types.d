module types;

import std.conv;
import bindbc.sdl;
public import color;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;


alias L    = int;  // length
alias Deep = int;

enum 
IL {  // index of location
    X = 0,
    Y = 1,
};
enum NL = IL.max+1;  // N locations: 1 = X, 2 = XY, 3 = XYZ

struct
_Loc (uint N) {  
    L[N] s;  // SIMD vector

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
alias Loc = _Loc!NL;
alias Len = _Loc!NL;

struct
LocLen {
    Loc loc;
    Len len;
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
LC {
    L len;      // length   : 0 50 100
    L cap = 1;  // capacity : 100

    auto
    of (L l) {
        return 
            (cap) ?
                l * len / cap : 
                0;
    }
}

// Way
// 1: -x +x
// 2: -x +x  -y +y
// 3: -x +x  -y +y  -z +z
struct
_Way (uint N) {
    S[N] s;

    struct
    S {
        IL v;  // x y z, x y x, y x x, x x x
        L  l;  // 1 16 16, 1 16 0, 1 16 0, 1 0 0, -1 0 0
    }

    void
    set (IL il, IL v, L l) {
        auto _s = s[il];
        _s.v = v;
        _s.l = l;
    }
}
alias Way = _Way!NL;

struct
_DefLoc (uint N) {
    LC[N] s;

    void
    set (L x_len, L x_cap, L y_len, L y_cap) {
        this.s[IL.X].len = x_len;
        this.s[IL.X].cap = x_cap;
        this.s[IL.Y].len = y_len;
        this.s[IL.Y].cap = y_cap;
    }

    // X, LocType.flex,  0,1
    void
    set (IL il, L len, L cap=1) {
        auto _s = s[il];
        _s.len = len;
        _s.cap = cap;
    }

    bool
    opEqual (typeof(this) b) {
        return (s == b.s);
    }
}
alias DefLoc = _DefLoc!NL;


struct
_DefLen (uint N) {
    S[N] s;

    struct
    S {
        LC   lc;
        bool bycore;  // 0 - by pare, 1 - by core
        bool max;     // 0 - ...    , 1 - max of able
    }

    void
    set (IL il, L len, L cap=1) {
        auto _s = s[il];
        _s.lc.len = len;
        _s.lc.cap = cap;
        _s.max    = false;
    }

    void
    set_max (IL il) {
        auto _s = s[il];
        _s.max = true;
        _s.lc.len = 1;
        _s.lc.cap = 1;
    }

    void
    set_bypare (IL il) {
        s[il].bycore = false;
    }

    void
    set_bycore (IL il) {
        s[il].bycore = true;
    }
}
alias DefLen = _DefLen!NL;


struct
Window {
    SDL_Window* _super;
    alias _super this;

    Loc
    loc () {
        Loc loc;
        SDL_GetWindowPos  (_super, &loc[IL.X], &loc[IL.Y]);
        return loc;
    }

    Len
    len () {
        Len len;
        SDL_GetWindowSize (_super, &len[IL.X], &len[IL.Y]);
        return len;
    }
}
