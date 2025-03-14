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
        writeln ("LIST.EVENT: ", ev.type, " ", (ev.type == SDL_USEREVENT) ? (cast(USER_EVENT)ev.user.code).to!string : "");

    switch (ev.type) {
        case SDL_MOUSEBUTTONDOWN: break;
        case SDL_KEYDOWN: break;
        case SDL_KEYUP: break;
        default:
    }
}

// KLASS_UPDATE_FN 
void 
update (Klass* kls, E* e) {
    //
}

// KLASS_SET_FN
void 
set (Klass* kls, E* e, string field_id, TString[] values) {
    //
}

// KLASS_DRAW_FN
void
draw (Klass* kls, Event* ev, E* e) {
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
