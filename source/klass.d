import bindbc.sdl;
import txt_token : Token;
import doc : Doc;
import etree : ETree;
import e : E;
import events : Event;

alias KLASS_EVENT_FN  = void function (Klass* kls, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer, ETree* t);
alias KLASS_UPDATE_FN = void function (Klass* kls, Doc* doc, ETree* t);
alias KLASS_SET_FN    = void function (Klass* kls, Doc* doc, ETree* t, string field, string[] values);
alias KLASS_DRAW_FN   = void function (Klass* kls, SDL_Renderer* renderer, ETree* t);

// e green
// green
//   bg: green
// 
// ClassE.aid   = AID.bg
// ClassE.value = Value ("green")
//
// ClassE (AID.bg, "green")
// ClassE ("bg", "green")
// ClassE (bg, "green")
// ClassE (bg, "green")


struct
Klass {
    string       name;
    KlassField[] fields;

    KLASS_EVENT_FN  event  = &.event;
    KLASS_UPDATE_FN update = &.update;
    KLASS_SET_FN    set    = &.set;
    KLASS_DRAW_FN   draw   = &.draw; // simple, bordered, bordered-titled, custom

    Token[][]    tree_tokens;

    bool
    find (string s, ref string[] values) {
        foreach (field; fields)
            if (field.id == s) {
                values = field.values;
                return true;
            }

        return false;
    }
}

struct
KlassField {
    string   id;
    string[] values;

    //enum 
    //ID : ubyte {
    //    none,
    //    pos_x,
    //    pos_y,
    //}
}

void
event (Klass* kls, Doc* doc, Event* ev, SDL_Window* window, SDL_Renderer* renderer, ETree* t) {
    //
}

void
update (Klass* kls, Doc* doc, ETree* t) {
    //
}

void 
set (Klass* kls, Doc* doc, ETree* t, string field_id, string[] values) {
    //
}

void
draw (Klass* kls, SDL_Renderer* renderer, ETree* t) {
    //
}
