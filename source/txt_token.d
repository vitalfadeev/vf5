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
                        int result = dg (t_line);
                        if (result)
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
            int result = dg (t_line);
            if (result)
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

    }
}
