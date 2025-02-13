module field;

import tstring;


struct
Field {
    string   name;
    TString[] values;

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

