module txt_token;

import std.stdio;
import tstring;

alias UTF8_string = string;
alias UTF8_char   = dchar;

/*
struct
Tokenizer {
    UTF8_string s;

    int
    opApply (int delegate (Token* t) dg) {
        auto utf8_reader = UTF8_reader (s);
        Reader reader = new Start_reader (dg);

        foreach (c; utf8_reader) {
            reader = reader.go (c); // emit

            //int result = dg (t);
            //if (result)
            //    return result;                
        }

        return 0;
    }
}

//struct
//Token {
//    Type        type;
//    UTF8_string s;  // length,ptr

//    enum
//    Type {
//        none,
//        string,   // abc
//        dquoted,  // "text"
//        bquoted,  // `text`
//        spaces,   // a b
//        comment,  // // comment
//        cr
//    }
//}

class
Reader {
    int delegate (Token* t) dg;

    this (int delegate (Token* t) dg) {
        this.dg = dg;
    }

    Reader
    go (dchar c) {
        return this;
    }

    void
    emit (Token* token) {
        if (dg !is null )
            dg (token);
    }
}

class
Start_reader : Reader {
    this (int delegate (Token* t) dg) {
        super (dg);
    }

    override
    Reader
    go (dchar c) {
        switch (c) {
            case '"'  : return new QuatedString_reader (dg).go (c);
            case '`'  : return new BQuatedString_reader (dg).go (c);
            case ' '  : return new Spaces_reader (dg).go (c);
            case '\\' : return new Escaped_reader (dg).go (c);
            case '/'  : return new Comment_reader (dg).go (c);
            case '\n' : return new CR_reader (dg).go (c);
            default   : return new String_reader (dg).go (c);
        }

        return this;
    }
}

class
QuatedString_reader : Reader {
    string s;
    bool opened = false;

    this (int delegate (Token* t) dg) {
        super (dg);
    }

    override
    Reader
    go (dchar c) {
        if (opened == false) {
            opened = true;
            s ~= c;
            return this;
        }
        else {
            if (c == '\"') {
                s ~= c;
                emit (new Token (Token.Type.dquoted, s));
                return new Start_reader (dg);
            }
            else {
                s ~= c;
                return this;
            }
        }
    }
}

class
BQuatedString_reader : Reader {
    string s;
    bool opened = false;

    this (int delegate (Token* t) dg) {
        super (dg);
    }

    override
    Reader
    go (dchar c) {
        if (opened == false) {
            opened = true;
            s ~= c;
            return this;
        }
        else {
            if (c == '`') {
                s ~= c;
                emit (new Token (Token.Type.bquoted, s));
                return new Start_reader (dg);
            }
            else {
                s ~= c;
                return this;
            }
        }
    }
}

class
Spaces_reader : Reader {
    string s;

    this (int delegate (Token* t) dg) {
        super (dg);
    }

    override
    Reader
    go (dchar c) {
        if (c == ' ') {
            s ~= c;
            return this;
        }
        else {
            emit (new Token (Token.Type.spaces, s));
            return new Start_reader (dg).go (c);
        }
    }
}

class
Escaped_reader : Reader {
    string s;

    this (int delegate (Token* t) dg) {
        super (dg);
    }

    override
    Reader
    go (dchar c) {
        if (c == '\\')
            return this;
        else
            return new Start_reader (dg).go (c);
    }
}

class
Comment_reader : Reader {
    string s;

    this (int delegate (Token* t) dg) {
        super (dg);
    }

    override
    Reader
    go (dchar c) {
        switch (s.length) {
            case 0: { // /
                if (c == '/') {
                    s ~= c;
                    return this;
                } 
                else
                    return new Start_reader (dg).go (c);
                break;
            }
            case 1: { // //
                if (c == '/') {
                    s ~= c;
                    return this;
                } 
                else // /a
                    return new String_reader (dg,s).go (c);
                break;
            }
            default: { //abc
                if (c == '\n') {
                    emit (new Token (Token.Type.comment, s));
                    return new CR_reader (dg).go (c);
                }
                else {                    
                    s ~= c;
                    return this;
                }
            }
        }

    }
}

class
CR_reader : Reader {
    string s;

    this (int delegate (Token* t) dg) {
        super (dg);
    }

    override
    Reader
    go (dchar c) {
        if (c == '\n') {
            s ~= c;
            return this;
        }
        else {
            emit (new Token (Token.Type.cr, s));
            return new Start_reader (dg).go (c);
        }
    }
}

class
String_reader : Reader {
    string s;

    this (int delegate (Token* t) dg) {
        super (dg);
    }

    this (int delegate (Token* t) dg, string s) {
        super (dg);
        this.s = s;
    }

    override
    Reader
    go (dchar c) {
        switch (c) {
            case ' '  : emit (new Token (Token.Type.string, s)); return new Start_reader (dg).go (c);
            case '\n' : emit (new Token (Token.Type.string, s)); return new Start_reader (dg).go (c);
            default   : s ~= c; return this;
        }
    }
}

struct 
UTF8_reader {
    UTF8_string s;

    int
    opApply (int delegate (UTF8_char utf8_c) dg) {
        foreach (dchar utf8_c; s) {
            int result = dg (utf8_c);
            if (result)
                return result;                
        }

        return 0;
    }
}



*/

struct
Token_line_reader {
    UTF8_string s;

    int
    opApply (int delegate (TString[] t_line) dg) {
        TString[] t_line;

        foreach (ts; to_tstrings (s)) {
            t_line ~= ts;

            if (ts.type ==TString.Type.cr) {
                int result = dg (t_line);
                if (result)
                    return result;

                t_line.length = 0;
            }
        }

        // last line without cr
        if (t_line.length > 0) {
            int result = dg (t_line);
            if (result)
                return result;
        }

        return 0;
    }
}
