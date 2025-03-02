module vf.tree;


struct
Tree (E) {
    Tree* l;
    Tree* r;
    struct 
    Childs {
        Tree* l;
        Tree* r;
        mixin childs_op_apply;
    };
    Childs childs;
    Tree*  parent;
    E      e;

    this (E e) {
        this.e = e;
    }

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

    void
    remove_child (Tree* c) {
        alias t = this;

        auto l = c.l;
        auto r = c.r;

        if (l !is null)
            l.r = r;

        if (r !is null)
            r.l = l;

        if (t.childs.l is c)
            t.childs.l = r;

        if (t.childs.r is c)
            t.childs.r = l;

        c.parent = null;
        c.l = null;
        c.r = null;
    }

    typeof(this)*
    dup () {
        assert (0);
        // dup this
        //   dup childs
        auto cloned = new typeof(this) ();

        cloned.l        = null;
        cloned.r        = null;
        cloned.childs.l = null;
        cloned.childs.r = null;
        cloned.parent   = null;
        cloned.indent   = this.indent;
        cloned.uni      = this.uni;

        // childs
        foreach (c; this.childs)
            cloned.add_child (c.dup);

        return cloned;
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
        Tree* _next = t;
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


// ito left
auto 
WalkLeft (Tree,Skip) (Tree* t, Skip skip) {
    return _WalkLeft!(Tree,Skip) (t,skip);
}

struct
_WalkLeft (Tree,Skip) {
    Tree* t;
    Skip  skip;

    int
    opApply (int delegate (Tree* t) dg) {
        Tree*  next = t.l;
        int    result;

        loop:
            if (next is null)
                return 0;

            if (skip (next)) {
                goto go_left;
            }

            result = dg (next);
            if (result)
                return result;

            go_left: 
                next = next.l;
                goto loop;  // go_left

        return 0;
    }
}


// ito left
auto 
WalkChilds (Tree,Skip) (Tree* t, Skip skip) {
    return _WalkChilds!(Tree,Skip) (t,skip);
}

struct
_WalkChilds (Tree,Skip) {
    Tree* t;
    Skip  skip;

    int
    opApply (int delegate (Tree* t) dg) {
        Tree*  next = t.childs.l;
        int    result;

        loop:
            if (next is null)
                return 0;

            if (skip (next)) {
                goto go_right;
            }

            result = dg (next);
            if (result)
                return result;

            go_right:  // >
                next = next.r;
                goto loop;  // go_right

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

                _next = next;
                goto go_down;
            }
            else {
                _next = next;
                goto go_right;
            }

            go_down:   // v
                next = _next.childs.l;
                if (next !is null)
                    goto loop;  // go_down
                else
                    return 0;   // exit
            go_right:  // >
                next = _next.r;
                if (next !is null)
                    goto loop;  // go_down
                else
                    return 0;   // exit

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
dump_tree (Tree) (Tree* t, int level=0) {
    import std.stdio;

    for (auto i = level; i > 0; i--) 
        write ("  ");
    //if (t.uni is null)
    //    writeln ("null");
    //else
        writeln (t.uni);

    // recursive
    foreach (subt; t.childs) {
        dump_tree!Tree (subt, level+1);
    }
}
