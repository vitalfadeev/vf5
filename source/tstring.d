module tstring;

import std.stdio : writeln;
import std.range : InputRange,isInputRange;
import std.functional : unaryFun, binaryFun;
import std.traits : isNarrowString;

alias UTF8_string = string;
alias UTF8_char   = dchar;


struct
TString {
    Type        type;
    UTF8_string s;

    enum
    Type {
        none,
        indent,
        name,
        spaces,
        string,
        dquoted,
        bquoted,
        args,
        comment,
        cr
    }
}

string
join (TString[] tss, string sep) {
    string joined;

    foreach (ts; tss)
        if (ts.type == TString.Type.string)
            joined ~= ts.s ~ sep;

    return joined;
}


auto
to_tstrings (string s)  {
    return _to_tstrings (s);
}

struct 
_to_tstrings {
    UTF8_string s;

    enum
    Type {
        none,
        //indent_start,
        //indent_end,
        //name_start,
        //name_end,
        dquoted_start,
        dquoted_end,
        bquoted_start,
        bquoted_end,
        spaces_start,
        spaces_end,
        cr_start,
        cr_end,
        comment_start,
        comment_rest,
        comment_end,
        string_start,
        string_end,
    }
    Type type;

    int
    opApply (int delegate (TString ts) dg) {
        import std.utf : decode;

        immutable len = s.length;
        size_t i = 0, next = 0;
        size_t i_start;

        while (next < len) {
            if (auto result = _split (decode (s, next),i,next,dg,i_start))
                return result;

            i = next;
        }

        return 0;
    }

    int
    _split (dchar c, size_t i, size_t next, int delegate (TString ts) dg, ref size_t i_start) {
        int result;

        switch (type) {
            case Type.none:
                switch (c) {
                    case ' ':
                        type = Type.spaces_start;
                        break;
                    case '"':
                        type = Type.dquoted_start;
                        break;
                    case '`':
                        type = Type.bquoted_start;
                        break;
                    case '\n':
                        type = Type.cr_start;
                        i_start = i;
                        break;
                    case '/':
                        type = Type.comment_start;
                        i_start = i;
                        break;
                    default:
                        type = Type.string_start;
                        i_start = i;
                }
                break;

            case Type.spaces_start:
                switch (c) {
                    case ' ':
                        break;
                    case '"':
                        result = dg (TString(TString.Type.spaces,s[i_start..i]));
                        type = Type.dquoted_start;
                        i_start = i;
                        return result;
                    case '`':
                        result = dg (TString(TString.Type.spaces,s[i_start..i]));
                        type = Type.bquoted_start;
                        i_start = i;
                        return result;
                    case '\n':
                        result = dg (TString(TString.Type.spaces,s[i_start..i]));
                        type = Type.cr_start;
                        i_start = i;
                        return result;
                    case '/':
                        result = dg (TString(TString.Type.spaces,s[i_start..i]));
                        type = Type.comment_start;
                        i_start = i;
                        break;
                    default:
                        result = dg (TString(TString.Type.spaces,s[i_start..i]));
                        type = Type.string_start;
                        i_start = i;
                        return result;
                }
                break;

            case Type.dquoted_start:
                switch (c) {
                    case '"':
                        result = dg (TString(TString.Type.dquoted,s[i_start..next]));
                        type = Type.none;
                        i_start = next;
                        return result;
                    default:
                }
                break;

            case Type.bquoted_start:
                switch (c) {
                    case '`':
                        result = dg (TString(TString.Type.bquoted,s[i_start..next]));
                        type = Type.none;
                        i_start = next;
                        return result;
                    default:
                }
                break;

            case Type.cr_start:
                switch (c) {
                    case '\n':
                        break;
                    case ' ':
                        result = dg (TString(TString.Type.cr,s[i_start..i]));
                        type = Type.spaces_start;
                        i_start = i;
                        break;
                    case '"':
                        result = dg (TString(TString.Type.cr,s[i_start..i]));
                        type = Type.dquoted_start;
                        i_start = i;
                        break;
                    case '`':
                        result = dg (TString(TString.Type.cr,s[i_start..i]));
                        type = Type.bquoted_start;
                        i_start = i;
                        break;
                    case '/':
                        result = dg (TString(TString.Type.cr,s[i_start..i]));
                        type = Type.comment_start;
                        i_start = i;
                        break;
                    default:
                        result = dg (TString(TString.Type.cr,s[i_start..i]));
                        type = Type.string_start;
                        i_start = i;
                        return result;
                }
                break;

            case Type.comment_start:
                switch (c) {
                    case '/': // 2nd / from // comment
                        type = Type.comment_rest;
                        break;
                    case '"':
                        result = dg (TString(TString.Type.string,s[i_start..i]));
                        type = Type.dquoted_start;
                        i_start = i;
                        break;
                    case '`':
                        result = dg (TString(TString.Type.string,s[i_start..i]));
                        type = Type.bquoted_start;
                        i_start = i;
                        break;
                    case ' ':
                        result = dg (TString(TString.Type.string,s[i_start..i]));
                        type = Type.spaces_start;
                        i_start = i;
                        break;
                    case '\n':
                        result = dg (TString(TString.Type.string,s[i_start..i]));
                        type = Type.cr_start;
                        i_start = i;
                        return result;
                    default:
                        type = Type.string_start;
                        break;
                }
                break;

            case Type.comment_rest:
                switch (c) {
                    case '\n':
                        result = dg (TString(TString.Type.comment,s[i_start..i]));
                        type = Type.cr_start;
                        i_start = i;
                        break;
                    default:
                        // all comment
                }
                break;

            case Type.string_start:
                switch (c) {
                    case ' ':
                        result = dg (TString(TString.Type.string,s[i_start..i]));
                        type = Type.spaces_start;
                        i_start = i;
                        return result;
                    case '\n':
                        result = dg (TString(TString.Type.string,s[i_start..i]));
                        type = Type.cr_start;
                        i_start = i;
                        return result;
                    default:
                }
                break;

            default:
        }

        return 0;
    }
}
