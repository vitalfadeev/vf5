module txt_parser;

import types;
import klass;
import std.stdio : writeln;


bool 
parse_color (string s, Color* color) {
    import std.string : startsWith;

    if (s.startsWith ("#"))
        return parse_color_hex (s, color);
    else
    if (s.startsWith ("rgb")) {
        //
    }
    else
    if (s.startsWith ("tcb")) {
        return parse_color_tcb (s,color);
    }
    else {
        assert (0, "error: usupported color: " ~ s);
    }

    return false;
}

bool 
parse_color_hex (string s, Color* color) {
    import std.algorithm : startsWith;
    import std.string : strip;

    if (s.length == 4)
        return parse_color_hex3 (s, color);
    else
    if (s.length == 7)
        return parse_color_hex6 (s, color);

    return false;
}

bool 
parse_color_hex3 (string s, Color* color) {
    // #CCC

    import std.conv : to;

    *color = 
        Color (
            to!ubyte (to!ubyte (s[ 1 .. 2 ], 16) << 4),
            to!ubyte (to!ubyte (s[ 2 .. 3 ], 16) << 4),
            to!ubyte (to!ubyte (s[ 3 .. 4 ], 16) << 4),
            0xFF
        );

    return true;
}


bool 
parse_color_hex6 (string s, Color* color) {
    // #CCDDEE

    import std.conv : to;

    *color = 
        Color(
            to!ubyte (s[ 1 .. 3 ], 16),
            to!ubyte (s[ 3 .. 5 ], 16),
            to!ubyte (s[ 5 .. 7 ], 16),
            0xFF
        );

    return true;
}

bool 
parse_color_tcb (string s, Color* color) {
    // tcb +0 +0 -25
    // read tcb
    // loop:
    //   read spaecs
    //   read sign
    //   read numbers

    import std.algorithm : startsWith;
    import std.string;

    auto splits = s.split (" ");
    ColorBit[4] bits;
    ubyte[4]    color_bytes;
    *color = update_tcb (*color,bits,color_bytes);
    return parse_color_tcb (splits, &bits, &color_bytes);
}

bool 
parse_color_tcb (string[] ss, ColorBit[4]* bits, ubyte[4]* color_bytes) {
    // tcb +0 +0 -25
    // read tcb
    // loop:
    //   read spaecs
    //   read sign
    //   read numbers

    import std.algorithm : startsWith;
    import std.string : strip;

    bool ret;

    //
    if (ss.length >= 1) {
        ret = parse_one_color_tcb (ss[0], &(*bits)[0], &(*color_bytes)[0]);
        if (!ret)
            return ret;
    }
    if (ss.length >= 2) {
        ret = parse_one_color_tcb (ss[1], &(*bits)[1], &(*color_bytes)[1]);
        if (!ret)
            return ret;
    }
    if (ss.length >= 3) {
        ret = parse_one_color_tcb (ss[2], &(*bits)[2], &(*color_bytes)[2]);
        if (!ret)
            return ret;
    }
    if (ss.length >= 4) {
        ret = parse_one_color_tcb (ss[3], &(*bits)[3], &(*color_bytes)[3]);
        if (!ret)
            return ret;
    }

    return ret;
}

bool 
parse_one_color_tcb (string s, ColorBit* color_bit, ubyte* color_value) {
    // -25
    //   read sign
    //   read numbers

    import std.algorithm : startsWith;
    import std.string;
    import std.conv;

    // +-
    if (s.length >= 1) {
        if (s[0] == '+') {
            *color_bit = ColorBit.plus;
            if (s[1..$].isNumeric)
                *color_value = s[1..$].to!ubyte;
        }
        else
        if (s[0] == '-') {
            *color_bit = ColorBit.minus;
            if (s[1..$].isNumeric)
                *color_value = s[1..$].to!ubyte;
        }
        else
        if (s.isNumeric) {
            *color_bit   = ColorBit.none;
            *color_value = s.to!ubyte;
        }
    }

    return false;
}

