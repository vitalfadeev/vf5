module generators.klass;

import std.stdio : writeln;
import std.string : splitLines;
import std.string : split;
import std.process;
import e;
import e_update;
import klass;
import tstring;
import generator;


struct
KlassGenerator {
    TString klass;  // klass name
    Klass* _klass;
    size_t  offset;
    size_t  limit;
    size_t  total;

    int
    opApply (GENERATE_DG dg) {
        auto kls = this._klass;

        if (_klass !is null) {
            //string[][] lines = [["123"], ["456"]];
            string[][] lines;

            foreach (field; kls.fields) {
                lines ~= [field.name];
            }

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
}
