import widget : WIDGET_SET_FN;
import widget : WIDGET_EVENT_FN;
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
    string   name;
    KlassE[] klasse;

    WIDGET_SET_FN   widget_set_fn;
    WIDGET_EVENT_FN widget_event_fn;

    bool
    find (string s, ref string[] values) {
        foreach (ke; klasse)
            if (ke.id == s) {
                values = ke.values;
                return true;
            }

        return false;
    }
}

struct
KlassE {
    string   id;
    string[] values;

    //enum 
    //ID : ubyte {
    //    none,
    //    pos_x,
    //    pos_y,
    //}
}
