import bindbc.sdl;
import tstring;
import etree;
import doc : Doc;
import e : E;
import field : Field;
import events : Event;
import std.conv : to;

alias KLASS_EVENT_FN  = void function (Klass* kls, Event* ev, ETree* t);
alias KLASS_UPDATE_FN = void function (Klass* kls, Doc* doc, ETree* t);
alias KLASS_SET_FN    = void function (Klass* kls, Doc* doc, ETree* t, string field, TString[] values);
alias KLASS_DRAW_FN   = void function (Klass* kls, SDL_Renderer* renderer, ETree* t);
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

    KLASS_EVENT_FN  event  = &.event;
    KLASS_UPDATE_FN update = &.update;
    KLASS_SET_FN    set    = &.set;
    KLASS_DRAW_FN   draw   = &.draw; // simple, bordered, bordered-titled, custom
    KLASS_DUP_FN    dup    = &._dup; // simple, bordered, bordered-titled, custom

    //void
    //add_child (Field* field) {
    //    //
    //}
    //void
    //add_child (Switch_* switch_) {
    //    //
    //}
    //void
    //add_child (E* e) {
    //    //
    //}

    string
    toString () {
        return "Klass ("~ name ~")";
    }
}

void
add_child (Klass* kls, Field* field) {
    kls.fields ~= field;
}

void
event (Klass* kls, Event* ev, ETree* t) {
    //
}

void
update (Klass* kls, Doc* doc, ETree* t) {
    //
}

void 
set (Klass* kls, Doc* doc, ETree* t, string field_id, TString[] values) {
    //
}

void
draw (Klass* kls, SDL_Renderer* renderer, ETree* t) {
    //
}

KlassPtr
_dup (KlassPtr _this) {
    auto cloned = new Klass ();

    cloned.name           = _this.name;
    cloned.parent_klasses = _this.parent_klasses.dup;
    cloned.event          = _this.event;
    cloned.update         = _this.update;
    cloned.set            = _this.set;
    cloned.draw           = _this.draw;

    return cloned;
}
