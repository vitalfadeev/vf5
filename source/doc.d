module doc;

import std.conv;
import std.string : startsWith;
import etree;
import klass;
import e;
import types;
import draw : get_text_size;
import pix : global_font;
import std.stdio : writeln;


struct
Doc {
    ETree*   tree;
    Klass*[] klasses; // find by name
    Klass*   hotkeys;
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
load_images (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        if (t.e.content.image.src.length)
            load_e_image (t.e);
}

void
load_e_image (E* e) {
    auto img_surface = IMG_Load (e.content.image.src.toStringz);
    e.cached.content_image_ptr = img_surface;
    e.cached.content_image_size = Size (
        cast(ushort)img_surface.w,
        cast(ushort)img_surface.h
    );
}

void
update_text_size (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        if (t.e.content.text.s.length)
            update_e_text_size (t.e);
}

void
update_e_text_size (E* e) {
    e.content.text.size = get_text_size (
        e.content.text.s, 
        global_font, //e.content.text.font.ptr, 
        e.content.text.color, 
    );
}

void
update_pos_size (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        update_size (t);
    foreach (ETree* t; WalkTree (doc.tree))
        update_pos (t);
}

// e size
//   fixed
//   content
//   parent
// content size
//   fixed
//   image
//   text
//   e
//   image size
//     fixed
//     image
//     text
//     content
//   text size
//     fixed
//     text
//     image
//     content
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

    //
    final
    switch (e.size_type) {
        case E.SizeType.fixed   : e_size_fixed   (doc,t); break;
        case E.SizeType.content : e_size_content (doc,t); break;
        case E.SizeType.parent  : e_size_parent (doc,t); break;
    }
}

void
e_size_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.size = e.size;
}

void
e_size_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e_content_size (doc,t);
    e.cached.size = e.content.size;
}

void
e_size_parent (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.size = e.parent.content.size;
}

void
e_content_size (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.size_type) {
        case E.Content.SizeType.fixed : e_content_size_fixed  (doc,t); break;
        case E.Content.SizeType.max   : e_content_size_max    (doc,t); break;
        case E.Content.SizeType.image : e_content_size_image  (doc,t); break;
        case E.Content.SizeType.text  : e_content_size_text   (doc,t); break;
        case E.Content.SizeType.e     : e_content_size_e      (doc,t); break;
    }
}

void
e_content_size_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_size = e.content.size;
}

void
e_content_size_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_size = e.content.image.size;
}

void
e_content_size_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_size = e.content.text.size;
}

void
e_content_size_parent (Doc* doc, ETree* t) {
    auto e = t.e;
    if (t.parent !is null)
        e.cached.content_size = t.parent.e.content.size;
    else
        e.cached.content_size = doc.size;
        //return Screen.size;
        //return Window.size;
}

void
e_content_size_max (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_size = Size (
        max (e.content.image.size.w, e.content.text.size.w),
        max (e.content.image.size.h, e.content.text.size.h)
    );
}

void
e_content_image_size (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.size_type) {
        case E.Content.Image.SizeType.fixed   : e_content_image_size_fixed   (doc,t); break;
        case E.Content.Image.SizeType.image   : e_content_image_size_image   (doc,t); break;
        case E.Content.Image.SizeType.text    : e_content_image_size_text    (doc,t); break;
        case E.Content.Image.SizeType.content : e_content_image_size_content (doc,t); break;
    }
}

void 
e_content_image_size_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_image_size = e.content.image.size;
}

void 
e_content_image_size_image (Doc* doc, ETree* t) {
    auto e = t.e;
    if (e.cached.content_image_ptr !is null) {
        auto img_surface = e.cached.content_image_ptr;

        e.cached.content_image_size = Size (
            cast(ushort)img_surface.w,
            cast(ushort)img_surface.h
        );
    }
    else {
        //e.cached.content_image_size = e.cached.content_image_size;
        assert (0, "Image ptr is null");
    }
}

void 
e_content_image_size_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_image_size = e.content.text.size;
}

void 
e_content_image_size_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_image_size = e.content.size;
}

void
e_content_text_size (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.size_type) {
        case E.Content.Text.SizeType.fixed   : e_content_text_size_fixed   (doc,t); break;
        case E.Content.Text.SizeType.text    : e_content_text_size_text    (doc,t); break;
        case E.Content.Text.SizeType.image   : e_content_text_size_image   (doc,t); break;
        case E.Content.Text.SizeType.content : e_content_text_size_content (doc,t); break;
    }
}

void 
e_content_text_size_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_text_size = e.content.text.size;
}

void 
e_content_text_size_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_text_size = e.content.image.size;
}

void 
e_content_text_size_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_text_size = get_text_size (
        e.content.text.s, 
        global_font, 
        e.content.text.color
    );
}

void 
e_content_text_size_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.cached.content_text_size = e.content.size;
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


auto
max (A,B) (A a, B b) {
    if (a >= b)
        return a;
    else
        return b;
}
