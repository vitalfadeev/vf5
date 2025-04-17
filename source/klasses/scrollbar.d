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
    switch (ev.type) {
        case SDL_USEREVENT:
            switch (ev.user.code) {
                case USER_EVENT.scroll_up_request      : .event (kls,&ev._user.scroll_up_request,e); break;
                case USER_EVENT.scroll_dn_request      : .event (kls,&ev._user.scroll_dn_request,e); break;
                case USER_EVENT.scroll_page_up_request : .event (kls,&ev._user.scroll_page_up_request,e); break;
                case USER_EVENT.scroll_page_dn_request : .event (kls,&ev._user.scroll_page_dn_request,e); break;
                case USER_EVENT.scroll_start_request   : .event (kls,&ev._user.scroll_start_request,e); break;
                case USER_EVENT.scroll_end_request     : .event (kls,&ev._user.scroll_end_request,e); break;
                case USER_EVENT.scroll_percent_request : .event (kls,&ev._user.scroll_percent_request,e); break;
                case USER_EVENT.update_scrollbar       : .event (kls,&ev._user.update_scrollbar,e); break;
                default:
            }
            break;

        default:
    }
}
void 
event (Klass* kls, scroll_up_request_UserEvent* ev, E* e) {
    //
}
void 
event (Klass* kls, scroll_dn_request_UserEvent* ev, E* e) {
    //
}
void 
event (Klass* kls, scroll_page_up_request_UserEvent* ev, E* e) {
    //
}
void 
event (Klass* kls, scroll_page_dn_request_UserEvent* ev, E* e) {
    //
}
void 
event (Klass* kls, scroll_start_request_UserEvent* ev, E* e) {
    //
}
void 
event (Klass* kls, scroll_end_request_UserEvent* ev, E* e) {
    //
}
void 
event (Klass* kls, scroll_percent_request_UserEvent* ev, E* e) {
    //
}
void 
event (Klass* kls, update_scrollbar_UserEvent* ev, E* e) {
    scrollbar_update (e, ev.pos_percent, ev.size_percent);
}


// KLASS_UPDATE_FN 
void 
update (Klass* kls, update_UserEvent* ev, E* e) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (Klass* kls, draw_UserEvent* ev, E* e) {
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
scrollbar_update (E* e_scrollbar, Klasses* klasse, byte pos_percent, byte size_percent) {
    // total,offset
    //   cursor position
    // limit
    //   cursor size
    auto cursor = e_scrollbar.find_cursor ();
    if (cursor !is null) {
        //
        // new cursor klass
        // add new cursor klass to cursor
        // add new cursor class fields
        // ower of klass - scrollbar
        //
        // cursor-klass-XXX
        //   pos.y AAA
        //

        // cursor
        //   .pos.balance = 1
        //
        // kls
        //   .pos.balance = 1

        //auto _cursor_klass = &e_scrollbar.cursor_klass;
        auto _cursor_klass = 
            klasses [format!"scrollbar-cursor-%X" (e_scrollbar)];

        if (!cursor.has_klass (_cursor_klass))
            cursor.add_klass (_cursor_klass);

        auto balance = pos_percent;
        _cursor_klass.add_field ("pos.type", "t9");
        _cursor_klass.add_field ("pos.balance", balance.to!byte);
        _cursor_klass.add_field ("pos.group", "4");
    }
}

E*
find_cursor (E* e_scrollbar) {
    return e_scrollbar.find_child ("scrollbar-cursor");
}
