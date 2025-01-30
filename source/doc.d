module doc;

import std.conv;
import std.string;
import std.string : startsWith;
import std.string : fromStringz, toStringz; 
import std.algorithm.searching : canFind;
import bindbc.sdl;
import bindbc.sdl.image;
import bindbc.sdl.ttf;
import etree;
import klass;
import e;
import types;
import draw : get_text_size;
import pix : global_font;
import std.stdio : writeln;
import pix : open_font;
import pix : IMGException;
import draw : e_pos, e_size, content_pos;


struct
Doc {
    ETree*   tree;
    Klass*[] klasses; // find by name
    Klass*   hotkeys;
    Size     size = Size (640,480);

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
load_fonts (Doc* doc) {
    if (global_font is null)
        global_font = open_font ("/home/vf/src/vf5/img/PTSansCaption-Regular.ttf", 13);
}

void
load_colors (Doc* doc) {
    // after load all classes, because able color 'class.field'
}

void
load_images (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        if (t.e.content.image.src.length)
            load_e_image (t.e);
}

void
load_e_image (E* e) {
    if (e.content.image.ptr is null) {
        auto img_surface = IMG_Load (e.content.image.src.toStringz);
        if (img_surface)
            throw new IMGException ("IMG_Load");
        e.content.image.ptr = img_surface;
        e.content.image.size = Size (
                cast(ushort)img_surface.w,
                cast(ushort)img_surface.h
            );
    }
}

void
load_texts (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        if (t.e.content.text.s.length)
            load_e_text (t.e);
}

void
load_e_text (E* e) {
    e.content.text.rects.length = 0;
    e.content.text.rects.reserve (e.content.text.s.length);

    int w, h, max_h;
    X _x = 0;
    Y _y = 0;

    foreach (dchar c; e.content.text.s) {
        auto ret = TTF_SizeUTF8 (global_font, c.to!string.toStringz, &w, &h);

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
update_text_size (Doc* doc) {
    //foreach (ETree* t; WalkTree (doc.tree))
    //    if (t.e.content.text.s.length)
    //        update_e_text_size (t.e);
}

//void
//update_e_text_size (E* e) {
//    foreach (ref rec; e.content.text.rects)
//        rec.pos
//}

void
update_sizes (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        update_size (doc,t);
}

void
update_childs_sizes (Doc* doc) {
    // update
    foreach (ETree* t; WalkTree (doc.tree)) {
        t.e.content.childs_size = Size (0,0);
        if (t.parent !is null)
            t.parent.e.content.childs_size += t.e.size;
    }
}

void
update_poses (Doc* doc) {
    foreach (ETree* t; WalkTree (doc.tree))
        update_pos (doc,t);
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
update_size (Doc* doc, ETree* t) {
    E* e = t.e;

    //// size = auto
    //if (e.size_w_auto) {
    //    if (!e.content_image_size_w_auto)
    //        e.size.w = e.content.image.size.w;
    //}

    //// image = auto
    //if (!e.size_w_auto) {
    //    if (e.content_image_size_w_auto)
    //        e.content.image.size.w = e.size.w;
    //}

    //// size = auto, has borders 
    //if (e.size_w_auto) {
    //    if (!e.content_image_size_w_auto)  {
    //        e.size.w = e.content.image.size.w;
    //        if (e.borders.l.w)
    //            e.size.w += e.borders.l.w;
    //        if (e.borders.r.w)
    //            e.size.w += e.borders.r.w;
    //    }
    //}

    //// image = auto, has borders
    //if (!e.size_w_auto) {
    //    if (e.content_image_size_w_auto)  {
    //        e.content.image.size.w = e.size.w;
    //        if (e.borders.l.w)
    //            e.content.image.size.w -= e.borders.l.w;
    //        if (e.borders.r.w)
    //            e.content.image.size.w -= e.borders.r.w;
    //    }
    //}

    //// size and image fixed, has borders
    //if (!e.size_w_auto) {
    //    if (!e.content_image_size_w_auto)  {
    //        // keep
    //    }
    //}

    //
    final
    switch (e.size_w_type) {
        case E.SizeType.fixed   : e_size_w_fixed   (doc,t); break;
        case E.SizeType.content : e_size_w_content (doc,t); break;
        case E.SizeType.parent  : e_size_w_parent  (doc,t); break;
    }

    final
    switch (e.size_h_type) {
        case E.SizeType.fixed   : e_size_h_fixed   (doc,t); break;
        case E.SizeType.content : e_size_h_content (doc,t); break;
        case E.SizeType.parent  : e_size_h_parent  (doc,t); break;
    }
}

void
e_size_w_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.w = e.content.text.size.w;
//    e.cached.size = e.size;
}

void
e_size_w_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e_content_size_w (doc,t);
    e.size.w = (e.content.size.w + e.pad.l + e.pad.r).to!W;
//    e.cached.size = e.content.size;
}

void
e_size_w_parent (Doc* doc, ETree* t) {
    auto e = t.e;
    e.size.w = t.parent.e.content.size.w;
//    e.cached.size = t.parent.e.content.size;
}

void
e_size_h_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = e.content.text.size.h;
    //e.cached.size = e.size;
}

void
e_size_h_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e_content_size_h (doc,t);
    e.size.h = (e.content.size.h + e.pad.t + e.pad.b).to!H;
}

void
e_size_h_parent (Doc* doc, ETree* t) {
    auto e = t.e;
    e.size.h = t.parent.e.content.size.h;
}

void
e_content_size_w (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.size_w_type) {
        case E.Content.SizeType.fixed  : e_content_size_w_fixed  (doc,t); break;
        case E.Content.SizeType.image  : e_content_size_w_image  (doc,t); break;
        case E.Content.SizeType.text   : e_content_size_w_text   (doc,t); break;
        case E.Content.SizeType.childs : e_content_size_w_childs (doc,t); break;
        case E.Content.SizeType.max    : e_content_size_w_max    (doc,t); break;
        case E.Content.SizeType.e      : e_content_size_w_e      (doc,t); break;
    }
}

void
e_content_size_w_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.content.size.w = e.content.size.w;
    //e.cached.content_size = e.content.size;
}

void
e_content_size_w_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.w = e.content.image.size.w;
}

void
e_content_size_w_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.w = e.content.text.size.w;
}

void
e_content_size_w_childs (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.w = e.content.childs_size.w;
}

void
e_content_size_w_e (Doc* doc, ETree* t) {
    auto e = t.e;
    if (t.parent !is null)
        e.content.size.w = t.parent.e.content.size.w;
    else
        e.content.size.w = doc.size.w;
        //return Screen.size;
        //return Window.size;
}

void
e_content_size_w_max (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.w = max (e.content.image.size.w, e.content.text.size.w);
}

void
e_content_size_h (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.size_h_type) {
        case E.Content.SizeType.fixed  : e_content_size_h_fixed  (doc,t); break;
        case E.Content.SizeType.image  : e_content_size_h_image  (doc,t); break;
        case E.Content.SizeType.text   : e_content_size_h_text   (doc,t); break;
        case E.Content.SizeType.childs : e_content_size_h_childs (doc,t); break;
        case E.Content.SizeType.max    : e_content_size_h_max    (doc,t); break;
        case E.Content.SizeType.e      : e_content_size_h_e      (doc,t); break;
    }
}

void
e_content_size_h_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.content.size.w = e.content.size.w;
    //e.cached.content_size = e.content.size;
}

void
e_content_size_h_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = e.content.image.size.h;
}

void
e_content_size_h_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = e.content.text.size.h;
}

void
e_content_size_h_childs (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = e.content.childs_size.h;
}

void
e_content_size_h_e (Doc* doc, ETree* t) {
    auto e = t.e;
    if (t.parent !is null)
        e.content.size.h = t.parent.e.content.size.h;
    else
        e.content.size.h = doc.size.h;
        //return Screen.size;
        //return Window.size;
}

void
e_content_size_h_max (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.size.h = max (e.content.image.size.h, e.content.text.size.h);
}

void
e_content_image_size_w (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.image.size_w_type) {
        case E.Content.Image.SizeType.fixed   : e_content_image_size_w_fixed   (doc,t); break;
        case E.Content.Image.SizeType.image   : e_content_image_size_w_image   (doc,t); break;
        case E.Content.Image.SizeType.text    : e_content_image_size_w_text    (doc,t); break;
        case E.Content.Image.SizeType.content : e_content_image_size_w_content (doc,t); break;
    }
}

void 
e_content_image_size_w_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.image.size.w;
}

void 
e_content_image_size_w_image (Doc* doc, ETree* t) {
    auto e = t.e;
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
e_content_image_size_w_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.text.size.w;
}

void 
e_content_image_size_w_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.w = e.content.size.w;
}

void
e_content_image_size_h (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.image.size_h_type) {
        case E.Content.Image.SizeType.fixed   : e_content_image_size_h_fixed   (doc,t); break;
        case E.Content.Image.SizeType.image   : e_content_image_size_h_image   (doc,t); break;
        case E.Content.Image.SizeType.text    : e_content_image_size_h_text    (doc,t); break;
        case E.Content.Image.SizeType.content : e_content_image_size_h_content (doc,t); break;
    }
}

void 
e_content_image_size_h_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.image.size.h;
}

void 
e_content_image_size_h_image (Doc* doc, ETree* t) {
    auto e = t.e;
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
e_content_image_size_h_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.text.size.h;
}

void 
e_content_image_size_h_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.image.size.h = e.content.size.h;
}


void
e_content_text_size_w (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.text.size_w_type) {
        case E.Content.Text.SizeType.fixed   : e_content_text_size_w_fixed   (doc,t); break;
        case E.Content.Text.SizeType.text    : e_content_text_size_w_text    (doc,t); break;
        case E.Content.Text.SizeType.image   : e_content_text_size_w_image   (doc,t); break;
        case E.Content.Text.SizeType.content : e_content_text_size_w_content (doc,t); break;
    }
}

void 
e_content_text_size_w_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_w_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.w = e.content.image.size.w;
}

void 
e_content_text_size_w_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.w = get_text_size (
        e.content.text.s, 
        global_font, 
        e.content.text.fg
    ).w;
}

void 
e_content_text_size_w_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.w = e.content.size.w;
}

void
e_content_text_size_h (Doc* doc, ETree* t) {
    auto e = t.e;

    final
    switch (e.content.text.size_h_type) {
        case E.Content.Text.SizeType.fixed   : e_content_text_size_h_fixed   (doc,t); break;
        case E.Content.Text.SizeType.text    : e_content_text_size_h_text    (doc,t); break;
        case E.Content.Text.SizeType.image   : e_content_text_size_h_image   (doc,t); break;
        case E.Content.Text.SizeType.content : e_content_text_size_h_content (doc,t); break;
    }
}

void 
e_content_text_size_h_fixed (Doc* doc, ETree* t) {
    auto e = t.e;
    //e.content.text.size.w = e.content.text.size.w;
}

void 
e_content_text_size_h_image (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.h = e.content.image.size.h;
}

void 
e_content_text_size_h_text (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.h = get_text_size (
        e.content.text.s, 
        global_font, 
        e.content.text.fg
    ).h;
}

void 
e_content_text_size_h_content (Doc* doc, ETree* t) {
    auto e = t.e;
    e.content.text.size.h = e.content.size.h;
}




void
update_pos (Doc* doc, ETree* t) {
    E* e = t.e;

    if (t.e is null)
        return;

    //
    final
    switch (e.pos_type) {
        case E.PosType.t9   : pos_type_t9 (t); break;
        case E.PosType.grid : pos_type_grid (t); break;
        case E.PosType.vbox : pos_type_vbox (t); break;
        case E.PosType.hbox : pos_type_hbox (t); break;
        case E.PosType.none : break;
   }

   // text pos
   //update_text_rects_pos (e);
}

//void
//update_text_rects_pos (E* e) {
//    foreach (ref rec; e.content.text.rects) {
//        if (rec.s.length)
//            rec.pos += e.pos;
//    }
//}


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

void
pos_type_vbox (ETree* t) {
    // e
    // e 
    // e
    E* e = t.e;

    ETree* prev = find_last_with_type (t, e.pos_type);
    if (prev !is null) {
        if (e.pos_dir == E.PosDir.r) {
            auto prev_pos  = e_pos  (prev.e);
            auto prev_size = e_size (prev.e);
            e.pos.x = 0;
            e.pos.y = (prev_pos.y + prev_size.h).to!Y;
        }
    }
    else {
        if (t.parent !is null) {
            auto parent_content_pos = content_pos (t.parent.e);
            e.pos.x = parent_content_pos.x;
            e.pos.y = parent_content_pos.y;
        }
        else {
            e.pos.x = 0;
            e.pos.y = 0;
        }
    }
}

void
pos_type_hbox (ETree* t) {
    // e e e
    E* e = t.e;

    ETree* prev = find_last_with_type (t, e.pos_type);
    if (prev !is null) {
        if (e.pos_dir == E.PosDir.r) {
            auto prev_pos  = e_pos  (prev.e);
            auto prev_size = e_size (prev.e);
            e.pos.x = (prev_pos.x + prev_size.w).to!X;
            //e.pos.y = prev.e.pos.y;
        }
    }
    else {
        if (t.parent !is null) {
            auto parent_content_pos = content_pos (t.parent.e);
            e.pos.x = parent_content_pos.x;
        }
        else {
            e.pos.x = 0;
        }
    }
}

ETree*
find_last_in_group (ETree* t, ubyte pos_group) {
    foreach (ETree* _t; WalkLeft (t))
        if (_t.e.pos_group == pos_group)
            return _t;

    return null;
}


ETree*
find_last_with_type (ETree* t, E.PosType pos_type) {
    foreach (ETree* _t; WalkLeft (t))
        if (_t.e.pos_type == pos_type)
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
        string[] cmd = doc_get_klass_field_value (doc,action[0]);
        if (cmd.length)
            goto exec;
        else
            cmd = action;
        
        //
    exec:
        if (cmd.length) {
            // raw exec
            writeln ("  EXEC: ", cmd);
            auto pid = spawnProcess (cmd);
        }    
    }
}

string[]
doc_get_klass_field_value (Doc* doc, string s) {
    auto dot = s.indexOf ('.');
    if (dot != -1) {
        // class field
        auto klass_name  = s[0..dot];
        auto klass_field = s[dot+1..$];
        auto kls = doc.find_klass (klass_name);
        if (kls !is null) {
            string[] values;
            if (kls.find (klass_field, values)) {
                return values;// OK
            }
        }
    }

    return [];
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
