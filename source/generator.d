import std.stdio : writeln;
import etree;
import e;
import e_update : apply_klass;
import e_update : TemplateArg;
import e_update : force_e_update;
import klass;

// generator
// template
//
// generator x template -> e
//   a b c       e name
//             name (A)
//               text = A 

alias GENERATE_FN = int function (Generator* g, E* e, GENERATE_DG dg);
alias GENERATE_DG = int delegate (string[] line);
alias GENERATOR_PTR = Generator*;


struct
Generator {
    GENERATE_FN generate = &.generate;
    E* e;

    //int
    //opApply (GENERATE_DG dg) {
    //    if (this.generate !is null)
    //        return this.generate (&this,e,dg);
    //    else
    //        return 0;
    //}
}

int
generate (Generator* g, E* e, GENERATE_DG dg) {
    string[][] lines;

    foreach (line; lines)
        if (auto result = dg (line))
            return result;

    return 0;    
}

void
gen_tree (E* e, Generator* generator, Klass* template_klass) {
    writeln ("gen_tree");

    // template
    //   kls.args      = [TEXT]
    //   template_args = [abc,def]
    
    GENERATE_DG dg = (string[] line) {
        writeln ("GENERATE_DG dg (ss): ", line);

        TemplateArg[] template_args;

        foreach (i,kls_arg; template_klass.args) {
            if (i < line.length)
                template_args ~= TemplateArg (kls_arg,line[i]);
            else
                break;
        }

        apply_klass (e,template_klass,template_args);

        foreach (_e; WalkChildsReverse (e)) {
            force_e_update (_e);

            if (_e.pos.y + _e.size.h > e.pos.y + e.size.h)
                return 1;
            break;
        }

        return 0;
    };

    generator.generate (generator,e,dg);
}


void
_go () {
    Generator g;
    Klass*    template_klass;
    E*        dst = new E ();

    gen_tree (dst,&g,template_klass);
}

