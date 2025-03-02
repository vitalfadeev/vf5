import bindbc.sdl;
import tstring;
import utree;
import doc : Doc;
import e : E;
import events : Event;

alias KLASS_EVENT_FN  = void function (UTree* kls_t, Event* ev, UTree* e_t);
alias KLASS_UPDATE_FN = void function (UTree* kls_t, UTree* doc_t, UTree* e_t);
alias KLASS_SET_FN    = void function (UTree* kls_t, UTree* doc_t, UTree* e_t, string field, TString[] values);
alias KLASS_DRAW_FN   = void function (UTree* kls_t, SDL_Renderer* renderer, UTree* e_t);
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
    string     name;
    Klass*[]   parent_klasses;
    UniField[] fields;

    //Childs!Field  childs;
    //Childs!Switch childs;

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
}

struct
UniField {
    Type type;
    union {
        Field   field;
        Switch_ switch_;
        E       e;
    }

    enum
    Type {
        field,
        switch_,
        e,
    }

    this (Field f) {
        this.type  = Type.field;
        this.field = f;
    }

    this (Switch_ s) {
        this.type    = Type.switch_;
        this.switch_ = s;
    }

    this (E e) {
        this.type = Type.e;
        this.e    = e;
    }
}


struct
Switch_ {
    TString[] cond;

    Switch_*
    dup () {
        return new Switch_ ();
    }
}

struct
Case_ {
    string    name;
    TString[] values;

    Case_*
    dup () {
        return new Case_ ();
    }
}

void
add_child (Klass* kls, UniField* unifield) {
    kls.fields ~= unifield;
}


void
event (UTree* kls_t, Event* ev, UTree* e_t) {
    //
}

void
update (UTree* kls_t, UTree* doc_t, UTree* t) {
    //
}

void 
set (UTree* kls_t, UTree* doc_t, UTree* e_t, string field_id, TString[] values) {
    //
}

void
draw (UTree* kls_t, SDL_Renderer* renderer, UTree* e_t) {
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
