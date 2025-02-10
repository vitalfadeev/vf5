module field;

struct
Field {
    string   name;
    string[] values;

    //enum 
    //ID : ubyte {
    //    none,
    //    pos_x,
    //    pos_y,
    //}

    Field*
    clone () {
        return new Field ();
    }
}

