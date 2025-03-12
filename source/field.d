module field;

import tstring;


struct
Field {
    string    name;
    TString[] values;
    Field*[]  fields;

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

//void
//add_child (Field* field, Field* child_field) {
//    field.fields ~= child_field;
//}

