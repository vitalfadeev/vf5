module doc;

import etree;
import klass;
import e;
import types;


struct
Doc {
    ETree*   tree;
    Klass*[] klasses; // find by name

    Klass*
    find_klass (string s) {
        foreach (kls; klasses)
            if (kls.name == s)
                return kls;

        return null;
    }

    Klass*
    create_klass (string s) {
        Klass* kls = new Klass (s);
        klasses ~= kls;
        return kls;
    }


    Klass*
    find_klass_or_create (string s) {
        auto kls = find_klass (s);
        if (kls is null)
            kls = create_klass (s);
        return kls;
    }

    E*
    find_e_at_pos (Pos pos) {
        E* found;

        bool 
        valid_e (ETree* t) {
            if (t.e !is null )
            if (t.e.pos.x <= pos.x && t.e.pos.x + t.e.size.w > pos.x)
            if (t.e.pos.y <= pos.y && t.e.pos.y + t.e.size.h > pos.y)
                return true;

            return false;
        }

        foreach (t; FindDeepest (tree,&valid_e))
            found = t.e;

        return found;
    }

    //int
    //event (Event* ev) {
    //    //
    //}
}

void
add_class (Doc* doc, E* e, string kls_name) {
    Klass* kls = doc.find_klass_or_create (kls_name);
    foreach (_kls; e.klasses) 
        if (_kls == kls)
            return;

    e.klasses ~= kls;
}