import widget : WIDGET_SET_FN;
import widget : WIDGET_EVENT_FN;
import widget : WIDGET_DRAW_FN;
import widget : WIDGET_APPLY_KLASS_FN;
import txt_token : Token;
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

    WIDGET_SET_FN         widget_set_fn;
    WIDGET_EVENT_FN       widget_event_fn;
    WIDGET_DRAW_FN        widget_draw_fn; // simple, bordered, bordered-titled, custom
    WIDGET_APPLY_KLASS_FN widget_apply_klass_fn;

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
