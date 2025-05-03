import std.stdio : writefln;
import std.conv : to;
import std.format;
import std.string : join;
import bindbc.sdl;
import tstring;
import etree;
import e : E;
import e_update : TemplateArg;
import field : Field;
import events : Event, update_UserEvent, draw_UserEvent;

alias KLASS_EVENT_FN  = void function (Klass* kls, Event* ev, E* e);
alias KLASS_UPDATE_FN = void function (Klass* kls, update_UserEvent* ev, E* e);
alias KLASS_SET_FN    = void function (Klass* kls, E* e, string field, TString[] values);
alias KLASS_DRAW_FN   = void function (Klass* kls, draw_UserEvent* ev, E* e);
alias KLASS_DUP_FN    = KlassPtr function (KlassPtr kls);
alias KlassPtr = Klass*;

// e green
// green
//   bg: green
// 
// KlassField.aid   = AID.bg
// KlassField.value = Value ("green")
//
// KlassField (AID.bg, "green")
// KlassField ("bg", "green")
// KlassField (bg, "green")
// KlassField (bg, "green")


struct
Klass {
    string   name;
    Klass*[] parent_klasses;
    Field*[] fields;
    string[] args;
    Fn       fn;

    //Field[] _fields; 
    //   = Field ("pos.y", [TString (TString.Type.string,"120")]);

    struct
    Fn {
        KLASS_EVENT_FN  event  = &.event;
        KLASS_UPDATE_FN update = &.update;
        KLASS_SET_FN    set    = &.set;
        KLASS_DRAW_FN   draw   = &.draw; // simple, bordered, bordered-titled, custom
        KLASS_DUP_FN    dup    = &._dup; // simple, bordered, bordered-titled, custom
    }

    void 
    event (Event* ev, E* e) { 
        if (fn.event !is null) fn.event (&this,ev,e); 
    }

    void 
    update (update_UserEvent* ev, E* e) { 
        if (fn.update !is null) fn.update (&this,ev,e); 
    }

    void 
    set (E* e, string field_id, TString[] values) {
        if (fn.set !is null) fn.set (&this,e,field_id,values); 
    }

    void 
    draw (draw_UserEvent* ev, E* e) {
        if (fn.draw !is null) fn.draw (&this,ev,e);
    }

    string
    toString () {
        if (args.length) 
            return format!"Klass (%s (%s))" (name, args.join);
        else
            return format!"Klass (%s)" (name);
    }
}


Field*
find_field (Klass* kls, string s) {
    foreach (field; WalkFields (kls))
        if (field.name == s)
            return field;

    return null;
}

Field*
add_field (Klass* kls, string name, string value) {
    auto field = new Field (name, [TString (TString.Type.string,value)]);
    kls.fields ~= field;
    return field;
}
Field*
add_field (Klass* kls, string name, int value) {
    return add_field (kls,name,value.to!string);
}


// KLASSES
static
Klasses reserved_klasses;

struct
Klasses {  // index of all klasses
    Klass*[] s;
    //alias s this;


    // find or create
    Klass*
    opIndex (string name) {
        return _find_klass_or_create (name);
    }

    void
    opOpAssign (string op : "~") (Klass* b) {
        s ~= b;
    }

    void
    opOpAssign (string op : "~") (Klasses b) {
        foreach (kls; b.s)
            s ~= kls;
    }

    Klass*
    _create_klass (string name) {
        Klass* kls = new Klass (name);
        s ~= kls;
        return kls;
    }

    Klass*
    _find_klass (string name) {
        // in e
        foreach (kls; s)
            if (kls.name == name)
                return kls;

        // in reserved
        //foreach (kls; reserved_klasses)
        //    if (kls.name == name)
        //        return kls;

        return null;
    }

    Klass*
    _find_klass_or_create (string name) {
        auto kls = _find_klass (name);
        if (kls is null)
            kls = _create_klass (name);
        return kls;
    }

    bool
    has (string name) {
        foreach (kls; s)
            if (kls.name == name)
                return true;

        return false;
    }

    bool
    has (Klass* kls) {
        foreach (_kls; s)
            if (_kls == kls)
                return true;

        return false;
    }

    void
    remove (Klass* kls) {
        import std.algorithm.searching : countUntil;
        import std.algorithm : remove;

        auto i = s.countUntil (kls);
        if (i != -1)
            s = s.remove (i);
    }

    void
    event (E* e, Event* ev) {
        foreach (kls; s)
            kls.event (ev,e);
    }

    void
    update (E* e, update_UserEvent* ev) {
        foreach (kls; s)
            kls.update (ev,e);
    }

    void
    dump () {
        foreach (kls; s)
            _dump_klass (kls);
    }

    void
    _dump_klass (Klass* kls) {
        writeln (*kls);
        foreach (fld; kls.fields) {
            writefln ("  %s", *fld);
            foreach (_fld; fld.fields) {
                writefln ("    %s", *_fld);
            }
        }
    }
}


// FN
void
event (Klass* kls, Event* ev, E* e) {
    //
}

void
update (Klass* kls, update_UserEvent* ev, E* e) {
    //
}

void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

void
draw (Klass* kls, draw_UserEvent* ev, E* e) {
    // auto renderer = ev.renderer;
}

KlassPtr
_dup (KlassPtr _this) {
    auto cloned = new Klass ();

    cloned.name           = _this.name;
    cloned.parent_klasses = _this.parent_klasses.dup;
    cloned.fn             = _this.fn;

    return cloned;
}
