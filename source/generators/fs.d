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
    TString path;   // .
    size_t  offset;
    size_t  limit;
    size_t  total;

    int
    opApply (GENERATE_DG dg) {
        import std.file : dirEntries,SpanMode;

        auto path   = this.path.s;
        auto offset = this.offset;
        auto limit  = this.limit;

        if (path.length) {
            //string[][] lines = [["123"], ["456"]];
            string[][] lines;

            foreach (string name; dirEntries (path,SpanMode.shallow)) {
                lines ~= [name];
            }
            this.total = lines.length;

            auto _offset = offset < lines.length ? offset : 0;
            auto _limit  = _offset + limit < lines.length ? _offset + limit : lines.length;
            lines = lines[_offset..$];

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
