module etree;

import std.conv;
public import vf.tree;
import tstring;
import doc   : Doc;
import e     : E;
import klass : Klass;
import field : Field;

alias ETree = Tree!E;

auto
new_e () {
    return new ETree ();
}

auto 
WalkKlasses (Doc* doc) {
    return _WalkKlasses (doc);
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
    return _WalkFields!Klass (kls);
}

auto 
WalkFields (Field* field) {
    return _WalkFields!Field (field);
}


struct 
_WalkFields (T) {
    T* klass_or_field;

    int
    opApply (int delegate (Field* field) dg) {
        int result;

        foreach (_field; klass_or_field.fields) {
            result = dg (_field);
            if (result)
                return result;
        }

        return 0;
    }
}


auto 
WalkTree (Doc* doc) {
    return WalkTree (doc.tree);
}

auto 
WalkTree (Tree) (Tree* t) {
    return vf.tree.WalkTree (t,&skip_hidden);
}

bool 
skip_hidden (ETree* t) {
    return t.e.hidden;
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

