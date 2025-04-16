module txt_reader;

import std.stdio;
import std.conv;
import etree;
import e;
import e_update;
import klass;
import field;
import types;
import tstring;
import txt_token;

// RESERVED
// e
// import
// map

// RESERVED CLASSES
// e
// button
// button.pressed
// check
// check.pressed
// edit
// progress
//
// radio
// focused
// button-hover
// hotkeys
// colors
// commands

// `external program` -> os.execute (["external","program"], NO_WAIT)
// internal.command   -> send       ("internal.command")

// plugin
//  on player.prev ...

void 
go (E* root, Klasses* klasses, string s) {
    size_t    indent;
    string    name;
    string    args;
    TString[] values;
    Indent[]  indents;
    E*        e;
    Klass*    kls;
    Field*    field;
    bool      root_e_found;

    foreach (t_line; Token_line_reader (s)) {
        // indent, name, values
        indent        = 0;
        name.length   = 0;
        args.length   = 0;
        values.length = 0;
        foreach (ts; t_line) {
            switch (ts.type) {
                case TString.Type.indent  : indent = ts.s.length; break;
                case TString.Type.name    : name   = ts.s; break;
                case TString.Type.args    : args   = ts.s; break;
                case TString.Type.comment : continue;
                case TString.Type.none    : continue;
                case TString.Type.cr      : continue;
                default: values ~= ts;
            }
        }

        // e
        if (name == "e" && indent == 0) { 
            // reuse root
            // one e tree only
            if (root.klasses.length == 0) {
                root.set_klasses_for_new_e (values);
                root_e_found = true;
            }
            else {
                // ignore 2nd root tree
                // 1 e tree only
            }
            indents.length = 0;
            indents ~= Indent (root,indent,0);
        }

        // sub e
        else
        if (name == "e" && indent >= 1) { 
            auto _ind = indents.find_parent (indent);
            assert (_ind !is null);

            final
            switch (_ind.type) {
                case Indent.Type.klass  : 
                    field = new Field (name,values);
                    _ind.klass.fields ~= field;
                    indents ~= Indent (Indent.Type.klass_e,field,indent,_ind.deep+1);
                    break;
                case Indent.Type.field  : 
                    field = new Field (name,values);
                    _ind.field.fields ~= field;
                    indents ~= Indent (Indent.Type.field_e,field,indent,_ind.deep+1);
                    break;
                case Indent.Type.klass_e: 
                    field = new Field (name,values);
                    _ind.field.fields ~= field;
                    indents ~= Indent (Indent.Type.klass_e,field,indent,_ind.deep+1);
                    break;
                case Indent.Type.field_e: 
                    field = new Field (name,values);
                    _ind.field.fields ~= field;
                    indents ~= Indent (Indent.Type.field_e,field,indent,_ind.deep+1);
                    break;
                case Indent.Type.e      : 
                    e = new_child_e (e,values);
                    _ind.e.childs ~= e; 
                    set_klasses_for_new_e (e,values);
                    indents ~= Indent (e,indent,_ind.deep+1);
                    break;
            }
        }

        // klass
        else
        if (name != "e" && indent == 0) { 
            kls = new_klass (root,name,values,args);
            // added
            indents.length = 0;
            indents ~= Indent (kls,indent,0);
        }

        // field swicth case  e_fields
        else
        if (name != "e" && indent >= 1) {
              auto _ind = indents.find_parent (indent);
              assert (_ind !is null);

              field = new Field (name,values);
              
              final
              switch (_ind.type) {
                  case Indent.Type.klass   : _ind.klass.fields ~= field; break;
                  case Indent.Type.field   : _ind.field.fields ~= field; break;
                  case Indent.Type.e       : _ind.e    .fields ~= field; break;
                  case Indent.Type.klass_e : _ind.field.fields ~= field; break;
                  case Indent.Type.field_e : _ind.field.fields ~= field; break;
              }        
              indents ~= Indent (field,indent,_ind.deep+1);
        }
    }
}

struct
Indent {
    Type type;
    union {
        Klass* klass;
        Field* field;
        E*     e;
    } 
    size_t indent;
    Deep   deep;

    enum 
    Type {
        klass,
        field,
        e,
        klass_e,
        field_e,
    }

    this (Type type, E* e, size_t indent, Deep deep) {
        this.type   = type;
        this.e      = e;
        this.indent = indent;
        this.deep   = deep;
    }

    this (Type type, Field* field, size_t indent, Deep deep) {
        this.type   = type;
        this.field  = field;
        this.indent = indent;
        this.deep   = deep;
    }

    this (Klass* kls, size_t indent, Deep deep) {
        this.type   = Type.klass;
        this.klass  = kls;
        this.indent = indent;
        this.deep   = deep;
    }

    this (Field* field, size_t indent, Deep deep) {
        this.type   = Type.field;
        this.field  = field;
        this.indent = indent;
        this.deep   = deep;
    }

    this (E* e, size_t indent, Deep deep) {
        this.type   = Type.e;
        this.e      = e;
        this.indent = indent;
        this.deep   = deep;
    }

    string
    toString () {
        return "Indent ("~ type.to!string ~ "," ~ indent.to!string ~")";
    }
}


Indent*
find_parent (ref Indent[] indents, size_t for_indent) {
    while (indents.length != 0) {
        auto _ind = &indents[$-1];

        if (_ind.indent <  for_indent)
            return _ind;  // OK

        if (_ind.indent >= for_indent)
            indents.length --;
    }

    return null;
}

//auto
//new_e (E* root, TString[] values) {
//    return new_child_e (root,values);
//}


Klass*
new_klass (E* root, string name, TString[] values, string args) {
    auto kls = find_klass_or_create (root,name);

    // klass (args)
    if (args.length) {
        auto _args = args[1..$-1];  // strip ( )
        kls.args = [_args];
    }

    // setup parents
    //   values

    return kls;    
}
