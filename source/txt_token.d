module txt_token;

import std.stdio;

alias UTF8_string = string;
alias UTF8_char   = dchar;


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

struct
Token {
    Type        type;
    UTF8_string s;  // length,ptr

    enum
    Type {
        none,
        string,   // abc
        quoted,   // `text`
        spaces,   // a b
        comment,  // // comment
        cr
    }
}

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
            case ' '  : return new Spaces_reader (dg).go (c);
            case '\\' : return new Escaped_reader (dg).go (c);
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
                emit (new Token (Token.Type.quoted, s));
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
        if (c == '\\') {
            return this;
        }
        else {
            return new Start_reader (dg).go (c);
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


struct
Token_line_reader {
    UTF8_string s;

    int
    opApply (int delegate (Token[] t_line) dg) {
        auto reader = Tokenizer (s);
        Token[] t_line;

        foreach (t; reader) {
            t_line ~= *t;

            if (t.type ==Token.Type.cr) {
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

