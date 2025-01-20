module vf.tree;


struct
Tree (E) {
    E* e;
    Tree* l;
    Tree* r;
    struct 
    Childs {
        Tree* l;
        Tree* r;
        mixin childs_op_apply;
    };
    Childs childs;
    Tree* parent;
    ubyte indent;

    mixin tree_functions;
}

mixin template 
tree_functions () {
    void
    add_child (Tree* c) {
        alias t = this;
        auto tr = t.childs.r;
        if (tr is null) {
            t.childs.r = c;
            t.childs.l = c;
        }
        else {
            c.l = tr;
            tr.r = c;
            t.childs.r = c;
        }
        c.parent = &t;
    }
}

// in depth
auto 
WalkTree (Tree,Skip) (Tree* t, Skip skip) {
    return _WalkTree!(Tree,Skip) (t,skip);
}

struct
_WalkTree (Tree,Skip) {
    Tree* t;
    Skip  skip;

    int
    opApply (int delegate (Tree* t) dg) {
        Tree*  next = t;
        Tree* _next = next;
        int    result;

        loop:
            if (skip (next)) {
                _next = next;
                goto go_right;
            }

            result = dg (next);
            if (result)
                return result;

            _next = next;

            go_down:   // v
                next = _next.childs.l;
                if (next !is null)
                    goto loop;  // go_down
            go_right:  // >
                next = _next.r;
                if (next !is null)
                    goto loop;  // go_down
            go_up:     // ^
                next = _next.parent;
                if (next !is null) {
                    _next = next;
                    goto go_right;
                }

        return 0;
    }
}


//
auto 
FindDeepest (Tree,Skip,Cond) (Tree* t, Skip skip, Cond cond) {
    return _FindDeepest!(Tree,Skip,Cond) (t,skip,cond);
}

struct
_FindDeepest (Tree,Skip,Cond) {
    Tree* t;
    Skip  skip;
    Cond  cond;

    int
    opApply (int delegate (Tree* t) dg) {
        Tree*  next = t;
        Tree* _next = next;
        int    result;

        loop:
            if (skip (next)) {
                _next = next;
                goto go_right;
            }

            if (cond (next)) {
                result = dg (next);
                if (result)
                    return result;
            }

            _next = next;

            go_down:   // v
                next = _next.childs.l;
                if (next !is null)
                    goto loop;  // go_down
            go_right:  // >
                next = _next.r;
                if (next !is null)
                    goto loop;  // go_down
                else
                    return 0;   // exit
            go_up:     // ^
                next = _next.parent;
                if (next !is null) {
                    _next = next;
                    goto go_right;
                }

        return 0;
    }
}


mixin template
childs_op_apply () {
    int
    opApply (int delegate (Tree* t) dg) {
        for (auto t = this.l; t !is null; t = t.r) {
            int result = dg (t);
            if (result)
                return result;                
        }

        return 0;
    }
}


void
dump_tree (Tree) (Tree* t) {
    import std.stdio;

    for (auto i = t.indent; i > 0; i--) 
        write (" ");
    if (t.e is null)
        writeln (t, " ", t.indent, " ", t.e);
    else
        writeln (t, " ", t.indent, " ", t.e, " ", *t.e);

    // recursive
    foreach (subt; t.childs) {
        dump_tree!Tree (subt);
    }
}

void
dump_klasses (Klass) (Klass*[] klasses) {
    import std.stdio;

    foreach (kls; klasses) {
        writeln (kls.name);
        foreach (ke; kls.klasse) {
            writeln ("  ", ke);
        }
    }
}
