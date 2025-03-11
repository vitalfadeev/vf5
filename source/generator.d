import e;
import etree;

// generator
// template
//
// generator x template -> e
//   a b c       e name
//             name (A)
//               text = A 

struct
Generator {
    int
    opApply (int delegate (string[] s) dg) {
        string[][] lines;

        foreach (line; lines) {
            int result = dg (line);
            if (result)
                return result;
        }

        return 0;
    }
}

struct
Template {
    ETree*
    apply (string[] line) {
        return null;
    }
}

struct
GenTree {
    Generator* generator;
    Template*  template_;

    int
    opApply (int delegate (ETree* e) dg) {
        foreach (line; *generator) {
            auto e = template_.apply (line);
            if (e !is null) {
                int result = dg (e);
                if (result)
                    return result;
            }
        }

        return 0;
    }
}


void
go () {
    Generator g;
    Template  t;
    ETree*    dst = new ETree ();

    foreach (e; GenTree (&g,&t))
        dst.childs ~= e;
}

