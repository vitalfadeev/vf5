import bindbc.sdl;
import txt_token : Token;
import utree;
import doc : Doc;
import e : E;
import events : Event;

alias KLASS_EVENT_FN  = void function (UTree* kls_t, Event* ev, UTree* e_t);
alias KLASS_UPDATE_FN = void function (UTree* kls_t, UTree* doc_t, UTree* e_t);
alias KLASS_SET_FN    = void function (UTree* kls_t, UTree* doc_t, UTree* e_t, string field, string[] values);
alias KLASS_DRAW_FN   = void function (UTree* kls_t, SDL_Renderer* renderer, UTree* e_t);

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
    UTree*[] parent_klasses;

    KLASS_EVENT_FN  event  = &.event;
    KLASS_UPDATE_FN update = &.update;
    KLASS_SET_FN    set    = &.set;
    KLASS_DRAW_FN   draw   = &.draw; // simple, bordered, bordered-titled, custom
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
set (UTree* kls_t, UTree* doc_t, UTree* e_t, string field_id, string[] values) {
    //
}

void
draw (UTree* kls_t, SDL_Renderer* renderer, UTree* e_t) {
    //
}

