module klasses.list;

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
List {
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

    Generator!string _gen;
    Template!string  _tpl;
}


// KLASS_EVENT_FN  
void 
event (Klass* kls, Event* ev, E* e) {
    if (ev.type != SDL_MOUSEMOTION)
        writefln ("LIST.event: %s, for: %s", *ev, *e);

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN: break;
        case SDL_MOUSEWHEEL: {
            auto ev_wheel = &ev.wheel;

            // ev_wheel
            //   .x  >0 right    <0 left
            //   .y  >0 forward  <0 back
            //   .direction == SDL_MOUSEWHEEL_NORMAL
            //   .direction == SDL_MOUSEWHEEL_FLIPPED
            //   .mouseX
            //   .mouseY

            if (event_for_me (kls,ev_wheel,e)) {
                writeln ("event_for_me");
                if (ev_wheel.y < 0) {
//                    e.fields ~= new Field ("generator.offset", TString (TString.Type.string,"1"));
                    if (e.generator.offset < e.generator.offset.max) 
                        e.generator.offset += 1;
                }
                else
                if (ev_wheel.y > 0) {
                    if (e.generator.offset >= 1)
                        e.generator.offset -= 1;
                }

                import pix : update;
                import pix : send_e_redraw;
                update (e);
                send_e_redraw (e);
            }

            break;
        }
        case SDL_KEYDOWN: {  // SDL_KeyboardEvent
            if (ev.key.keysym.sym == SDLK_UP) {
                // go up
            }
            if (ev.key.keysym.sym == SDLK_DOWN) {
                // go down
                //   find selected
                //   select next 
                //   update
                //   redraw
            }
            break;
        }
        case SDL_KEYUP: break;
        default:
    }
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


// list
//   childs
//   generator childs  <-- data + template
//     select
//       from generator
//       offset A
//       limit  B
//   generator.s[a..b]
struct
Generator (T) {
    T[] _impl;    // all

    T[] 
    opSlice (size_t dim: 0) (size_t a, size_t b) {
        return _impl[a..b];
    }

    size_t
    length () {
        return _impl.length;
    }
}

struct
Template (T) {
    auto
    opCall () {
        return "";
    }
}

// list
//   childs
//     e vbox text-1
//     e vbox text-2
//     e vbox text-3

// list
//   list.generator  generator-1          // TString[] values
//   list.template   list-template        // ETree*[]  e_tree
//   list.map        image.src text text  // each e,m,v in (tree,map,values) e.set(m,v)
//   list.a          0
//   list.b          10
//   e items
//   e progress
//
// generator-1
//   type delimiter |
//
// generator-2
//   type command delimiter |
//   cmd  commands.player.playlist-display
//
// list-template
//   e icon
//   e number
//   e name
//   childs.map  image.src text text
//
// generator-3
//   type csv 
//   type pdf
//   type json
//   type file
//   type desktop-icons
//   type delimiter
//   type fixed
//
// e-list
//   childs.src         fs
//   childs.src         cmd `command` delimiter |
//   childs.src         csv /path/to/file.csv
//   childs.src.tpl     list-template  ...or childs under t
//   childs.src.tpl.src 1         2    3
//   childs.src.tpl.dst image.src text text  // each e,m,v in (tree,map,values) e.set(m,v)
