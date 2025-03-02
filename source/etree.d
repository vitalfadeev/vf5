module etree;

import std.conv;
public import vf.tree;
import tstring;
import doc   : Doc;
import e     : E;
import klass : Klass;
import klass : UniField;

alias ETree = Tree!E;

auto
new_e () {
    return new E ();
}

auto 
WalkKlasses (Doc* doc) {
    return _WalkKlasses (doc_t);
}
struct 
_WalkKlasses {
    Doc* doc;

    int
    opApply (int delegate (Klass* kls) dg) {
        int result;

        foreach (kls; doc.klasses)
            result = dg (kls);
            if (result)
                return result;

        return 0;
    }
}


auto 
WalkFields (Klass* kls) {
    return _WalkFields (kls);
}


struct 
_WalkFields {
    Klass* kls;

    int
    opApply (int delegate (UniField* field) dg) {
        int result;

        foreach (ref unifield; kls.fields) {
            result = dg (&unifield);
            if (result)
                return result;
        }

        return 0;
    }
}


auto 
WalkE (Doc* doc) {
    return _WalkE (doc_t);
}


struct 
_WalkE {
    Doc* doc;

    int
    opApply (int delegate (ETree* t) dg) {
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
skip_hidden (ETree* t) {
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

