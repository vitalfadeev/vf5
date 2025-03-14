module generators.cmd;

import std.stdio : writeln;
import std.string : splitLines;
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

    //            auto splits = line.split (dlm);
    //            TString[] values;
    //            foreach (s; splits) {
    //                values ~= TString (TString.Type.string,s);
    //            }

    //            // map
    //            //   to template
    //            auto tpl_klass = e.childs_src.tpl.klass;
    //            auto tpl_src   = e.childs_src.tpl.src;
    //            auto tpl_dst   = e.childs_src.tpl.dst;

    //            // tpl
    //            auto kls = e.find_klass (tpl_klass);
    //            if (kls !is null) {
    //                E*[] e_line;

    //                load_childs_add_fields:
    //                foreach (field; WalkFields (kls)) {
    //                    if (field.name == "e") {
    //                        auto _e = e.new_child_e (field.values);
    //                        e.childs ~= _e;
    //                        e_line ~= _e;

    //                        //
    //                        apply_klasses (_e);

    //                        // set text
    //                        foreach (_kls; _e.klasses)
    //                            _kls.set (_kls,_e,"text",values);

    //                        _e.update ();

    //                        // limit height
    //                        if (_e.pos.y > e.pos.y + e.size.h)
    //                            break load_childs_add_lines;
    //                    }
    //                }

    //                // set fields
    //                //foreach (i; tpl_src) {
    //                //    auto field_name = tpl_dst[i];
    //                //    auto _t = e_line[i];
    //                //    foreach (_kls; _e.klasses)
    //                //        _kls.set (_kls,doc,_t,field_name,values);
    //                //}
    //            }
            }
        }

    string[][] lines = [["123","456"]];

    foreach (line; lines)
        if (auto result = dg (line))
            return result;

    return 0;    
}
