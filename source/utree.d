module utree;

import std.conv;
public import vf.tree;
import tstring;
import doc   : Doc;
import e     : E;
import klass : Klass;
import field : Field;

alias UTree = Tree!Uni;

//alias DocUniTree     = Tree!(Uni!Doc);
//alias EUniTree       = Tree!(Uni!E);
//alias KlassUniTree   = Tree!(Uni!Klass);
//alias FieldUniTree   = Tree!(Uni!Field);
//alias SwitchdUniTree = Tree!(Uni!Switch_);
//alias CaseUniTree    = Tree!(Uni!Case_);


struct // 400 Bytes
Uni {
    Type type;
    union {
        Doc     _doc;    // E*[] Klass*[]
        E       _e;      // E*[]
        Klass   _klass;  // Field*[] E*[] Switch*[]
        Field   _field;  // 
        Switch_ _switch; // Case*[]
        Case_   _case;   // Field*[]
    }
    Doc*     doc     () {assert (type == Type.doc    ); return &_doc;}
    E*       e       () {assert (type == Type.e      ); return &_e;}
    Klass*   klass   () {assert (type == Type.klass  ); return &_klass;}
    Field*   field   () {assert (type == Type.field  ); return &_field;}
    Switch_* switch_ () {assert (type == Type.switch_); return &_switch;}
    Case_*   case_   () {assert (type == Type.case_  ); return &_case;}

    this (Doc doc) {
        type      = Type.doc;
        this._doc = doc;
    }

    this (E e) {
        type    = Type.e;
        this._e = e;
    }

    this (Klass klass) {
        type        = Type.klass;
        this._klass = klass;
    }

    this (Field field) {
        type        = Type.field;
        this._field = field;
    }

    this (Switch_ switch_) {
        type         = Type.switch_;
        this._switch = switch_;
    }

    this (Case_ case_) {
        type       = Type.case_;
        this._case = case_;
    }

    enum
    Type {
        doc,
        e,
        klass,
        field,
        switch_,
        case_,
    }

    string
    toString () {
        final
        switch (type) {
            case Type.doc     : return "Uni(" ~ (_doc.to!string) ~ ")";
            case Type.e       : return "Uni(" ~ (_e.to!string) ~ ")";
            case Type.klass   : return "Uni(" ~ (_klass.to!string) ~ ")";
            case Type.field   : return "Uni(" ~ (_field.to!string) ~ ")";
            case Type.switch_ : return "Uni(" ~ (_switch.to!string) ~ ")";
            case Type.case_   : return "Uni(" ~ (_case.to!string) ~ ")";
        }
    }
}

struct
Switch_ {
    TString[] cond;

    Switch_*
    clone () {
        return new Switch_ ();
    }
}

struct
Case_ {
    TString[] values;

    Case_*
    clone () {
        return new Case_ ();
    }
}



UTree*
new_doc () {
    return new UTree (Uni (Doc ()));
    //return cast (UTree*) new DocUniTree ();
}

UTree*
new_klass (KLASS) () {
    return new UTree (Uni (KLASS ()));
}

UTree*
new_e () {
    return new UTree (Uni (E ()));
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
        assert (kls_t.uni.type == Uni.Type.klass || kls_t.uni.type == Uni.Type.case_);

        int result;

        foreach (_t; kls_t.childs) {
            switch (_t.uni.type) {
                case Uni.Type.field: 
                case Uni.Type.e: 
                case Uni.Type.switch_: 
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
        assert (doc_t.uni.type == Uni.Type.doc || doc_t.uni.type == Uni.Type.e);

        int result;

        // e
        if (doc_t.uni.type == Uni.Type.e) {
            if (skip_hidden (doc_t))
                return 0;

            result = dg (doc_t);
            if (result)
                return result;
        }

        // childs
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
WalkChilds (Tree) (Tree* t) {
    return vf.tree.WalkChilds (t, &skip_hidden);
}

