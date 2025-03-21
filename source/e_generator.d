module e_generator;

import std.stdio : writeln;
import std.conv : to;
import etree;
import e;
import e_update : apply_klass;
import e_update : apply_template;
import e_update : TemplateArg;
import e_update : force_e_update;
import e_update : dump_sizes;
import klass;
import generators.cmd   : CmdGenerator;
import generators.fs    : FsGenerator;
import generators.klass : KlassGenerator;

// generator
// template
//
// generator x template -> e
//   a b c       e name
//             name (A)
//               text = A 

alias GENERATE_DG = int delegate (string[] line);


struct
Generator {            // is part of E
    Type       type;      
    union {
        NoneGenerator  none;   // 
        CmdGenerator   cmd;    // cmd `command` delimiter | skip 1
        FsGenerator    fs;     // list dir -> files, list file -> content: csv, image, dbf
                               // url
        KlassGenerator klass;  // klass name fields NAME
    }
    string     _template;
    string[]    fields;    // ICON,NUMBER,TITLE,TEXT

    enum 
    Type {
        none,
        cmd,
        fs,
        klass,
    }

    auto ref
    offset () {
        final
        switch (type) {
            case Type.none  : return none .offset;
            case Type.cmd   : return cmd  .offset;
            case Type.fs    : return fs   .offset;
            case Type.klass : return klass.offset;
        }
    }

    auto ref
    limit () {
        final
        switch (type) {
            case Type.none  : return none .limit;
            case Type.cmd   : return cmd  .limit;
            case Type.fs    : return fs   .limit;
            case Type.klass : return klass.limit;
        }
    }

    auto ref
    total () {
        final
        switch (type) {
            case Type.none  : return none .total;
            case Type.cmd   : return cmd  .total;
            case Type.fs    : return fs   .total;
            case Type.klass : return klass.total;
        }
    }

    int
    opApply (GENERATE_DG dg) {
        final
        switch (type) {
            case Type.none  : return 0;
            case Type.cmd   : return cmd  .opApply (dg);
            case Type.fs    : return fs   .opApply (dg);
            case Type.klass : return klass.opApply (dg);
        }
    }

    string
    toString () {
        final
        switch (type) {
            case Type.none  : return "Generator ("~ type.to!string ~")";
            case Type.cmd   : return "Generator ("~ type.to!string ~ "," ~ cmd.to!string ~")";
            case Type.fs    : return "Generator ("~ type.to!string ~")";
            case Type.klass : return "Generator ("~ type.to!string ~")";
        }
    }
}

void
gen_tree (E* e, Klass* template_klass) {
    auto generator = &e.generator;
    auto fields    = e.generator.fields;

    // template
    //   kls.args      = [TEXT]
    //   template_args = [abc,def]
    
    foreach (line; *generator) {
        TemplateArg[] template_args;

        foreach (i,field; fields) {
            if (i < line.length)
                template_args ~= TemplateArg (field,line[i]);
            else
                break;
        }

        apply_template (e,template_klass,template_args);

        //foreach (_e; WalkChildsReverse (e)) {
        //    //force_e_update (_e);
        //    dump_sizes (_e);

        //    if (_e.pos.y + _e.size.h > e.pos.y + e.size.h)
        //        return;

        //    break;
        //}
    }

    //force_e_update (e);
    //import e_update : update_pos_fix;
    //update_pos_fix (e);
}


void
_go () {
    E*        dst = new E ();
    Klass*    template_klass;

    gen_tree (dst,template_klass);
}


struct
NoneGenerator {
    size_t offset;
    size_t limit;
    size_t total;
}
