module field;

import tstring;


struct
Field {
    string    name;
    TString[] values;

    //enum 
    //ID : ubyte {
    //    none,
    //    pos_x,
    //    pos_y,
    //}

    Field*
    dup () {
        auto cloned = new Field ();

        cloned.name   = this.name;
        cloned.values = this.values.dup;

        return cloned;
    }
}

