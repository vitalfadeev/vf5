module etree;

import std.conv;
public import vf.tree;
import tstring;
import e     : E;
import klass : Klass;
import field : Field;

auto
new_e () {
    return new E ();
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
        foreach (_field; klass_or_field.fields)
            if (auto result = dg (_field))
                return result;

        return 0;
    }
}


auto 
WalkTree (E* e) {
    return vf.tree.WalkTree (e,&skip_hidden);
}

bool 
skip_hidden (E* e) {
    return e.hidden;
}

auto 
FindDeepest (Tree,Cond) (Tree* t, Cond cond) {
    return vf.tree.FindDeepest (t,&skip_hidden,cond);
}

auto 
WalkLeft (E* e) {
    return vf.tree.WalkLeft (e, &skip_hidden);
}

auto 
WalkChilds (Tree) (Tree* t) {
    return vf.tree.WalkChilds (t, &skip_hidden);
}

