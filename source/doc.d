module doc;

import std.conv;
import std.string : startsWith;
import etree;
import klass;
import e;
import types;
import std.stdio : writeln;


struct
Doc {
    ETree*   tree;
    Klass*[] klasses; // find by name
    Klass*   colors;
    Klass*   hotkeys;
    Klass*   commands;
    Size     size;

    Klass*
    find_klass (string s) {
        foreach (kls; klasses)
            if (kls.name == s)
                return kls;

        return null;
    }

    Klass*
    create_klass (string s) {
        Klass* kls = new Klass (s);
        klasses ~= kls;
        return kls;
    }


    Klass*
    find_klass_or_create (string s) {
        auto kls = find_klass (s);
        if (kls is null)
            kls = create_klass (s);
        return kls;
    }

    E*
    find_e_at_pos (Pos pos) {
        E* found;

        bool 
        valid_e (ETree* t) {
            if (t.e.pos.x <= pos.x && t.e.pos.x + t.e.size.w > pos.x)
            if (t.e.pos.y <= pos.y && t.e.pos.y + t.e.size.h > pos.y)
                return true;

            return false;
        }

        foreach (t; FindDeepest (tree,&valid_e))
            found = t.e;

        return found;
    }

    //int
    //event (Event* ev) {
    //    //
    //}
}

void
add_class (Doc* doc, E* e, string s) {
    Klass* kls = doc.find_klass_or_create (s);
    foreach (_kls; e.klasses) 
        if (_kls == kls)
            return;

    e.klasses ~= kls;
}

void
remove_class (Doc* doc, string s) {
    auto kls = doc.find_klass (s);
    import std.stdio;
    if (kls !is null)
    foreach (t; WalkTree (doc.tree))
        remove_class (t.e, kls);
}

void
remove_class (E* e, Klass* kls) {
    import std.algorithm.searching : countUntil;
    import std.algorithm : remove;

    auto i = e.klasses.countUntil (kls);
    if (i != -1)
        e.klasses = e.klasses.remove (i);
}

void
doc_apply_klasses (Doc* doc) {
    foreach (t; WalkTree (doc.tree))
        e.apply_klasses (doc,t.e);
}


void
update_pos_size (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        update_size (t);
    foreach (ETree* t; WalkTree (doc.tree))
        update_pos (t);
}

void
update_size (ETree* t) {
    E* e = t.e;

    if (t.e is null)
        return;

    // size = auto
    if (e.size_w_auto) {
        if (!e.content_image_size_w_auto)
            e.size.w = e.content.image.size.w;
    }

    // image = auto
    if (!e.size_w_auto) {
        if (e.content_image_size_w_auto)
            e.content.image.size.w = e.size.w;
    }

    // size = auto, has borders 
    if (e.size_w_auto) {
        if (!e.content_image_size_w_auto)  {
            e.size.w = e.content.image.size.w;
            if (e.borders.l.w)
                e.size.w += e.borders.l.w;
            if (e.borders.r.w)
                e.size.w += e.borders.r.w;
        }
    }

    // image = auto, has borders
    if (!e.size_w_auto) {
        if (e.content_image_size_w_auto)  {
            e.content.image.size.w = e.size.w;
            if (e.borders.l.w)
                e.content.image.size.w -= e.borders.l.w;
            if (e.borders.r.w)
                e.content.image.size.w -= e.borders.r.w;
        }
    }

    // size and image fixed, has borders
    if (!e.size_w_auto) {
        if (!e.content_image_size_w_auto)  {
            // keep
        }
    }
}

void
update_pos (ETree* t) {
   E* e = t.e;

   if (t.e is null)
       return;

   //
   switch (e.pos_type) {
    case E.PosType.t9   : pos_type_t9 (t); break;
    case E.PosType.grid : pos_type_grid (t); break;
    default:
   }      
}


void
pos_type_t9 (ETree* t) {
    // 1 2 3 
    // 8 9 4 
    // 7 6 5 

    E* e = t.e;

    if (e.pos_group == 1) {
        ETree* prev = find_last_in_group (t, e.pos_group);
        if (prev !is null) {
            if (e.pos_dir == E.PosDir.r) {
                e.pos.x = cast(X)(prev.e.pos.x + prev.e.size.w);
                //e.pos.y = prev.e.pos.y;
            }
        }
        else {
            X parent_x;
            if (t.parent !is null)
                parent_x = t.parent.e.pos.x;

            e.pos.x = parent_x;
        }
    }
    if (e.pos_group == 9) {
        // Pass 1
        //   pos = Pos (0,0)
        //   _x += w
        //   _w += w
        //   _h = max (_h,h)
        //   pos = Pos (_x,0)
        // Pass 2
        //   dx = (content.w - _w) / 2
        //   dy = (content.h - _h) / 2
        //   each (c; WalkLeft)
        //     c.pos.x += dx
        //     c.pos.y += dy
    }
}

void
pos_type_grid (ETree* t) {
    // e e
    // e e 
    // e e
}

ETree*
find_last_in_group (ETree* t, ubyte pos_group) {
    foreach (ETree* _t; WalkLeft (t))
        if (_t.e.pos_group == pos_group)
            return _t;

    return null;
}


void
go_event_action (Doc* doc, E* e, string[] action) {
    exec_action (doc, action);
}

void
exec_action (Doc* doc, string[] action) {
    import std.process;
    
    if (action.length) {
        writeln (action);
        if (action[0].startsWith ("`")) { // `audacious`
            // exec `audacious`
            writeln ("  EXEC: ", action);
            auto pid = spawnProcess (action);
        }
        else {
            string[] vs;            
            if (doc.commands.find (action[0], vs)) { // player.start
                // exec commands player.start
                writeln ("  EXEC: ", vs);
                auto pid = spawnProcess (vs);
            }
            else 
                assert (0, "unsupported command: " ~ action.to!string);
        }
        





        //if (action[0] == "exec" || action[0] == "exec-wait") {
        //    if (action.length >= 2) {
        //        writeln ("  EXEC: ", action[1..$]);
        //        auto ret = execute (action[1..$]);  // (int status, string output)
        //    }
        //}
        //else
        //if (action[0] == "exec-nowait") {
        //    if (action.length >= 2) {
        //        writeln ("  EXEC: ", action[1..$]);
        //        auto pid = spawnProcess (action[1..$]);
        //    }
        //}    
    }    
}

//status
//  ? audtool playback-status
//    plaing
//      fg green
//    paused
//      fg yellow
//    stopped
//      fg red
version (question_)
void
go_question_subclass (string[] s) {
    import std.process;

    if (action.length) {
        if (s[0] == "?") {
            if (s.length >= 2) {
                auto ret = execute (action[1..$]);  // (int status, string output)
                writeln (ret.status);
                writeln (ret.output);
                foreach (c; childs)
                    if (c.name == ret.output) {
                        // ...
                    }
            }
        }
    }
}

//title
//  text ? audtool current-song
version (question_)
void
go_question_value (string[] s) {
    import std.process;

    if (action.length) {
        if (s[0] == "?") {
            if (s.length >= 2) {
                auto ret = execute (action[1..$]);  // (int status, string output)
                writeln (ret.status);
                writeln (ret.output);
            }
        }
    }
}


Size
e_size (E* e) {
    // ### e border content image text
    // e.size               = by_content | fixed 120 32 | parent parent.content.size
    // by_content           = by_image | by_text | fixed 120 32 | max (content.image, content.text) | parent
    // e.content.image.size = by_image | fixed 120 32 | parent e.parent.content.size - e.border - e.pad
    // e.content.text.size  = by_text  | fixed 120 32 | parent e.parent.content.size - e.border - e.pad

    final
    switch (e.size_type) {
        case E.SizeType.content : break;
        case E.SizeType.fixed   : break;
        case E.SizeType.parent  : break;
    }

    return Size ();
}

Size
e_content_size (Doc* doc, ETree* t) {
    auto e = t.e;
    final
    switch (e.content.size_type) {
        case E.Content.SizeType.max_image_text : return e_content_size_max    (doc,t); break;
        case E.Content.SizeType.image          : return e_content_size_image  (doc,t); break;
        case E.Content.SizeType.text           : return e_content_size_text   (doc,t); break;
        case E.Content.SizeType.fixed          : return e_content_size_fixed  (doc,t); break;
        case E.Content.SizeType.parent         : return e_content_size_parent (doc,t); break;
    }
}

Size
e_content_size_max (Doc* doc, ETree* t) {
    auto e = t.e;
    return Size (
        max (e.content.image.size.w, e.content.text.size.w),
        max (e.content.image.size.h, e.content.text.size.h)
    );
}

Size
e_content_size_image (Doc* doc, ETree* t) {
    auto e = t.e;
    return e.content.image.size;
}

Size
e_content_size_text (Doc* doc, ETree* t) {
    auto e = t.e;
    return e.content.text.size;
}

Size
e_content_size_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    return e.content.size;
}

Size
e_content_size_parent (Doc* doc, ETree* t) {
    auto e = t.e;
    auto e_parent_content_size = t.parent.e.content.size;
    auto e_borders_size = Size (
            cast(W)(e.borders.l.w+e.borders.r.w), 
            cast(H)(e.borders.t.w+e.borders.b.w)
        );
    auto e_pad_size = Size (
            cast(W)(e.pad.l+e.pad.r), 
            cast(H)(e.pad.t+e.pad.b)
        );
    if (t.parent !is null)
        return e_parent_content_size - e_borders_size - e_pad_size;
    else
        return doc.size;
        //return Screen.size;
        //return Window.size;
}

auto
max (A,B) (A a, B b) {
    if (a >= b)
        return a;
    else
        return b;
}
