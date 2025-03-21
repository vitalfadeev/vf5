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

void 
scrollbar_update (E* e_scrollbar, size_t offset, size_t limit, size_t total) {
    // total,offset
    //   cursor position
    // limit
    //   cursor size
    auto cursor = e_scrollbar.find_cursor ();
    if (cursor !is null) {
        auto percent = (cast (float) offset) / total;  // 0..1
        auto _x = e_scrollbar.content.pos.x;
        auto _y = e_scrollbar.content.pos.y + (e_scrollbar.size.h * percent)/* - cursor.size.h/2*/;
        //
        // new cursor klass
        // add new cursor klass to cursor
        // add new cursor class fields
        // ower of klass - scrollbar
        //
        // cursor-klass-XXX
        //   pos.y AAA
        //

        //auto _cursor_klass = &e_scrollbar.cursor_klass;
        auto _cursor_klass = 
            e_scrollbar.find_klass_or_create (
                format!"scrollbar-cursor-%X" (e_scrollbar)
            );

        writeln (e_scrollbar);
        writeln (cursor);
        writeln (_cursor_klass);
        writeln (*_cursor_klass);
        if (!cursor.has_klass (_cursor_klass))
            cursor.add_klass (_cursor_klass);

        _cursor_klass.add_field ("pos.type", "fixed");
        _cursor_klass.add_field ("pos.x", _x.to!int);
        _cursor_klass.add_field ("pos.y", _y.to!int);
        dump_klass (_cursor_klass);
    }
}

E*
find_cursor (E* e_scrollbar) {
    return e_scrollbar.find_child ("scrollbar-cursor");
}
