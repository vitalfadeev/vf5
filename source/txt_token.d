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
