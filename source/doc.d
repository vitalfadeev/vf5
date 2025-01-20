module doc;

import etree;
import klass;
import e;
import types;


struct
Doc {
    ETree*   tree;
    Klass*[] klasses; // find by name

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
            if (t.e !is null )
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
add_class (Doc* doc, E* e, string kls_name) {
    Klass* kls = doc.find_klass_or_create (kls_name);
    foreach (_kls; e.klasses) 
        if (_kls == kls)
            return;

    e.klasses ~= kls;
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
   pos_9 (t);
}


void
pos_9 (ETree* t) {
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
    }
}

ETree*
find_last_in_group (ETree* t, ubyte pos_group) {
    for (ETree* _t = t.l; _t !is null; _t = _t.l)
        if (t.e !is null)
        if (t.e.pos_group == pos_group)
            return _t;
    return null;
}

