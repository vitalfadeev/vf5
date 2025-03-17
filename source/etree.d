module etree;

import std.conv;
import vf.tree;
import tstring;
import e     : E;
import klass : Klass;
import field : Field;

alias Tree = vf.tree.Tree;

auto
new_e () {
    return new E ();
}

auto 
childs (Tree) (Tree* t)  {
    return vf.tree.childs (t);
}

auto 
has_childs (Tree) (Tree* t)  {
    return vf.tree.has_childs (t);
}

void
remove_child (Tree) (Tree* t, Tree* c) {
    (cast (vf.tree.Tree*) t).remove_child (cast (vf.tree.Tree*) c);
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
WalkTree (Tree) (Tree* t) {
    return vf.tree.WalkTree (t,&skip_hidden!Tree);
}

bool 
skip_hidden (Tree) (Tree* t) {
    return t.hidden;
}

auto 
FindDeepest (Tree,Cond) (Tree* t, Cond cond) {
    return vf.tree.FindDeepest (t,&skip_hidden!Tree,cond);
}

auto 
WalkLeft (Tree) (Tree* t) {
    return vf.tree.WalkLeft (t, &skip_hidden!Tree);
}

auto 
WalkChilds (Tree) (Tree* t) {
    return vf.tree.WalkChilds (t, &skip_hidden!Tree);
}

auto 
WalkChildsReverse (Tree) (Tree* t) {
    return vf.tree.WalkChildsReverse (t, &skip_hidden!Tree);
}

void
dump_tree (E* root) {
    vf.tree.dump_tree (root);
}
