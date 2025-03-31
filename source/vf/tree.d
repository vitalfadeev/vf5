module vf.tree;

struct
Tree {
    Tree* l;
    Tree* r;
    struct 
    Childs {
        Tree* l;
        Tree* r;
    };
    Childs _childs;
    Tree*  parent;

    mixin tree_functions;
}

mixin template 
tree_functions () {
    void
    add_child (Tree* c) {
        auto t = &this;
        auto tr = t._childs.r;
        if (tr is null) {
            t._childs.r = c;
            t._childs.l = c;
        }
        else {
            c.l = tr;
            tr.r = c;
            t._childs.r = c;
        }
        c.parent = t;
    }

    void
    remove_child (Tree* c) {
        auto t = &this;

        auto l = c.l;
        auto r = c.r;

        if (l !is null)
            l.r = r;

        if (r !is null)
            r.l = l;

        if (t._childs.l is c)
            t._childs.l = r;

        if (t._childs.r is c)
            t._childs.r = l;

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

        cloned.l         = null;
        cloned.r         = null;
        cloned._childs.l = null;
        cloned._childs.r = null;
        cloned.parent    = null;

        // childs
        foreach (c; (&this).childs)
            cloned.add_child (c.dup);

        return cloned;
    }
}

bool
has_childs (TTree) (TTree* t) {
    return (cast (Tree*) t)._childs.l !is null;
}

// t.childs
// t.childs ~= a
// foreach (t; t.childs) ...
auto 
childs (TTree) (TTree* t) if (is(typeof(t._super) == Tree) || is(TTree == Tree)) {
    return _Childs!TTree (cast (Tree*) t);
}
struct
_Childs (TTree) {
    Tree* t;
    //alias t this;

    //auto ref l () {return t._childs.l; }
    //auto ref r () {return t._childs.r; }

    int
    opApply (int delegate (TTree* t) dg) {
        for (auto _t = this.t._childs.l; _t !is null; _t = _t.r)
            if (auto result = dg (cast (TTree*) _t))
                return result;

        return 0;
    }

    void 
    opOpAssign (string op: "~") (Tree* c) { 
        t.add_child (c);
    }

    void 
    opOpAssign (string op: "~") (TTree* c) { 
        t.add_child (cast (Tree*) c);
    }
}


// in depth
auto 
WalkTree (TTree,Skip) (TTree* t, Skip skip) {
    return _WalkTree!(TTree,Skip) (cast (Tree*) t,skip);
}

struct
_WalkTree (TTree,Skip) {
    Tree* t;
    Skip  skip;

    int
    opApply (int delegate (TTree* t) dg) {
        Tree*  next = t;
        Tree* _next = t;

        loop:
            if (skip (cast (TTree*) next)) {
                _next = next;
                goto go_right;
            }

            if (auto result = dg (cast (TTree*) next))
                return result;

            _next = next;

            go_down:   // v
                next = _next._childs.l;
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
WalkLeft (TTree,Skip) (TTree* t, Skip skip) {
    return _WalkLeft!(TTree,Skip) (cast (Tree*) t,skip);
}

struct
_WalkLeft (TTree,Skip) {
    Tree* t;
    Skip  skip;

    int
    opApply (int delegate (TTree* t) dg) {
        Tree*  next = t.l;

        loop:
            if (next is null)
                return 0;

            if (skip (cast (TTree*) next)) {
                goto go_left;
            }

            if (auto result = dg (cast (TTree*) next))
                return result;

            go_left: 
                next = next.l;
                goto loop;  // go_left

        return 0;
    }
}


// ito left
auto 
WalkChilds (TTree,Skip) (TTree* t, Skip skip) {
    return _WalkChilds!(TTree,Skip) (cast (Tree*) t,skip);
}

struct
_WalkChilds (TTree,Skip) {
    Tree* t;
    Skip  skip;

    int
    opApply (int delegate (TTree* t) dg) {
        Tree* next = t._childs.l;

        loop:
            if (next is null)
                return 0;

            if (skip (cast (TTree*) next)) {
                goto go_right;
            }

            if (auto result = dg (cast (TTree*) next))
                return result;

            go_right:  // >
                next = next.r;
                goto loop;  // go_right

        return 0;
    }

    int
    opApply (int delegate (TTree* pre, TTree* t) dg) {
        Tree* pre  = null;
        Tree* next = t._childs.l;

        loop:
            if (next is null)
                return 0;

            if (skip (cast (TTree*) next)) {
                goto go_right;
            }

            if (auto result = dg (cast (TTree*) pre, cast (TTree*) next))
                return result;

            go_right:  // >
                pre  = next;
                next = next.r;
                goto loop;  // go_right

        return 0;
    }
}


auto 
WalkChildsReverse (TTree,Skip) (TTree* t, Skip skip) {
    return _WalkChildsReverse!(TTree,Skip) (cast (Tree*) t,skip);
}

struct
_WalkChildsReverse (TTree,Skip) {
    Tree* t;
    Skip  skip;

    int
    opApply (int delegate (TTree* t) dg) {
        Tree* prev = t._childs.r;

        loop:
            if (prev is null)
                return 0;

            if (skip (cast (TTree*) prev)) {
                goto go_left;
            }

            if (auto result = dg (cast (TTree*) prev))
                return result;

            go_left:  // >
                prev = prev.l;
                goto loop;  // go_right

        return 0;
    }
    
}


//
auto 
WalkInDeep (TTree,Skip,Cond) (TTree* t, Skip skip, Cond cond) {
    return _WalkInDeep!(TTree,Skip,Cond) (cast (Tree*) t,skip,cond);
}

struct
_WalkInDeep (TTree,Skip,Cond) {
    Tree* t;
    Skip  skip;
    Cond  cond;

    int
    opApply (int delegate (TTree* t) dg) {
        Tree*  next = t;
        Tree* _next = next;

        loop:
            if (skip (cast (TTree*) next)) {
                _next = next;
                goto go_right;
            }

            if (cond (cast (TTree*) next)) {
                if (auto result = dg (cast (TTree*) next))
                    return result;

                _next = next;
                goto go_down;
            }
            else {
                _next = next;
                goto go_right;
            }

            go_down:   // v
                next = _next._childs.l;
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
        for (auto t = this.l; t !is null; t = t.r)
            if (auto result = dg (t))
                return result;                

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
        writeln (*t);

    // recursive
    foreach (_t; t.childs) {
        dump_tree!Tree (cast (Tree*) _t, level+1);
    }
}
