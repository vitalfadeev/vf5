import e;
import etree;

// generator
// template
//
// generator x template -> e
//   a b c       e name
//             name (A)
//               text = A 

alias GENERATE_DG = int delegate (string[] ss);
alias GENERATE_FN = int function (Generator* g, E* e, GENERATE_DG dg);


struct
Generator {
    GENERATE_FN generate = &.generate;
    E* e;

    int
    opApply (GENERATE_DG dg) {
        if (this.generate !is null)
            return this.generate (&this,e,dg);
        else
            return 0;
    }
}

int
generate (Generator* g, E* e, GENERATE_DG dg) {
    string[][] lines;

    foreach (line; lines)
        if (auto result = dg (line))
            return result;

    return 0;    
}

struct
Template {
    E*
    apply (string[] line) {
        return null;
    }
}

struct
GenTree {
    Generator* generator;
    Template*  template_;

    int
    opApply (int delegate (E* e) dg) {
        foreach (line; *generator) {
            auto e = template_.apply (line);
            if (e !is null)
            if (auto result = dg (e))
                return result;
        }

        return 0;
    }
}


void
go () {
    Generator g;
    Template  t;
    E*        dst = new E ();

    foreach (e; GenTree (&g,&t))
        dst.childs ~= e;
}

