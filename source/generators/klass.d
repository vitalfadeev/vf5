module generators.klass;

import std.stdio : writeln;
import std.string : splitLines;
import std.string : split;
import std.process;
import e;
import e_update;
import tstring;
import generator;


struct
KlassGenerator {
    Generator _super = {&.generate};
    alias _super this;
}

int
generate (Generator* g, E* e, GENERATE_DG dg) {
    auto _klass = e.generator.klass.klass;

    if (_klass.length) {
        //string[][] lines = [["123"], ["456"]];
        string[][] lines;

        auto kls = find_klass (e,_klass);
        if (kls is null)
            return 0;

        foreach (field; kls.fields) {
            lines ~= [field.name];
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
