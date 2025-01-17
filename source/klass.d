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
