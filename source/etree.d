import e;
import vf.tree;
public import vf.tree : dump_tree,dump_klasses;

alias ETree = Tree!E;

auto 
WalkTree (Tree) (Tree* t) {
    return vf.tree.WalkTree (t, &skip_hidden);
}

bool 
skip_hidden (ETree* t) {
    return t.e !is null && t.e.hidden;
}

auto 
FindDeepest (Tree,Cond) (Tree* t, Cond cond) {
    return vf.tree.FindDeepest (t,&skip_hidden,cond);
}
