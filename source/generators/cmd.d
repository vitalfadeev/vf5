module generators.cmd;

import std.stdio : writeln;
import std.string : splitLines;
import std.string : split;
import std.process;
import e;
import e_update;
import e_generator;
import tstring;


struct
CmdGenerator {
    TString command;   // `command`
    string _command;   // `command`
    TString delimiter; // |
    bool    require_delimiter; // require_delimiter
    size_t  skip;      // 1 (header line)
    size_t  offset;
    size_t  limit;
    size_t  total;

    int
    opApply (GENERATE_DG dg) {
        auto cmd = this._command;
        auto dlm = this.delimiter.s;
        auto rdl = this.require_delimiter;
        auto skp = this.skip;

        if (cmd.length) {
            auto ret = executeShell (cmd);
            
            load_childs_add_lines:
            foreach (line; ret.output.splitLines) {
                if (skp > 0) {
                    skp--;
                    continue;
                }

                auto splits = line.split (dlm);

                // require_delimiter
                if (rdl && splits.length <= 1)
                    continue;

                string[] template_line;
                foreach (s; splits)
                    template_line ~= s;

                //
                if (auto result = dg (template_line))
                    return result;
            }
        }

        return 0;    
    }
}
