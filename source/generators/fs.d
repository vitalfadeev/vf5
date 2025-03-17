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
    import std.file : dirEntries,SpanMode;
;

    auto path = e.generator.fs.path;

    if (path.length) {
        //string[][] lines = [["123"], ["456"]];
        string[][] lines;

        foreach (string name; dirEntries (path,SpanMode.shallow)) {
            lines ~= [name];
        }

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
