module e_update;

import std.conv;
import std.array : replicate;
import std.string;
import std.string : startsWith;
import std.string : fromStringz, toStringz; 
import std.algorithm.searching : canFind;
import std.algorithm.searching : countUntil;
import std.algorithm.searching : find;
import std.process : executeShell;
import std.stdio : writeln;
import std.stdio : writefln;
import std.stdio : write;
import std.range : back;
import std.range : empty;
import bindbc.sdl;
import etree;
import e;
import e_klass_draw : get_text_size;
import klass;
import field : Field;
import types;
import tstring;
import events;
import pix : open_font;
import pix : IMGException;
import pix : redraw_window;
import pix : send_e_redraw;
import pix : IMAGE_PTR;
//import pix : send_user_event;
import e_generator : Generator;
import std.traits : EnumMembers;


void
e_update_length_loc (E* e, E* pre, update_UserEvent* ev) {
    // size
    // step
    //   childs
    // balance, move
    //   move childs

    // size
    e_update_len (e,pre,ev);
    e_update_loc (e,pre,ev);
    e_update_childs (e,pre,ev);
    e_update_len_max (e,pre,ev);
}

//void
//e_update_loc (E* e, E* pre, update_UserEvent* ev) {
    //static
    //foreach (il; EnumMembers!IL)
    //    e_update_loc (e,pre,ev,il);
//}
void
e_update_loc (E* e, E* pre, update_UserEvent* ev) {
    // STAT
    //   to stat.loc
    // BALANCE
    // 1st e
    //   to 0
    // 2nd e
    //   step to way
    // Lst e
    //   update group
    //     calc group length
    //     calc group offset
    //     each e to e.loc + offset
    // BALANCE GROUP
    // 1st group e
    //   to 0
    // 2nd group e
    //   step to way
    // Lst group e
    //   update group
    //     calc group length
    //     calc group offset
    //     update each e loc to + offset

    static
    foreach (il; EnumMembers!IL)
        e.loc = e.def_loc.s[il].of (
            (ev.path.empty) ?               // is root ?
                ev.window.len[il] :         //   window
                ev.path.back.inner.len[il]  //   pare
        );

    if ((pre is null) || (e.def_loc != pre.def_loc))  // fst_in_group
        e.loc = e.loc.init;
    else
        e_update_loc_way (e,pre,ev);
    
    version (debug_update)
    writefln ("%s way: %s, pos: %s, size: %s, e: %s", replicate(" ", deep*2), e.way, e.pos, e.size, *e);
}

void
e_update_loc_way (E* e, E* pre, update_UserEvent* ev) {
    // reset loc if group != prev.group
    auto limit = 
        (ev.path.empty) ?
            ev.window.len :
            ev.path.back.outer.limit;

    e.loc = _e_update_loc_way (pre.loc,pre.len,limit,e.way);
}

Loc
_e_update_loc_way (Loc pre_loc, Len pre_len, Loc limit, Way way) {
    auto loc = pre_loc;

    auto _s0 = way.s[0];
    auto il1          = _s0.v;
    auto way_length_1 = _s0.l;

    auto _s1 = way.s[1];
    auto il2          = _s1.v;
    auto way_length_2 = _s1.l;

    if (way_length_1 != 0) {
        // step x
        loc[il1] += pre_length[il1];

        // check xy limits
        if (loc[il1] <= limit[il1]) {  // OK
            //
        }
        else {  // reset x, step y
            if (way_length_2 != 0) {
                loc[il1]  = loc[il1].init;
                loc[il2] += way_length_2;
            } 
            else {
                // stay at last x,y
            }
        }
    }

    return loc;
}


void
e_update_childs (E* e, E* pre, update_UserEvent* ev) {
    // recursive
    if (e.has_childs) {
        ev.path ~= e;
        ev.locs ~= 
            ev.locs.back
            + e.margin.loc
            + e.border.loc
            + e.padding.loc
            + e.core.loc;

        foreach (_e; WalkChilds (e)) {
            // ... (_e,ev);
        }

        ev.locs.length--;
        ev.path.length--;
    }


////
    if (e.has_childs) {
        // go to the next e
        e_update_length_loc__go_to_the_next_e (e,pre,ev); // using ev.path. try dn, try right, try up
    }
}

void
e_update_length_loc__go_to_the_next_e (E* e, E* pre, update_UserEvent* ev) {
    // try dn
    if (e.has_childs) {
        ev.path ~= e;
        ev.locs ~= 
            ev.locs.back
            + e.margin.loc
            + e.border.loc
            + e.padding.loc
            + e.core.loc;

        foreach (_e; WalkChilds (e)) {
            // ... (_e,ev);
        }

        ev.locs.length--;
        ev.path.length--;
    }


////
    if (e.has_childs) {
        auto next = &e.core.childs[0];
        ev.path ~= e;
        // ... next
        ev.path.popBack ();
        return;
    }

    // try right
    {
        auto pra = ev.path.back;
        foreach (next; pra.core.childs.s.find (e)) {
            // ... next
        }
        return;
    }

    // try up
    {
        ev.path.popBack ();
    }
}

void
e_update_len_max (E* e, E* pre, update_UserEvent* ev) {
    // childs size
    Len    len;
    size_t cnt;

    foreach (_e; WalkChilds (e)) {
        static
        foreach (il; EnumMembers!IL) {
            childs_len[il] += _e.len[il];

            if (_e.def_len.s[il].max)
                cnt++;
        }
    }

    auto able = (e.inner.len - childs_len);
    auto one  = able / cnt;

    // update len
    foreach (_e; WalkChilds (e)) {
        static
        foreach (il; EnumMembers!IL)
            if (_e.def_len.s[il].max)
                _e.len[il] = one[il];
    }
}

void
e_update_len (E* e, E* pre, update_UserEvent* ev) {
    static
    foreach (il; EnumMembers!IL)
        e_update_len (e,pre,ev,il);
}

void
e_update_len (E* e, E* pre, update_UserEvent* ev, IL il) {
    // by pare
    // by core
    if (e.def_len.s[il].bycore == 0)  // by pare
        e_update_len_bypare (e,pre,ev,il);
    else
        e_update_len_bycore (e,pre,ev,il);
}

void
e_update_len_bypare (E* e, E* pre, update_UserEvent* ev, IL il) {
    if (e.def_len.s[il].max) { // max len of able
        e.len[il] = 0;
        // after all pare.childs
        //    sum total len 
        //    able len = pare len - total len 
        //    count max e
        //    able len / count max e
        //    each max e 
        //      len = able len / count max e
    }
    else {
        e.len[il] = 
            e.def_len.s[il].lc.of (
                (ev.path.empty) ?               // is root ?
                    ev.window.len[il] :         //   window
                    ev.path.back.inner.len[il]  //   pare
            );
    }
}

void
e_update_len_bycore (E* e, E* pre, update_UserEvent* ev, IL il) {
    e.core.update_len ();
    e.len[il] = e.def_len.s[il].lc.of (e.core.len[il]);
}

//
void
remove_class_from_all (E* e, string s) {
    Klass* kls = e.find_klass (s);
    if (kls !is null)
        foreach (e; WalkTree (e))
            remove_klass (e, kls);
}

void
apply_e_klasses (E* e) {
    // set . each e klass
    foreach (kls; e.klasses)
        apply_klass (e,kls);

    //write (format!"%-60s " (e.toString)); time_step ("",0);
}

struct
TemplateArg {
    string name;
    string value;
}

void
apply_klass (E* e, Klass* kls, TemplateArg[] template_args=null) { 
    if (template_args is null)
    if (e.template_args)
        template_args = e.template_args;

    // each field
    // each sub tree
    foreach (field; WalkFields (kls)) {
        switch (field.name) {
            case "e"      : add_sub_tree (e,field,kls,kls,template_args); break; // add e
            case "switch" : set_switch   (e,field,kls,kls,template_args); break; // set field
            default       : set_field    (e,field,kls,kls,template_args); break; // set field
        }
    }
}

void
apply_template (E* e, Klass* kls, TemplateArg[] template_args) { 
    apply_klass (e,kls,template_args);
}

void
apply_e_fields (E* e, Klass* from_klass, Klass* from_template) {
    foreach (field; e.fields)
        set_field (e,field,from_klass,from_template,);
}

void
set_field (E* e, Field* field, Klass* from_klass, Klass* from_template, TemplateArg[] template_args=null) {
    // `command` -> exec command -> output
    auto values = extract_quoted (e,field.values);

    // TEXT -> abc
    if (template_args !is null ) {
        values = extract_template_args (e,values,template_args);
    }

    // klasses set
    foreach (kls; e.klasses)
        kls.set (e,field.name,values);
}


TString[]
extract_template_args (E* e, TString[] values, TemplateArg[] template_args) {
    TString[] vs;
    TString   new_v;
    vs.reserve (values.length);

    foreach (v; values) 
        if (v.type == TString.Type.string) {
            new_v = v;
            foreach (targ; template_args) {
                if (targ.name == v.s) {
                    new_v.s = targ.value;
                    break;
                }
            }
            vs ~= new_v;
        }
        else
            vs ~= v;

    return vs;
}

void
add_sub_tree (E* e, Field* field, Klass* from_klass, Klass* from_template, TemplateArg[] template_args) {
    // clone each t
    // add in e
    auto _e = e.new_child_e (field.values);
    _e.from_klass    = from_klass;
    _e.from_template = from_template;
    _e.template_args = template_args;
    e.childs ~= _e;
    set_klasses_for_new_e (_e,field.values);

    // recursive
    foreach (_field; WalkFields (field)) {
        switch (_field.name) {
            case "e"      : add_sub_tree (_e,_field,from_klass,from_template,template_args); break; // add e
            case "switch" : set_switch   (_e,_field,from_klass,from_template,template_args); break; // set field
            default       : set_field    (_e,_field,from_klass,from_template,template_args); break; // set field
        }
    }
}

void
set_switch (E* e, Field* field, Klass* from_klass, Klass* from_template, TemplateArg[] template_args) {
    auto evaluated = evaluate_switch_cond (e,field.values);

    // switch value
    //   case value1
    //     field values
    //   case value2
    //     field values

    // each child case
    if (evaluated.length >= 1)
    foreach (_field; WalkFields (field)) {
        if (_field.name == evaluated[0].s) {
            set_case (e,_field,from_klass,from_template,template_args);
            return;
        }
    }

    // default
    foreach (_field; WalkFields (field)) {
        if (_field.name == "default") {
            set_case (e,_field,from_klass,from_template,template_args);
            return;
        }
    }
}

void
set_case (E* e, Field* field, Klass* from_klass, Klass* from_template, TemplateArg[] template_args) {
    apply_case (e,field,from_klass,from_template,template_args);
}

void
apply_case (E* e, Field* field, Klass* from_klass, Klass* from_template, TemplateArg[] template_args) {
    // each field
    // each sub tree
    foreach (field; WalkFields (field)) {
        switch (field.name) {
            case "e"      : add_sub_tree (e,field,from_klass,from_template,template_args); break; // add e
            case "switch" : set_switch   (e,field,from_klass,from_template,template_args); break; // set field
            default       : set_field    (e,field,from_klass,from_template,template_args); break; // set field
        }
    }
}


auto
new_child_e (E* e, TString[] values) {
    // sub e
    // find parent e  in tree  from last e
    //   create sub e
    //   add classes

    auto _e = etree.new_e ();

    return _e;
}

void
set_klasses_for_new_e (E* e, Klasses* klasses, TString[] values) {
    e.add_klass (klasses ["e"]);

    // klasses
    foreach (ts; values)
        switch (ts.type) {
            case TString.Type.name   : 
            case TString.Type.string : 
                e.add_klass (klasss,ts.s);
                break;
            default:
        }    
}


void
klass_name_with_args_to_klass_name_and_args (string klass_name, ref string name, ref string args) {
    // klass_name!(TEXT) -> klass_name (TEXT)
    auto splitter_pos = klass_name.indexOf ('!');
    if (splitter_pos != -1) {
        name = klass_name[0..splitter_pos];
        args = klass_name[splitter_pos+1..$];
        // (TEXT) -> TEXT
        if (args.length && args[0] == '(')
            args = args[1..$];
        if (args.length && args[$-1] == ')')
            args = args[0..$-1];
    }
    else {
        name = klass_name;
        args = "";
    }
}


auto
evaluate_switch_cond (E* e, TString[] cond) {
    // 'shell_command.sh -with -args'
    // "double-quoted string"
    // klass.field
    // strings a b c
    return extract_quoted (e,cond);
}


E*
clone_tree (E* e) {
    E* cloned;

    //final
    //switch (t.type) {
    //    case Uni.Type.doc     : cloned = new UTree (Uni (t.doc.clone  )); break;
    //    case Uni.Type.e       : cloned = new UTree (Uni (e.clone    )); break;
    //    case Uni.Type.klass   : cloned = new UTree (Uni (t.klass.clone)); break;
    //    case Uni.Type.field   : cloned = new UTree (Uni (t.field.clone)); break;
    //    case Uni.Type.switch_ : cloned = new UTree (Uni (t.switch_.clone)); break;
    //    case Uni.Type.case_   : cloned = new UTree (Uni (t.case_.clone)); break;
    //}

    return cloned;
}


TString[]
extract_quoted (E* e, TString[] values) {
    TString[] vs;
    vs.reserve (values.length);
    foreach (v; values) 
        if (v.type == TString.Type.bquoted) 
            vs ~= TString (TString.Type.string, extract_value (e,v.s));
        else
            vs ~= v;

    return vs;
}


alias FONTPTR = TTF_Font*;
static
FONTPTR[string] global_fonts;
static
FONTPTR default_ptr;

void
load_e_font (E* e) {
    auto default_file = DEFAULT_FONT_FILE;
    auto default_size = DEFAULT_FONT_SIZE;
    if (default_ptr is null)
        default_ptr  = open_font (default_file,default_size);

    if (e.content.text.s.length) {
        string  font_file = e.content.text.font.file;
        ubyte   font_size = e.content.text.font.size;
        FONTPTR font_ptr  = e.content.text.font.ptr;
        FONTPTR* _ptr = font_file in global_fonts;

        if (font_file.length >= 1) {
            if (_ptr is null || font_ptr != *_ptr) {
                auto ptr = open_font (font_file,font_size);
                if (ptr is null)
                    throw new Exception ("open_font");

                global_fonts[font_file] = ptr;
                e.content.text.font.ptr = ptr;
            }
        }
    }    

    if (e.content.text.s.length) {
        if (e.content.text.font.file.length)
            e.content.text.font.ptr = global_fonts[e.content.text.font.file];
        else
            e.content.text.font.ptr = default_ptr;
    }
}

void
load_e_colors (E* e) {
    // after load all classes, because able color 'class.field'
}

void
load_e_childs (E* e) {
    final
    switch (e.generator.type) {
        case Generator.Type.none  : break;
        case Generator.Type.cmd   : load_childs_cmd (e); break;
        case Generator.Type.fs    : load_childs_fs (e); break;
        case Generator.Type.klass : load_childs_klass (e); break;
    }
}

void
load_childs_cmd (E* e) {
    writeln ("load_hilds_cmd");
    import e_generator;

    assert (e.generator._template.length > 0);
    Klass* template_klass = find_klass (e,e.generator._template);  // template
    assert (template_klass !is null);

    e.generator.cmd._command = extract_class_field_value (e,e.generator.cmd.command.s);

    gen_tree (e,template_klass);
}

void
load_childs_fs (E* e) {
    import e_generator;

    assert (e.generator._template.length > 0);
    Klass* template_klass = find_klass (e,e.generator._template);  // template
    assert (template_klass !is null);

    gen_tree (e,template_klass);
}

void
load_childs_klass (E* e) {
    import e_generator;

    assert (e.generator._template.length > 0);
    Klass* template_klass = find_klass (e,e.generator._template);  // template
    assert (template_klass !is null);

    assert (e.generator.klass.klass.type == TString.Type.string);
    auto klass = e.generator.klass.klass.s;
    assert (klass.length > 0);
    e.generator.klass._klass = find_klass (e,klass);
    if (e.generator.klass._klass is null)
        return;

    gen_tree (e,template_klass);
}

static
IMAGE_PTR[string] global_images;

void
load_e_image (E* e) {
    string img_file = e.content.image.src;
    IMAGE_PTR* ptr = img_file in global_images;

    if (ptr is null || e.content.image.ptr != *ptr) {
        IMAGE_PTR img_surface;
        if (ptr is null) {
            img_surface = IMG_Load (img_file.toStringz);
            if (img_surface is null)
                throw new IMGException ("IMG_Load");
            global_images[img_file] = img_surface;
        }
        else {
            img_surface = *ptr;
        }

        e.content.image.ptr = img_surface;
        e.content.image.size = Loc (
                cast(ushort)img_surface.w,
                cast(ushort)img_surface.h
            );
    }
}

void
load_e_text (E* e) {
    e.content.text.rects.length = 0;
    e.content.text.rects.reserve (e.content.text.s.length);

    int w, h, max_h;
    X _x = 0;
    Y _y = 0;

    foreach (dchar c; e.content.text.s) {
        auto ret = TTF_SizeUTF8 (e.content.text.font.ptr, c.to!string.toStringz, &w, &h);

        e.content.text.rects ~= E.Content.Text.TextRect (
            Loc (_x,_y), 
            Loc (w.to!W,h.to!H)
        );

        _x += w;
        max_h = max (max_h,h);
    }

    e.content.text.size.w = _x;
    e.content.text.size.h = max_h.to!H;
}

void
dump_sizes (E* e) {
    dump_size (e); // recursive
}
void
dump_size (E* e, int level=0) {
    for (auto i=0; i<level; i++) write ("  ");
    writeln (*e);

    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  pos_type            : ", e.pos_type_x, " ", e.pos_type_y);
    writeln ("  loc                 : ", e.pos);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  size                : ", e.size);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  content.size        : ", e.content.size);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  size_w_type         : ", e.size_w_type);
    for (auto i=0; i<level; i++) write ("  ");
    writeln ("  content.size_w_type : ", e.content.size_w_type);

    // recursive
    foreach (_e; WalkChilds (e))
        dump_size (_e,level+1);
}


//
void
go_on_event (E* e, string user_event_name, string[string] env=null) {
    foreach (_on; e.on)
        if (_on.event == user_event_name) // start, click
            exec_action (e,_on.action, env);
}

void
go_event_action (E* e, TString[] action, string[string] env=null) {
    exec_action (e,action,env);
}

void
exec_action (E* e, TString[] action, string[string] env=null) {
    import std.process;
    
    if (action.length) {
        writeln ("action: ", action);
        TString[] cmd = doc_get_klass_field_value (e,action[0].s);
        if (cmd.length)
            goto exec;
        else
            cmd = action;
        
        //
    exec:
        if (cmd.length) {
            //
            string[] s_cmd;
            foreach (s; cmd)
                if (s.type == TString.Type.string)
                    s_cmd ~= s.s;
            // raw exec
            writeln ("  exec: ", s_cmd, " ", env);
            if (env !is null) 
                auto pid = spawnProcess (s_cmd,env);
            else
                auto pid = spawnProcess (s_cmd);
        }    
    }
}

TString[] 
doc_get_klass_field_value (E* e, string s) {
    auto dot = s.indexOf ('.');
    if (dot != -1) {
        // class field
        auto klass_name  = s[0..dot];
        auto klass_field = s[dot+1..$];

        auto kls_t = e.find_klass (klass_name);
        if (kls_t !is null) {
            auto fret = find_field (kls_t, klass_field);
            if (fret)
                return fret.values;// OK
        }
    }

    return [];
}

string
extract_value (E* e, string bquoted) {
    auto stripped  = bquoted.strip ("`");
    auto converted = extract_class_field_value (e,stripped);
    auto ret = executeShell (converted);  // (int status, string output)

   return ret.output.stripRight ();
}


string
extract_class_field_value (E* e, string s) {
    TString[] cmd = doc_get_klass_field_value (e,s);
    if (cmd.length)
        return cmd.join (" ");
    else
        return s;
}


//
void
force_e_update (E* e) {
    update_UserEvent ev;
    ev.e = e;
    e.update (&ev);
    e_update_size_pos (e);
}

//void
//send_e_update (E* e) {
//    send_user_event!update_UserEvent (e);
//}


void
time_step (string file_name=__FILE__, size_t line=__LINE__) {
    import core.time;
    static MonoTime last_time;
    auto cur = MonoTime.currTime ();
    auto dur = cur - last_time;
    if (file_name.length != 0)
        writefln ("%16s: %s", file_name, dur);
    last_time = cur;
}

auto
max (A,B) (A a, B b) {
    if (a >= b)
        return a;
    else
        return b;
}

auto
min (A,B) (A a, B b) {
    if (a <= b)
        return a;
    else
        return b;
}

// klass + klass + klass
//   _klass   
//     defs
//       |
//       V
// e
//   fields
//
// Defs_Klass | Defs_E
