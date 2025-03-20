module e_root;

import std.stdio;
import std.conv;
import bindbc.sdl;
import etree;
import e;
import e_update;
import klass;
import pix;
import txt_reader;
import events;
import types;


void
send_event_in_tree (E* root, Event* ev) {
    // klass event
    foreach (_e; WalkTree (root)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
    }
}

void
send_click_in_deep (E* e, Event* ev, Pos down_pos, Pos up_pos, ref E* deepest) {
    bool 
    valid_e (E* e) {
        return (
            pos_in_rect (down_pos, e.pos, e.size) &&
            pos_in_rect (up_pos,   e.pos, e.size)
        );
    }

    // klass event
    foreach (_e; WalkInDeep (e,&valid_e)) {
        foreach (kls; _e.klasses)
            kls.event (ev,_e);
        deepest = _e;
    }
}
