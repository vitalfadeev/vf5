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
import pix : Window;
import pix : IMGException;
import pix : redraw_window;
import pix : send_e_redraw;
import pix : IMAGE_PTR;
import pix : send_user_event;
import e_generator : Generator;

const DEFAULT_WINDOW_W = 1024;
const DEFAULT_WINDOW_H = 480;
const DEFAULT_FONT_FILE = "/home/vf/src/vf5/img/PTSansCaption-Regular.ttf";
const DEFAULT_FONT_SIZE = 12;


struct
GCursor {  // child's sizes for pos
    _GCursor[MAX_GROUP+1] by_group;

    X start_x;  // is parent.content.x
    Y start_y;  // is parent.content.y
    W start_w;  // is parent.content.w
    H start_h;  // is parent.content.h

    struct
    _GCursor {
        X x;
        Y y;

        X start_x;  // is parent.content.x
        Y start_y;  // is parent.content.y
        W start_w;  // is parent.content.w
        H start_h;  // is parent.content.h

        W able_w;   // start_w
        H able_h;   // start_h

        W used_w;
        H used_h;

        W max_used_w;
        H max_used_h;

        W[E.SizeType.max+1]      w_by_type;
        H[E.SizeType.max+1]      h_by_type;
        size_t[E.SizeType.max+1] count_by_w_size_type;
        size_t[E.SizeType.max+1] count_by_h_size_type;

        E.Way    way; // < > ^ v
        PosGroup pos_group;
        //Deep     deep;
    }
}


void
e_update_size_pos (E* e, GCursor* big_gcursor, int deep=0) {
    assert (e.pos_group < MAX_GROUP);
    auto gcursor = &big_gcursor.by_group[e.pos_group];

    // <> ^ v
    final
    switch (e.way) {
        case E.Way.r  : e_update_size_pos_r (e,gcursor); break;
        case E.Way.rd : e_update_size_pos_r (e,gcursor); break;
        case E.Way.ru : break;
        case E.Way.l  : break;
        case E.Way.lu : break;
        case E.Way.ld : break;
        case E.Way.d  : e_update_size_pos_d (e,gcursor); break;
        case E.Way.dr : e_update_size_pos_d (e,gcursor); break;
        case E.Way.dl : break;
        case E.Way.u  : break;
        case E.Way.ur : break;
        case E.Way.ul : break;
        case E.Way._  : break;
    }
    version (debug_update)
    writefln ("%s way: %s, pos: %s, size: %s, e: %s", replicate(" ", deep*2), e.way, e.pos, e.size, *e);

    // recursive
    if (e.has_childs)
    if (e.size.w > 0)
    if (e.size.h > 0) { 
        auto _big_gcursor = new_gcursor (e);
        foreach (_e; WalkChilds (e))
            e_update_size_pos (_e,_big_gcursor,deep+1);

        // move groups
        //   fix pos  : center
        //   fix size : max
        e_update_size_pos_fix (e,_big_gcursor,deep);
    }
}

auto
new_gcursor (E* e) {
    auto gcursor = new GCursor ();

    auto start_x = e.content.pos.x;
    auto start_y = e.content.pos.y;
    auto start_w = e.content.size.w;
    auto start_h = e.content.size.h;

    gcursor.start_x = start_x;
    gcursor.start_y = start_y;
    gcursor.start_w = start_w;
    gcursor.start_w = start_h;

    foreach (ref _gcursor; gcursor.by_group) {
        _gcursor.able_w  = start_w;
        _gcursor.able_h  = start_h;
        _gcursor.start_x = start_x;
        _gcursor.start_y = start_y;
        _gcursor.start_w = start_w;
        _gcursor.start_h = start_h;
        _gcursor.x       = start_x;
        _gcursor.y       = start_y;
    }

    return gcursor;
}

void
e_update_size_pos_r (GCursor) (E* e, GCursor* gcursor) {
    auto used_w = gcursor.used_w;
    auto used_h = gcursor.used_h;
    auto able_w = gcursor.able_w;
    auto able_h = gcursor.able_h;

    auto x = gcursor.x;
    auto y = gcursor.y;

    auto next_x = x;
    auto next_y = y;

    //
    e_update_size (e);
    auto w = e.size.w;
    auto h = e.size.h;
    used_h = h;

    //
    if (w <= able_w) {  // OK
        used_w += w;
        able_w -= w;
        next_x  = x + w;
    }
    else {
        if (e.way == E.Way.rd) {
            x       = gcursor.start_x;
            y      += h;
            used_w  = 0;
            able_w  = gcursor.start_w;
            used_h += h;
            able_h -= h;
            next_x  = x + w;
            next_y  = y;
        } 
        else {
            // stay at last x,y
        }
    }

    //
    _e_update_pos (e,x,y);

    // update cursor. set next position
    gcursor.x          = next_x;
    gcursor.y          = next_y;
    gcursor.used_w     = used_w;
    gcursor.used_h     = used_h;
    gcursor.able_w     = able_w;
    gcursor.able_h     = able_h;
    gcursor.max_used_w = used_w > gcursor.max_used_w ? used_w : gcursor.max_used_w;
    gcursor.max_used_h = used_h > gcursor.max_used_h ? used_h : gcursor.max_used_h;

    //
    e_update_total_sizes (e,gcursor);
}

void
e_update_size_pos_d (GCursor) (E* e, GCursor* gcursor) {
    auto used_w = gcursor.used_w;
    auto used_h = gcursor.used_h;
    auto able_w = gcursor.able_w;
    auto able_h = gcursor.able_h;

    auto x = gcursor.x;
    auto y = gcursor.y;
    
    auto next_x = x;
    auto next_y = y;

    //
    e_update_size (e);
    auto w = e.size.w;
    auto h = e.size.h;
    used_w = w;

    //
    if (h <= able_h) {  // OK
        used_h += h;
        able_h -= h;
        next_y  = y + h;
    }
    else {
        if (e.way == E.Way.dr) {
            x      += w;
            y       = gcursor.start_y;
            used_h  = 0;
            able_h  = gcursor.start_h;
            used_w += w;
            able_w -= w;
            next_x  = x;
            next_y  = y + h;
        }
        else {
            // stay at last x,y
        }
    }

    //
    _e_update_pos (e,x,y);

    // update cursor. set next position
    gcursor.x          = next_x;
    gcursor.y          = next_y;
    gcursor.used_w     = used_w;
    gcursor.used_h     = used_h;
    gcursor.able_w     = able_w;
    gcursor.able_h     = able_h;
    gcursor.max_used_w = used_w > gcursor.max_used_w ? used_w : gcursor.max_used_w;
    gcursor.max_used_h = used_h > gcursor.max_used_h ? used_h : gcursor.max_used_h;

    //
    e_update_total_sizes (e,gcursor);
}

void
e_update_size_pos_fix (E* e, GCursor* big_gcursor, int deep) {
    X offset_x;
    Y offset_y;

    foreach (_e; WalkChilds (e)) {
        auto gcursor = &big_gcursor.by_group[_e.pos_group];
        bool changed;

        //
        // size max
        if (_e.size_w_type == E.SizeType.max_) {
            if (_e.way == E.Way.r) {
                auto max_cnt = gcursor.count_by_w_size_type[E.SizeType.max_];

                if (max_cnt > 0) {            
                    W one_max_w = 
                        (max_cnt > 0) ?
                            (gcursor.start_w - gcursor.max_used_w) / max_cnt:
                            0;

                    _e_update_size_w (
                        _e, 
                        one_max_w,
                        one_max_w - _e.aura.size.w - _e.aura.size.w
                    );
                    changed = true;
                }
            }
            else  // max_cnt ... full size ... = 1... way d
            if (_e.way == E.Way.d) {
                {
                    W one_max_w = (gcursor.start_w - all_non_max_w (e));

                    _e_update_size_w (
                        _e, 
                        one_max_w,
                        one_max_w - _e.aura.size.w - _e.aura.size.w
                    );
                    changed = true;
                }
            }
        }

        //
        // move groups
        //   pos t9 center, right
        switch (_e.pos_group) {
            case 1:
                offset_x = 0;
                offset_y = 0;
                break;
            case 2:
                offset_x = (gcursor.start_w - gcursor.max_used_w) / 2;
                offset_y = 0;
                break;
            case 3:
                offset_x = (gcursor.start_w - gcursor.max_used_w);
                offset_y = 0;
                break;
            case 4:
                offset_x = (gcursor.start_w - gcursor.max_used_w);
                offset_y = (gcursor.start_h - gcursor.max_used_h) / 2;
                break;
            case 5:
                offset_x = (gcursor.start_w - gcursor.max_used_w);
                offset_y = (gcursor.start_h - gcursor.max_used_h);
                break;
            case 6:
                offset_x = (gcursor.start_w - gcursor.max_used_w) / 2;
                offset_y = (gcursor.start_h - gcursor.max_used_h);
                break;
            case 7:
                offset_x = 0;
                offset_y = (gcursor.start_h - gcursor.max_used_h);
                break;
            case 8:
                offset_x = 0;
                offset_y = (gcursor.start_h - gcursor.max_used_h) / 2;
                break;
            default:
                offset_x = 0;
                offset_y = 0;
        }
        version (debug_update)
        writefln ("%s fix: %s: offset xy: %s,%s, start_w: %s, y: %s, e: %s", 
            replicate(" ", deep*2), _e.pos_group, offset_x, offset_y, gcursor.start_w, _e.pos.y, *_e);
        if (offset_x || offset_y) {
            _e_update_pos (_e, _e.pos.x+offset_x, _e.pos.y+offset_y);
            changed = true;
        }

        // recursive
        if (changed)
        if (_e.has_childs) {
            version (debug_update)
            writefln ("%s fix: reupdate", replicate(" ", deep*2));
            auto _big_gcursor = new_gcursor (_e);
            e_update_size_pos (_e,_big_gcursor,deep+1);
        }
    }
}

auto
all_non_max_w (E* e) {
    W _all_non_max_w;
    foreach (_e; WalkChilds (e))
        if (_e.size_w_type != E.SizeType.max_)
            _all_non_max_w += _e.size.w;    

    return _all_non_max_w;
}

void
e_update_total_sizes (GCursor) (E* e, GCursor* gcursor) {
    gcursor.w_by_type [e.size_w_type] += e.size.w;
    gcursor.h_by_type [e.size_h_type] += e.size.h;
    gcursor.count_by_w_size_type [e.size_w_type]++;
    gcursor.count_by_h_size_type [e.size_h_type]++;
}

// e.size       <--
//   fixed         |
//   content       |
//   parent        |
//   content.size -   <--
//     e                 |
//     fixed             |
//     image             |
//     text              |
//     childs            |
//     max               |
//     childs.size    ---
//       ...             |   [e..]
//     image.size     ---
//       fixed           |
//       image           |
//       text            |
//       content         |
//     text.size      ---
//       fixed
//       text
//       image
//       content
void
e_update_size (E* e) {
    final
    switch (e.size_w_type) {
        case E.SizeType.fixed   : e_update_size_w_fixed   (e); break;
        case E.SizeType.content : e_update_size_w_content (e); break;
        case E.SizeType.parent  : e_update_size_w_parent  (e); break;
        case E.SizeType.window  : e_update_size_w_window  (e); break;
        case E.SizeType.max     : e_update_size_w_max     (e); break;
    }

    final
    switch (e.size_h_type) {
        case E.SizeType.fixed   : e_update_size_h_fixed   (e); break;
        case E.SizeType.content : e_update_size_h_content (e); break;
        case E.SizeType.parent  : e_update_size_h_parent  (e); break;
        case E.SizeType.window  : e_update_size_h_window  (e); break;
        case E.SizeType.max     : e_update_size_h_max     (e); break;
    }
}

void
e_update_size_w_fixed (E* e) {
    _e_update_size_w (
        e, 
        e.size.w, 
        e.size.w - e.aura.size.w - e.aura.size.w
    );
}

void
e_update_size_w_content (E* e) {
    e_update_content_size_w (e);  // update content.size.w
    _e_update_size_w (
        e, 
        e.content.size.w + e.aura.size.w + e.aura.size.w, 
        e.content.size.w
    );
}

void
e_update_size_w_parent (E* e) {
    if (e.parent !is null)
        _e_update_size_w (
            e, 
            e.parent.content.size.w, 
            e.parent.content.size.w - e.aura.size.w - e.aura.size.w
        );
    else
        e_update_size_w_window (e);
}

void
e_update_size_w_window (E* e) {
    auto window = e.find_window ();
    if (window !is null)
        _e_update_size_w (
            e, 
            window.size.w, 
            window.size.w - e.aura.size.w - e.aura.size.w
        );
    else
        _e_update_size_w (
            e, 
            DEFAULT_WINDOW_W, 
            DEFAULT_WINDOW_W - e.aura.size.w - e.aura.size.w
        );
}

void
e_update_size_w_max (E* e) {
    // update max after all, in update_size_fix ()
}


void
e_update_size_h_fixed (E* e) {
    _e_update_size_h (
        e, 
        e.size.h, 
        e.size.h - e.aura.size.h - e.aura.size.h
    );
}

void
e_update_size_h_content (E* e) {
    _e_update_size_h (
        e, 
        e.content.size.h + e.aura.size.h + e.aura.size.h, 
        e.content.size.h
    );
}

void
e_update_size_h_parent (E* e) {
    if (e.parent !is null)
        _e_update_size_h (
            e, 
            e.parent.content.size.h, 
            e.parent.content.size.h - e.aura.size.h - e.aura.size.h
        );
    else
        e_update_size_h_window (e);
}

void
e_update_size_h_window (E* e) {
    auto window = e.find_window ();
    if (window !is null)
        _e_update_size_h (
            e, 
            window.size.h, 
            window.size.h - e.aura.size.h - e.aura.size.h
        );
    else
        _e_update_size_h (
            e, 
            DEFAULT_WINDOW_H, 
            DEFAULT_WINDOW_H - e.aura.size.h - e.aura.size.h
        );
}

void
e_update_size_h_max (E* e) {
    // update max after all, in update_size_fix ()
}

// ////////////////////////////////////////////////
void
_e_update_size_w (E* e, W ew, W cw) {
    e.size.w         = (ew > 0) ? ew : 0;
    e.content.size.w = (cw > 0) ? cw : 0;
}
void
_e_update_size_h (E* e, W eh, W ch) {
    e.size.h         = (eh > 0) ? eh : 0;
    e.content.size.h = (ch > 0) ? ch : 0;
}
void
_e_update_pos (E* e, X x, Y y) {
    e.pos         = Pos (x,y);
    e.margin.pos  = Pos (x - e.margin.size.w, y - e.margin.size.h);
    e.aura.pos    = Pos (x,y);
    e.content.pos = Pos (x + e.aura.size.w, y + e.aura.size.h);
}
// ////////////////////////////////////////////////
auto
find_window (E* e) {
    for (auto _e=e; _e !is null; _e = _e.parent)
        if (_e.window !is null)
            return _e.window;
    return null;
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
    foreach (kls; e.klasses) {
            kls.set (e,field.name,values);
    }
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
set_klasses_for_new_e (E* e, TString[] values) {
    e.add_klass (e.find_klass_or_create ("e"));

    // klasses
    foreach (ts; values)
        switch (ts.type) {
            case TString.Type.name   : 
            case TString.Type.string : 
                auto kls = e.find_klass_or_create (ts.s);
                e.add_klass (kls);
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
        e.content.image.size = Size (
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
            Pos  (_x,_y), 
            Size (w.to!W,h.to!H), 
            c.to!string
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
    writeln ("  pos_type            : ", e.pos_type);
    writeln ("  pos_group           : ", e.pos_group);
    writeln ("  pos                 : ", e.pos);
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



void
e_update_content_size_w (E* e) {
    final
    switch (e.content.size_h_type) {
        case E.Content.SizeType.e      : e_update_content_size_w_e      (e); break;
        case E.Content.SizeType.fixed  : e_update_content_size_w_fixed  (e); break;
        case E.Content.SizeType.childs : e_update_content_size_w_childs (e); break;
        case E.Content.SizeType.image  : e_update_content_size_w_image  (e); break;
        case E.Content.SizeType.text   : e_update_content_size_w_text   (e); break;
        case E.Content.SizeType.max_   : e_update_content_size_w_max    (e); break;
        case E.Content.SizeType.childs_image_text : 
                                         e_update_content_size_w_childs_image_text (e); break;
    }
}

void
_update_content_size_w (E* e, W w) {
    e.content.size.w = (w > 0) ? w : 0;
}

void
e_update_content_size_w_e (E* e) {
    _update_content_size_w (e, e.size.w);
}

void
e_update_content_size_w_fixed (E* e) {
    _update_content_size_w (e, e.content.size.w);
}

void
e_update_content_size_w_image (E* e) {
    e_update_content_image_size_w (e);
    _update_content_size_w (e, e.content.image.size.w);
}

void
e_update_content_size_w_text (E* e) {
    e_update_content_text_size_w (e);
    _update_content_size_w (e, e.content.text.size.w);
}

// e.size = content
// e.size = childs
//   update childs
//   
// content.size = e
//   update parent e
void
e_update_content_size_w_childs (E* e) {
    e_update_content_childs_size (e);
    _update_content_size_w (e, e.content.childs_size.w);
}

void
e_update_content_childs_size (E* e) {
    Size max_sz;
    foreach (_e; WalkChilds (e)) {
        _e.force_e_update ();
        max_sz.w = max (max_sz.w, _e.pos.x + _e.size.w);
        max_sz.h = max (max_sz.h, _e.pos.y + _e.size.h);
    }

    if (max_sz.w > e.content.pos.x)
        e.content.childs_size.w = max_sz.w - e.content.pos.x;
    else
        e.content.childs_size.w = 0;

    if (max_sz.h > e.content.pos.y)
        e.content.childs_size.h = max_sz.h - e.content.pos.y;
    else
        e.content.childs_size.h = 0;
}


void
e_update_content_size_w_max (E* e) {
    _update_content_size_w (e, max (e.content.image.size.w, e.content.text.size.w));
}

void
e_update_content_size_w_childs_image_text (E* e) {
    if (e.has_childs) {
        _update_content_size_w (e, e.content.childs_size.w);
        return;
    }

    if (e.content.image.ptr) {
        _update_content_size_w (e, e.content.image.size.w);
        return;
    }

    if (e.content.text.s.length) {
        _update_content_size_w (e, e.content.text.size.w);
        return;
    }

    //e.content.size.w = 0;
}

void
e_update_content_image_size_w (E* e) {
    final
    switch (e.content.image.size_w_type) {
        case E.Content.Image.SizeType.fixed   : e_update_content_image_size_w_fixed   (e); break;
        case E.Content.Image.SizeType.image   : e_update_content_image_size_w_image   (e); break;
        case E.Content.Image.SizeType.text    : e_update_content_image_size_w_text    (e); break;
        case E.Content.Image.SizeType.content : e_update_content_image_size_w_content (e); break;
    }
}

void 
e_update_content_image_size_w_fixed (E* e) {
    e.content.image.size.w = e.content.image.size.w;
}

void 
e_update_content_image_size_w_image (E* e) {
    if (e.content.image.ptr !is null) {
        auto img_surface = e.content.image.ptr;
        e.content.image.size.w = cast(ushort)img_surface.w;
    }
    else {
        //e.cached.content_image_size = e.cached.content_image_size;
        assert (0, "Image ptr is null");
    }
}

void 
e_update_content_image_size_w_text (E* e) {
    e.content.image.size.w = e.content.text.size.w;
}

void 
e_update_content_image_size_w_content (E* e) {
    e.content.image.size.w = e.content.size.w;
}

void
e_update_content_text_size_w (E* e) {
    final
    switch (e.content.text.size_w_type) {
        case E.Content.Text.SizeType.fixed   : e_update_content_text_size_w_fixed   (e); break;
        case E.Content.Text.SizeType.text    : e_update_content_text_size_w_text    (e); break;
        case E.Content.Text.SizeType.image   : e_update_content_text_size_w_image   (e); break;
        case E.Content.Text.SizeType.content : e_update_content_text_size_w_content (e); break;
    }
}

void 
e_update_content_text_size_w_image (E* e) {    
    e.content.text.size.w = e.content.image.size.w;
}

void 
e_update_content_text_size_w_fixed (E* e) {
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_update_content_text_size_w_text (E* e) {
    e.content.text.size.w = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).w;
}

void 
e_update_content_text_size_w_content (E* e) {
    e.content.text.size.w = e.content.size.w;
}


//void
//update_content_size_h (E* e) {
//    final
//    switch (e.content.size_h_type) {
//        case E.Content.SizeType.e      : update_content_size_h_e      (e); break;
//        case E.Content.SizeType.fixed  : update_content_size_h_fixed  (e); break;
//        case E.Content.SizeType.childs : update_content_size_h_childs (e); break;
//        case E.Content.SizeType.image  : update_content_size_h_image  (e); break;
//        case E.Content.SizeType.text   : update_content_size_h_text   (e); break;
//        case E.Content.SizeType.max    : update_content_size_h_max    (e); break;
//        case E.Content.SizeType.childs_image_text : update_content_size_h_childs_image_text    (e); break;
//    }
//}

void
update_content_size_h_e (E* e) {
    auto ch = e.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_fixed (E* e) {
    auto ch = e.content.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_image (E* e) {
    update_content_image_size_h (e);

    auto ch = e.content.image.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_text (E* e) {
    update_content_text_size_h (e);

    auto ch = e.content.text.size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_childs (E* e) {
    e_update_content_childs_size (e);

    auto ch = e.content.childs_size.h;
    e.content.size.h = (ch > 0) ? ch : 0;
}

void
update_content_size_h_max (E* e) {
    if (e.has_childs) {
        e.content.size.h = e.content.childs_size.h;
        return;
    }

    if (e.content.image.ptr) {
        e.content.size.h = e.content.image.size.h;
        return;
    }

    if (e.content.text.s.length) {
        e.content.size.h = e.content.text.size.h;
        return;
    }

    //e.content.size.h = 0;
}

void
update_content_size_h_childs_image_text (E* e) {
    e.content.size.h = max (e.content.image.size.h, e.content.text.size.h);
}

void
update_content_image_size_h (E* e) {
    final
    switch (e.content.image.size_h_type) {
        case E.Content.Image.SizeType.fixed   : update_content_image_size_h_fixed   (e); break;
        case E.Content.Image.SizeType.image   : update_content_image_size_h_image   (e); break;
        case E.Content.Image.SizeType.text    : update_content_image_size_h_text    (e); break;
        case E.Content.Image.SizeType.content : update_content_image_size_h_content (e); break;
    }
}

void 
update_content_image_size_h_fixed (E* e) {
    //e.content.image.size.h = e.content.image.size.h;
}

void 
update_content_image_size_h_image (E* e) {
    if (e.content.image.ptr !is null) {
        auto img_surface = e.content.image.ptr;
        e.content.image.size.h = cast(ushort)img_surface.h;
    }
    else {
        //e.cached.content_image_size = e.cached.content_image_size;
        assert (0, "Image ptr is null");
    }
}

void 
update_content_image_size_h_text (E* e) {
    e.content.image.size.h = e.content.text.size.h;
}

void 
update_content_image_size_h_content (E* e) {
    e.content.image.size.h = e.content.size.h;
}


void
update_content_text_size_h (E* e) {
    final
    switch (e.content.text.size_h_type) {
        case E.Content.Text.SizeType.fixed   : update_content_text_size_h_fixed   (e); break;
        case E.Content.Text.SizeType.text    : update_content_text_size_h_text    (e); break;
        case E.Content.Text.SizeType.image   : update_content_text_size_h_image   (e); break;
        case E.Content.Text.SizeType.content : update_content_text_size_h_content (e); break;
    }
}

void 
update_content_text_size_h_image (E* e) {
    e.content.text.size.h = e.content.image.size.h;
}

void 
update_content_text_size_h_fixed (E* e) {
    //e.content.text.size.h = e.content.text.size.wh
}

void 
update_content_text_size_h_text (E* e) {
    e.content.text.size.h = get_text_size (
        e.content.text.s, 
        e.content.text.font.ptr, 
        e.content.text.fg
    ).h;
}

void 
update_content_text_size_h_content (E* e) {    
    e.content.text.size.h = e.content.size.h;
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
    auto gcursor = new_gcursor (e);
    e.e_update_size_pos (gcursor);
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
