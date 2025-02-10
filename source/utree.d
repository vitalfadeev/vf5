module utree;

import std.conv;
public import vf.tree;
import doc   : Doc;
import e     : E;
import klass : Klass;
import field : Field;

alias UTree = Tree!Uni;


struct
Uni {
    Type type;
    union {
        Doc*   doc;
        E*     e;
        Klass* klass;
        Field* field;
    }

    this (Doc* doc) {
        type     = Type.doc;
        this.doc = doc;
    }

    this (E* e) {
        type   = Type.e;
        this.e = e;
    }

    this (Klass* k) {
        type       = Type.klass;
        this.klass = klass;
    }

    this (Field* f) {
        type       = Type.field;
        this.field = field;
    }

    enum
    Type {
        doc,
        e,
        klass,
        field,
    }

    string
    toString () {
        final
        switch (type) {
            case Type.doc   : return "UTree(" ~ ((*doc).to!string) ~ ")";
            case Type.e     : return "UTree(" ~ ((*e).to!string) ~ ")";
            case Type.klass : return "UTree(" ~ ((*klass).to!string) ~ ")";
            case Type.field : return "UTree(" ~ ((*field).to!string) ~ ")";
        }
    }
}

UTree*
new_doc () {
    return new UTree (new Uni (new Doc ()));
}

UTree*
new_klass (KLASS) () {
    return new UTree (new Uni (cast (Klass*) new KLASS ()));
}

auto 
WalkKlasses (UTree* doc_t) {
    return _WalkKlasses (doc_t);
}


struct 
_WalkKlasses {
    UTree* doc_t;

    int
    opApply (int delegate (UTree* kls_t) dg) {
        int result;
        
        foreach (_t; utree.WalkChilds (doc_t))
            if (_t.uni.type == Uni.Type.klass) {
                result = dg (_t);
                if (result)
                    return result;
            }            

        return 0;
    }
}


auto 
WalkTree (Tree) (Tree* t) {
    return vf.tree.WalkTree (t,&always_true);
}

auto 
WalkTreeE (Tree) (Tree* t) {
    return vf.tree.WalkTree (t, &skip_hidden);
}

bool 
skip_hidden (UTree* t) {
    return t.uni.type == Uni.Type.e && t.uni.e.hidden;
}

auto 
FindDeepest (Tree,Cond) (Tree* t, Cond cond) {
    return vf.tree.FindDeepest (t,&skip_hidden,cond);
}

auto 
WalkLeft (Tree) (Tree* t) {
    return vf.tree.WalkLeft (t, &skip_hidden);
}

auto 
WalkChildsE (Tree) (Tree* t) {
    return vf.tree.WalkChilds (t, &skip_hidden);
}

auto 
WalkChilds (Tree) (Tree* t) {
    return vf.tree.WalkChilds (t, &always_true);
}

bool 
always_true (UTree* t) {
    return true;
}

