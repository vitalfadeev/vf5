module etree;

import std.conv;
import std   : indexOf;
import std   : replicate;
import tstring;
import e     : E;
import klass : Klass;
import field : Field;


auto 
has_childs (E* e)  {
    return  e.core.childs.s.length > 0;
}

void
remove_child (E* e, E* c) {
    auto i = e.childs.indexOf (c);
    if (i != -1) {
        e.childs.remove (i);
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
        foreach (_field; klass_or_field.fields)
            if (auto result = dg (_field))
                return result;

        return 0;
    }
}


alias Skip = bool function (E* e);
alias Cond = bool function (E* e);

auto 
WalkTree (E* e) {
    return _WalkTree (e,&skip_hidden);
}
auto 
WalkTree (E* e, ref Path path) {
    return _WalkTree (e,path,&skip_hidden);
}
struct
_WalkTree {
    E*   e;
    Path path;
    Skip skip;

    int
    opApply (int delegate (ref Path path, E* e) dg) {
        import std.range : popBack;

        if (skip (e))
            return 0;

        if (auto result = dg (path,e))
            return result;

        path ~= e;

        foreach (ref _e; e.childs) {
            foreach (ref path, __e; WalkTree (&_e,path)) {
                dg (path, __e);
            }
        }

        path.popBack ();

        return 0;
    }
}

struct
Path {
    E*[] path;
    alias path this;

    string
    toString () {
        string _s;
        foreach (e;s)
            _s ~= format!"%s," (*e);
        return format!"Path(%s)" (_s);
    }
}

bool 
skip_hidden (E* e) {
    return e.hidden;
}

auto 
WalkInDeep (E* e, Cond cond) {
    return _WalkInDeep (e,&skip_hidden);
}
auto 
WalkInDeep (E* e, Cond cond, ref Path path) {
    return _WalkInDeep (e,path,&skip_hidden,cond);
}
struct
_WalkInDeep {
    E*   e;
    Path path;
    Skip skip;
    Cond cond;

    int
    opApply (int delegate (ref Path path, E* e) dg) {
        import std.range : popBack;

        if (skip (e))
            return 0;

        if (cond (e))
            if (auto result = dg (path,e))
                return result;

        path ~= e;

        foreach (ref _e; e.childs) {
            foreach (ref path, __e; WalkTree (&_e,path)) {
                if (cond (__e))
                    dg (path, __e);
            }
        }

        path.popBack ();

        return 0;
    }
}

auto 
WalkLeft (E* e) {
    return _WalkLeft (e,&skip_hidden);
}
struct
_WalkLeft {
    E*   e;
    Path path; // not included e
    Skip skip;

    int
    opApply (int delegate (ref Path path, E* e) dg) {
        auto p = path[$-1];
        auto i = p.childs.indexOf (e);

        if (i != -1)
        foreach (ref _e; p.childs[i+1..$])
            if (!skip (_e))
                dg (path, _e);

        return 0;
    }
}

auto 
WalkChilds (E* e) {
    return _WalkChilds (e,&skip_hidden);
}
auto 
WalkChilds (E* e, ref Path path) {
    return _WalkChilds_w_Path (e,path,&skip_hidden);
}
struct
_WalkChilds {
    E*   e;
    Skip skip;

    int
    opApply (int delegate (E* e) dg) {
        foreach (ref _e; e.childs)
            if (!skip (_e))
                dg (_e);

        return 0;
    }
}
struct
_WalkChilds_w_Path {
    E*   e;
    Path path;
    Skip skip;

    int
    opApply (int delegate (ref Path path, E* e) dg) {
        foreach (ref _e; e.childs)
            if (!skip (_e))
                dg (path,_e);

        return 0;
    }
}

auto 
WalkChildsReverse (E* e) {
    return _WalkChildsReverse (e, &skip_hidden);
}
struct
_WalkChildsReverse {
    E*   e;
    Skip skip;

    int
    opApply (int delegate (E* e) dg) {
        foreach_reverse (ref _e; e.childs)
            if (!skip (_e))
                dg (_e);

        return 0;
    }
}

void
dump_tree (E* e, int deep=0) {
    writefln ("%s%s", replicate ("  ", deep), e);

    // recursive
    foreach (_e; e.childs)
        dump_tree (_e,deep+1);
}
