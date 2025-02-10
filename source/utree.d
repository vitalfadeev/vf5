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
        Doc*    _doc;      // E*[] Klass*[]
        E*      _e;        // E*[]
        Klass*  _klass;    // Field*[] E*[] Switch*[]
        Field*  _field;    // 
        //Switch* _switch; // Case*[]
        //Case*   _case;   // Field*[]
    }

    this (Doc* doc) {
        type      = Type.doc;
        this._doc = doc;
    }

    this (E* e) {
        type    = Type.e;
        this._e = e;
    }

    this (Klass* klass) {
        type        = Type.klass;
        this._klass = klass;
    }

    this (Field* field) {
        type        = Type.field;
        this._field = field;
    }

    Doc*   doc   () {assert (type == Type.doc  ); return _doc;}
    E*     e     () {assert (type == Type.e    ); return _e;}
    Klass* klass () {assert (type == Type.klass); return _klass;}
    Field* field () {assert (type == Type.field); return _field;}

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
            case Type.doc   : return "Uni(" ~ ((*doc).to!string) ~ ")";
            case Type.e     : return "Uni(" ~ ((*e).to!string) ~ ")";
            case Type.klass : return "Uni(" ~ ((*klass).to!string) ~ ")";
            case Type.field : return "Uni(" ~ ((*field).to!string) ~ ")";
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

UTree*
new_e () {
    return new UTree (new Uni (new E ()));
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
        assert (doc_t !is null);
        assert (doc_t.uni.type == Uni.Type.doc);

        int result;

        foreach (UTree* _t; doc_t.childs)
            if (_t.uni.type == Uni.Type.klass) {
                result = dg (_t);
                if (result)
                    return result;
            }            

        return 0;
    }
}


auto 
WalkFields (UTree* kls_t) {
    return _WalkFields (kls_t);
}


struct 
_WalkFields {
    UTree* kls_t;

    int
    opApply (int delegate (UTree* field_t) dg) {
        assert (kls_t !is null);
        assert (kls_t.uni.type == Uni.Type.klass);

        int result;

        foreach (_t; kls_t.childs) {
            switch (_t.uni.type) {
                case Uni.Type.field: 
                case Uni.Type.e: 
                    result = dg (_t);
                    if (result)
                        return result;
                    break;
                default:
            }
        }

        return 0;
    }
}


auto 
WalkE (UTree* doc_t) {
    return _WalkE (doc_t);
}


struct 
_WalkE {
    UTree* doc_t;

    int
    opApply (int delegate (UTree* t) dg) {
        assert (doc_t !is null);
        assert (doc_t.uni.type == Uni.Type.doc);

        int result;

        foreach (e_tree; doc_t.childs) 
            if (e_tree.uni.type == Uni.Type.e)
                foreach (_t; WalkTree (e_tree)) {
                    result = dg (_t);
                    if (result)
                        return result;
                }

        return 0;
    }
}


auto 
WalkTree (Tree) (Tree* t) {
    return vf.tree.WalkTree (t,&skip_hidden);
}

bool 
skip_hidden (UTree* t) {
    return (t.uni.type != Uni.Type.e) || t.uni.e.hidden;
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
    return vf.tree.WalkChilds (t, &skip_hidden);
}
