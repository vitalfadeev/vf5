module generators.fs;

import std.stdio : writeln;
import std.string : splitLines;
import std.string : split;
import std.process;
import e;
import e_update;
import tstring;
import generator;


struct
FsGenerator {
    Generator _super = {&.generate};
    alias _super this;

    TString path;   // .
}

int
generate (Generator* g, E* e, GENERATE_DG dg) {
    auto path = e.generator.fs.path;

    if (path.length) {
        string[][] lines = [["123"], ["456"]];
        writeln ("RET: ", lines);
        
        load_childs_add_lines:
        foreach (line; lines) {
            string[] template_line;
            foreach (s; line)
                template_line ~= s;

            //
            if (auto result = dg (template_line))
                return result;
        }
    }

    return 0;    
}
