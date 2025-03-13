module color;

import std.conv;
import bindbc.sdl;
import std.stdio : writeln;


// SDL_PIXELFORMAT_RGBA32
//   SDL_PIXELFORMAT_ABGR8888 on little-endian systems
//   SDL_PIXELFORMAT_RGBA8888 on big-endian systems
alias Color = SDL_Color;

// HSL
struct
Color_tcb {
    double t; // tome        0..1
    double c; // contrast    0..1
    double b; // bright      0..1
    double a; // alpha 

    static
    Color_tcb
    from_Color (Color color) {
        double h, s, l;

        double R = cast (double) color.r;
        double G = cast (double) color.g;
        double B = cast (double) color.b;

        rgb_to_hsl (R, G, B, &h, &s, &l);

        return Color_tcb (h,s,l);
    }

    static
    Color_tcb
    from_string (string s, ColorBit[4]* bits) {
        // tcb +1 +1 +1
        // read tcb
        // loop:
        //   read spaecs
        //   read sign
        //   read numbers
        //parse_color_tcb ();

        return Color_tcb ();
    }

    Color
    to_Color () {
        double h = t;
        double s = c;
        double l = b;

        double R;
        double G;
        double B;

        hsl_to_rgb (h, s, l, &R, &G, &B);

        writeln ("hsl: ", h, " ", s, " ", l);
        writeln ("RGB: ", R, " ", G, " ", B);

        ubyte r = (R).to!ubyte;
        ubyte g = (G).to!ubyte;
        ubyte b = (B).to!ubyte;

        return Color (r,g,b,0xFF);
    }

    Color_tcb
    update (ColorBit[4] bits, ubyte[4] bytes) {
        Color_tcb updated = this;

        double[4] doubles;
        doubles[0] = cast (double) bytes[0] / 255;
        doubles[1] = cast (double) bytes[1] / 255;
        doubles[2] = cast (double) bytes[2] / 255;
        doubles[3] = cast (double) bytes[3] / 255;

        final
        switch (bits[0]) {
            case ColorBit.none : updated.t  = doubles[0]; break;
            case ColorBit.plus : updated.t += doubles[0]; break;
            case ColorBit.minus: updated.t -= doubles[0]; break;
        }
        if (updated.t > 1) updated.t = 1;
        if (updated.t < 0) updated.t = 0;

        final
        switch (bits[1]) {
            case ColorBit.none : updated.c  = doubles[1]; break;
            case ColorBit.plus : updated.c += doubles[1]; break;
            case ColorBit.minus: updated.c -= doubles[1]; break;
        }
        if (updated.c > 1) updated.c = 1;
        if (updated.c < 0) updated.c = 0;

        final
        switch (bits[2]) {
            case ColorBit.none : updated.b  = doubles[2]; break;
            case ColorBit.plus : updated.b += doubles[2]; break;
            case ColorBit.minus: updated.b -= doubles[2]; break;
        }
        if (updated.b > 1) updated.b = 1;
        if (updated.b < 0) updated.b = 0;

        return updated;
    }
}

Color 
update_tcb (Color color, ColorBit[4] bits, ubyte[4] bytes) {
    return
        Color_tcb
            .from_Color (color)
            .update (bits,bytes)
            .to_Color;
}

alias Color BG;



// Convert RGB color to HSL.
void 
rgb_to_hsl (double r, double g, double b, double *h, double *s, double *l) {
    r /= 255.0;
    g /= 255.0;
    b /= 255.0;

    writeln ("HSL: ", r, " ", g, " ", b);

    double max = dmax (dmax (r, g), b);
    double min = dmin (dmin (r, g), b);

    *h = *s = *l = (max + min) / 2;

    if (max == min) {
        *h = 0;
    }
    else {
        double d = (max - min);

        *s = (*l > 0.5) ?
            d / (2 - d) :
            d / (max + min);

        if (max == r) {
            *h = (g - b) / d + (g < b ? 6 : 0);
        }
        else 
        if (max == g) {
            *h = (b - r) / d + 2;
        }
        else {
            *h = (r - g) / d + 4;
        }

        *h /= 6;
    }

    writeln ("HSL: ", *h, " ", *s, " ", *l);
}

// Converts an HUE to r, g or b.
double 
hue_to_rgb (double p, double q, double t) {
    if (t < 0)
        t += 1;

    if (t > 1)
        t -= 1;

    if (t < 1.0 / 6) {
        return p + (q - p) * 6 * t;
    }

    if (t < 1.0 / 2)  
        return q;

    if (t < 2.0 / 3) {
        return p + (q - p) * (2.0 / 3 - t) * 6;
    }

    return p;
}

// Converts HSL to RGB
void 
hsl_to_rgb (double h, double s, double l, double *r, double *g, double *b) {
    if (0 == s) {
        *r = *g = *b = l; // achromatic
    }
    else
    {
        double q = l < 0.5 ? l * (1 + s) : l + s - l * s;
        double p = 2 * l - q;

        *r = hue_to_rgb (p, q, h + 1.0 / 3) * 255.0;
        *g = hue_to_rgb (p, q, h)           * 255.0;
        *b = hue_to_rgb (p, q, h - 1.0 / 3) * 255.0;
    }
}


void 
up_contrast (ubyte *r, ubyte *g, ubyte *b) {
   double h, s, l;

   double R = cast (double) *r;
   double G = cast (double) *g;
   double B = cast (double) *b;

   rgb_to_hsl (R, G, B, &h, &s, &l);

   h += 0.5;
   if (h > 1) h -= 1;

   hsl_to_rgb (h, s, l, &R, &G, &B);
   *r = R.to!ubyte;
   *g = G.to!ubyte;
   *b = B.to!ubyte;
}

double dmax (double a, double b)  { return (a > b) ? a : b; }
double dmin (double a, double b)  { return (a < b) ? a : b; }

enum
ColorBit {
    none,
    plus,
    minus
}
