module doc;

import etree;
import klass;


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
}
