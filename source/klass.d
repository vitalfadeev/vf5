import std.conv : to;
import std.format;
import std.string : join;
import bindbc.sdl;
import tstring;
import etree;
import e : E;
import e_update : TemplateArg;
import field : Field;
import events : Event;

alias KLASS_EVENT_FN  = void function (Klass* kls, Event* ev, E* e);
alias KLASS_UPDATE_FN = void function (Klass* kls, Event* ev, E* e);
alias KLASS_SET_FN    = void function (Klass* kls, E* e, string field, TString[] values);
alias KLASS_DRAW_FN   = void function (Klass* kls, Event* ev, E* e);
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
    TemplateArg[] template_args;

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
    update (Event* ev, E* e) { 
        if (fn.update !is null) fn.update (&this,ev,e); 
    }

    void 
    set (E* e, string field_id, TString[] values) {
        if (fn.set !is null) fn.set (&this,e,field_id,values); 
    }

    void 
    draw (Event* ev, E* e) {
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

void
event (Klass* kls, Event* ev, E* e) {
    //
}

void
update (Klass* kls, Event* ev, E* e) {
    //
}

void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

void
draw (Klass* kls, Event* ev, E* e) {
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
