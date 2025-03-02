module etree;

import std.conv;
public import vf.tree;
import tstring;
import doc   : Doc;
import e     : E;

alias ETree = Tree!E;

auto
new_e () {
    return new E ();
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
            if (!skip_hidden (e_tree))
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

