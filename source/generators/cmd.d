module generators.cmd;

import std.stdio : writeln;
import std.string : splitLines;
import std.string : split;
import std.process;
import e;
import e_update;
import tstring;
import generator;


struct
CmdGenerator {
    Generator _super = {&.generate};
    alias _super this;

    TString command;   // `command`
    TString delimiter; // |
    size_t  skip;      // 1 (header line)
}

int
generate (Generator* g, E* e, GENERATE_DG dg) {
    auto cmd = e.generator.cmd.command.s;
    auto dlm = e.generator.cmd.delimiter.s;
    auto skp = e.generator.cmd.skip;

    if (cmd.length) {
        auto converted = extract_class_field_value (e,cmd);
        auto ret = executeShell (converted);
        writeln ("RET: ", ret);
        
        load_childs_add_lines:
        foreach (line; ret.output.splitLines) {
            if (skp > 0) {
                skp--;
                continue;
            }

            auto splits = line.split (dlm);
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
