module txt_token;

import std.stdio;
import tstring;

alias UTF8_string = string;
alias UTF8_char   = dchar;


struct
Token_line_reader {
    UTF8_string s;

    int
    opApply (int delegate (TString[] t_line) dg) {
        TString[] t_line;

        foreach (ts; to_tstrings (s)) {
            _translate (t_line, &ts);

            switch (ts.type) {
                case TString.Type.spaces  : continue;
                case TString.Type.comment : continue;
                case TString.Type.cr      : {
                    if (t_line.length == 1 && t_line[0].type == TString.Type.indent) {
                        // skip (indent only)
                    }
                    else
                    if (t_line.length >= 1) {
                        if (auto result = dg (t_line))
                            return result;
                    }
                    t_line.length = 0;
                    break;
                }
                default: 
                    t_line ~= ts;
            }
        }

        // last line without cr
        if (t_line.length > 0) {
            if (auto result = dg (t_line))
                return result;
        }

        return 0;
    }

    void
    _translate (TString[] t_line, TString* ts) {
        if (t_line.length == 0) {
            if (ts.type == TString.Type.spaces)
                ts.type = TString.Type.indent;
            else
            if (ts.type == TString.Type.string)
                ts.type = TString.Type.name;
        }

        else
        if (t_line.length == 1) {
            if (t_line[0].type == TString.Type.indent)
            if (ts.type == TString.Type.string)
                ts.type = TString.Type.name;
        }

        if (t_line.length >= 1) {
            if (ts.type == TString.Type.string) {
                if (t_line[0].type == TString.Type.name) { // klass
                    string name = t_line[0].s;
                    // list-template (TEXT)
                    //   e list-template-name!(TEXT)
                    if (name.length > 0 && ts.s.length > 0 && ts.s[0] == '(' && ts.s[$-1] == ')') {
                        if (name == "e") {
                            // e (...)
                        }
                        else {
                            // klass (ARGS)
                            //string klass_args = ts.s[1..$-1];
                            writefln ("klass_args: %s", ts.s);
                            ts.type = TString.Type.args;
                            //ts.s    = klass_args;
                        }
                    }
                }
            }
        }

    }
}
