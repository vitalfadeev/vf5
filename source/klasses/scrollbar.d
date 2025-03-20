module klasses.scrollbar;

import std.stdio;
import std.string;
import std.conv;
import bindbc.sdl;
import etree;
import e;
import e_update;
import klass;
import types;
import tstring;
import events;


struct 
Scrollbar {
    Klass _super = 
        Klass (
            typeof(this).stringof.toLower, 
            [], 
            [], 
            [], 
            Klass.Fn (
                &.event,
                &.update,
                &.set, 
                &.draw, 
            )
        );
    alias _super this;
}


// KLASS_EVENT_FN  
void 
event (Klass* kls, Event* ev, E* e) {
    //
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, UpdateUserEvent* ev, E* e) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (Klass* kls, DrawUserEvent* ev, E* e) {
    //
}


/*
e scrollbar
  e up
  e cursor
  e dn

scrollbar
  on changed ...
  on cursor-moved ...
  on up-clicked ...
  on dn-clicked ...

  go_step_up ()  -> changed true/false
  go_step_dn ()
  go_page_up ()
  go_page_dn ()
  go_max_up ()
  go_max_dn ()
  go_percent ()
  go_offset ()
  percent ()
  offset ()

  offset_to_percent ()
  percent_to_offset ()

  cursor_moved ()  -> validate; go_percent; update_cursor; changed; send "cursor-moved"
  up_clicked ()    -> validate; go_step_up; update_cursor; changed; send "dn-clicked"
  dn_clicked ()    -> validate; go_step_dn; update_cursor; changed; send "dn-clicked"

  changed ()       -> send "changed",e_scrollbar  
*/

