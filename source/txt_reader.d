module txt_reader;

import std.stdio;
import std.conv;
import tstring;
import txt_token;
import txt_syntax;
import doc;
import e;
import etree;
import klass;
import field;

// RESERVED
// e
// import
// map

// RESERVED CLASSES
// e
// button
// button.pressed
// check
// check.pressed
// edit
// progress
//
// radio
// focused
// button-hover
// hotkeys
// colors
// commands

// `external program` -> os.execute (["external","program"], NO_WAIT)
// internal.command   -> send       ("internal.command")

// plugin
//  on player.prev ...

string text1 = "
e root
  e rect

rect
  pos          10 10
  size         200 64
  content.size 200 64
  pad          10
  pad.bg       #008
  borders      2 solid #ccc
  text         `123 abc`
  text.fg      #ccc
  text.font    /home/vf/src/vf5/img/PTSansCaption-Regular.ttf 16
//comment
";

string text = "
e root
 e vbox menubar
  e menubar-item border hbox file  
  e menubar-item border hbox play 
  e menubar-item border hbox list 
  e menubar-item border hbox services 
  e menubar-item border hbox output
  e menubar-item border hbox view

 e vbox toolbar
  e toolbar-item hbox button tb-search
  e toolbar-item hbox button tb-open
  e toolbar-item hbox button tb-add
  e toolbar-item hbox button tb-prev
  e toolbar-item hbox button tb-play-pause
  e toolbar-item hbox button tb-stop
  e toolbar-item hbox button tb-next
  e toolbar-item hbox progress tb-position
    e progress-current
  e toolbar-item t3-right button tb-time 
  e toolbar-item t3-right button tb-loop
  e toolbar-item t3-right button tb-random
  e toolbar-item t3-right button tb-volume

 e vbox playlist
 e vbox info

 e vbox statusbar
  e t3-left  song-file-format
  e t3-right song-time

 e popup file-popup hidden
  e open
  e open-url
  e quit

root
 bg           #000
 size         parent
 content.size e
 on start     commands.player.start

menubar
 size         parent content
 content.size childs
 borders      10 solid colors.warn

menubar-item
 size         content
 content.size text
 pad          20 5
 pad.bg       colors.pad_bg
 text.fg      colors.fg
 text.bg      colors.bg

toolbar
 size         parent content
 content.size e childs
 borders      10 solid colors.error

toolbar-item
 size         content
 content.size 32 32
 pad          5 5
 pad.bg       colors.pad_bg
 borders      1 solid colors.fg+1

button.pressed
 pad.bg       tcb +0 +0 -32
 content.bg   tcb +0 +0 -32

button-hover
 pad.bg       tcb +0 +0 +32
 content.bg   tcb +0 +0 +32
 //content.bg   tcb +0 +0 +25 fast
 //content.bg   tcb +0 +0 +25 slow

playlist
 size               parent 240
 borders            10 solid #ccc
 childs.src         cmd `command` delimiter |
 childs.src.tpl     list-template  ...or childs under t
 childs.src.tpl.src 1         2    3
 childs.src.tpl.dst image.src text text  // each e,m,v in (tree,map,values) e.set(m,v)

list-template
  e icon
  e number
  e name

info
 size         parent 64
 borders      1 solid #888
 pad          10 5
 text         `commands.player.current-song`
 text.font    /home/vf/src/vf5/img/PTSansCaption-Regular.ttf 16

statusbar
 size         parent 32
 content.size e
 borders      1 solid #444

song-file-format
 size         content
 content.size text
 text         `commands.player.current-song-frequency-khz` kHz `commands.player.current-song-bitrate-kbps` kbit/sec

song-time
 size         content
 content.size text
 text         `commands.player.current-song-length`

file
 text  Файл
 popup file-popup

play
 text Воспроизведение
 on click commands.player.play_pause

list
 text Список

services
 text Службы

output
 text Вывод

view
 text Вид

tb-search
 image /home/vf/src/vf5/img/search.png

tb-open
 image /home/vf/src/vf5/img/open.png

tb-add
  image /home/vf/src/vf5/img/add.png
  on click commands.player.filebrowser-show

tb-prev
  image /home/vf/src/vf5/img/prev.png
  on click commands.player.prev

tb-play-pause
 switch `commands.player.status`
   playing
     image /home/vf/src/vf5/img/pause.png
     on click commands.player.play_pause
   paused
     image /home/vf/src/vf5/img/play.png
     on click commands.player.play_pause
   default
     image /home/vf/src/vf5/img/play.png
     on click commands.player.play

tb-stop
  image /home/vf/src/vf5/img/stop.png
  on click commands.player.stop

tb-next
  image /home/vf/src/vf5/img/next.png
  on click commands.player.next

tb-position
  //text position
  content.size.w childs

progress
  size max parent
  //progress.position `player.current-song-output-length`
  //on position `audtool playback-seek %s` total*position
  //on position `audtool-playback-seek.sh %s` position
  //env position = ...
  //  on position `audtool-playback-seek.sh`
  on progress.position /home/vf/src/vf5/bin/audtool-playback-seek.sh
  borders       8 solid colors.blue

progress-current
  size          16 parent
  pos           `commands.player.audtool-playback-position`%
  bg            colors.blue
  borders       2 solid colors.blue

tb-time 
  content.size.w text
  text `commands.player.current-song-output-length` / `commands.player.current-song-length`

tb-loop
  image /home/vf/src/vf5/img/loop.png

tb-random
  image /home/vf/src/vf5/img/random.png

tb-volume
  image /home/vf/src/vf5/img/volume.png

t3-left
 pos.type  3
 pos.group 1
 pos.dir   r

t3-center
 pos.type  3
 pos.group 2
 pos.dir   r

t3-right
 pos.type  3
 pos.group 3
 pos.dir   r

t9-top-left
 pos.type  9
 pos.group 1
 pos.dir   r

t9-top-right
 pos.type  9
 pos.group 3
 pos.dir   r

t9-center-left
 pos.type  9
 pos.group 8
 pos.dir   r

t9-bottom-left
 pos.type  9
 pos.group 7
 pos.dir   r

t9-bottom-right
 pos.type  9
 pos.group 4
 pos.dir   r

vbox
 pos.type  vbox b

hbox
 pos.type  hbox r

hidden
 hidden 1

border
 borders 2 solid colors.fg+1

focused
 borders.color colors.focused

input-radio
 input.type         radio
 input.radio.group  1
 input.radio.checkd 0

colors
  fg       #eee
  fg+1     #e8e8e8
  fg-1     #d8d8d8
  bg       #222
  bg+1     #282828
  bg-1     #181818
  pad_bg   #282
  focused  #0F0DBF
  info     #0c0
  warn     #cc0
  error    #c00
  red      #c00 
  green    #0c0 
  blue     #00c 

commands
  player.start                      audacious
  player.prev                       audtool playlist-reverse
  player.play                       audtool playback-play
  player.play_pause                 audtool playback-playpause
  player.stop                       audtool playback-stop
  player.next                       audtool playlist-advance
  player.filebrowser-show           audtool filebrowser-show
  player.song                       audtool current-song
  player.current-song               audtool current-song
  player.current-song-length        audtool current-song-length
  player.current-song-output-length audtool current-song-output-length
  player.current-song-frequency-khz audtool current-song-frequency-khz
  player.current-song-bitrate-kbps  audtool current-song-bitrate-kbps
  player.status                     audtool playback-status
  player.audtool-playback-position  /home/vf/src/vf5/bin/audtool-playback-position.sh
  player.playlist-display           audtool playlist-display

hotkeys
  x commands.player.prev
  c commands.player.play_pause
  v commands.player.stop
  b commands.player.next

// comment 1
// comment 2
";

string txt2 = "
image_folder /home/vf/src/vf5/img
klass_folder /home/vf/src/vf5/klasses
import_folder .
import_folder `echo $PWD`
import_folder `pwd`
import_folder /home/vf/src/vf5

image /home/vf/src/vf5/img/file.png
image /home/vf/src/vf5/img/play.png
image /home/vf/src/vf5/img/list.png

window
 title App
 size 640 480
 pos 10 10
 pos center
 fullscreen 1

e
 e file-browser
  e file-browser-item
  e file-browser-item
  e file-browser-item
  e file-browser-item

file-browser-item
 pos.type grid
 pos.dir  r
 size 32 32
 borders 2 solid #cfc

map
       text image                         on
 File  File /home/vf/src/vf5/img/file.png 
 Play  Play /home/vf/src/vf5/img/play.png click player.play_pause
 List  List /home/vf/src/vf5/img/list.png

// a extend b extend c
a b c
 fg primary
 bg bg

b c
 fg #ccc
 bg #222

c
 fg #fff
 bg #000

e
 e title
 e button status

title
  text `audtool current-song`

Play
  pos      t9 1 r
  text     play
  text.pos t9 1 r  // comment. type t9, group 1, dir r

input-text
  hotkey ctr-+a select.all
  hotkey ctrl-alt-x player.prev
  hotkey ctrl-alt-c `audtool playback-playpause`
  hotkey ctrl-alt-v player.stop
  hotkey ctrl-alt-b player.next

import ./other_colors
import ./other_commands

commands
  player.prev                       audtool playlist-reverse
  player.prev.undo                  player.next
  player.next                       audtool playlist-advance
  player.next.undo                  player.prev

update.links
  tb-play-pause
    commands.player.play_pause
    tb-stop

forms
  border-form    
  border-form ┌─┐ │ │ └─┘
  border-form ╓─╖ ║ ║ ╙─╜ 
  border-form ╒═╕ │ │ ╘═╛
  border-form ╔═╗ ║ ║ ╚═╝
  border-form ░
  border-form ▒
  border-form ▓
  border-form █
  border-form ▄▄▄ ▌ ▐ ▀▀▀
  border-form ▀
  border-form ⊂ ⊃
  border-form ( )
  border-form [ ]
  border-form { }
  border-form / /
  border-form | |
  border-form ‿ ⁀
  border-form 
  border-form ⁐
  border-form 
  border-form ⁓
  border-form ∿
  border-form :
  border-form ⁝
  border-form ⁞
  border-form ∏
  border-form ∐
  border-form ∧
  border-form ∨
  border-form ∩
  border-form ∪
  border-form ≈
  border-form ⌇
  border-form ⎛
  border-form ⎝
  border-form ⎞
  border-form ⎠
  border-form ⎨
  border-form ⎬
  border-form ◸
  border-form ◺
  border-form ◹
  border-form ◿
  border-form 
  border-form-1 ┌─┐
  border-form-2 │ │
  border-form-3 └─┘
  border-form-1 ╔═╗
  border-form-2 ║ ║
  border-form-3 ╚═╝
  border-form-1 ╔═╗
  border-form-2 ║ ║
  border-form-3 ║ ║


";

void 
go (Doc* doc, string s) {
    size_t    indent;
    string    name;
    TString[] values;
    Indent[]  indents;
    ETree*    t;
    Klass*    kls;
    Field*    field;

    foreach (t_line; Token_line_reader (s)) {
        // indent, name, values
        indent        = 0;
        name.length   = 0;
        values.length = 0;
        foreach (ts; t_line) {
            switch (ts.type) {
                case TString.Type.indent  : indent = ts.s.length; break;
                case TString.Type.name    : name   = ts.s; break;
                case TString.Type.comment : continue;
                case TString.Type.none    : continue;
                case TString.Type.cr      : continue;
                default: values ~= ts;
            }
        }

        // e
        if (name == "e" && indent == 0) { 
            t = new_e (doc,values);
            doc.add_e (t);
            indents.length = 0;
            indents ~= Indent (t,indent);
        }

        // sub e
        else
        if (name == "e" && indent >= 1) { 
            auto _ind = indents.find_parent (indent);
            assert (_ind !is null);
            switch (_ind.type) {
                case Indent.Type.doc   : 
                    t = new_child_e (doc,values);
                    .doc.add_child (_ind.doc,t); 
                    break;
                case Indent.Type.klass : 
                    .klass.add_child (_ind.klass,new Field (name,values)); 
                    break;
                case Indent.Type.field : 
                    .field.add_child (_ind.field,new Field (name,values)); 
                    break;
                case Indent.Type.e     : 
                    t = new_child_e (doc,values);
                    _ind.t.add_child (t); 
                    break;
                default: assert (0);
            }        
            indents ~= Indent (t,indent);
        }

        // klass
        else
        if (name != "e" && indent == 0) { 
            kls = new_klass (doc,name,values);
            // added
            indents.length = 0;
            indents ~= Indent (kls,indent);
        }

        // field swicth case
        else
        if (name != "e" && indent >= 1) { 
            auto parent_ind = indents.find_parent (indent);
            assert (parent_ind !is null);

            field = new Field (name,values);
            switch (parent_ind.type) {
                case Indent.Type.klass : .klass.add_child (parent_ind.klass,field); break;
                case Indent.Type.field : .field.add_child (parent_ind.field,field); break;
                default: writeln (parent_ind.type); assert (0);
            }        
            indents ~= Indent (field,indent);
        }
    }
}

struct
Indent {
    Type type;
    union {
        Doc*      doc;
        Klass*    klass;
        Field*    field;
        ETree*    t;
    } 
    size_t indent;

    enum 
    Type {
        doc,
        klass,
        field,
        e,
    }

    this (Doc* doc, size_t indent) {
        this.type   = Type.doc;
        this.doc    = doc;
        this.indent = indent;
    }

    this (Klass* kls, size_t indent) {
        this.type   = Type.klass;
        this.klass  = kls;
        this.indent = indent;
    }

    this (Field* field, size_t indent) {
        this.type   = Type.field;
        this.field  = field;
        this.indent = indent;
    }

    this (ETree* t, size_t indent) {
        this.type   = Type.e;
        this.t      = t;
        this.indent = indent;
    }

    string
    toString () {
        return "Indent ("~ type.to!string ~ "," ~ indent.to!string ~")";
    }
}


Indent*
find_parent (ref Indent[] indents, size_t for_indent) {
    while (indents.length != 0) {
        auto _ind = &indents[$-1];

        if (_ind.indent <  for_indent)
            return _ind;  // OK

        if (_ind.indent >= for_indent)
            indents.length --;
    }

    return null;
}

auto
new_doc () {
    return new Doc ();
}

auto
new_e (Doc* doc, TString[] values) {
    return new_child_e (doc,values);
}


Klass*
new_klass (Doc* doc, string name, TString[] values) {
    auto kls = find_klass_or_create (doc,name);

    // setup parents
    //   values

    return kls;    
}


//ETree*
//find_parent_t (ETree* current_t, size_t for_indent) {
//    if (current_t is null)
//        return null;

//    if (current_t.indent < for_indent)
//        return current_t;

//    if (current_t.indent == for_indent)
//        return current_t.parent;

//    if (current_t.indent > for_indent) {
//        loop:
//            current_t = current_t.parent;
//            if (current_t is null) 
//                return null;
//            if (current_t.indent == for_indent)
//                return current_t.parent;
//            if (current_t.indent > for_indent)
//                goto loop;

//        return current_t;
//    }

//    return null;
//}
