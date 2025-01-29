module txt_reader;

import std.stdio;
import std.conv;
import txt_token;
import txt_syntax;
import doc;
import e;
import etree;
import klass;

// RESERVED
// e
// import
// map

// RESERVED CLASSES
// input-text
// input-check
// input-radio
// checked
// focused
// hotkeys
// colors
// commands

// `external program` -> os.execute (["external","program"], NO_WAIT)
// internal.command   -> send       ("internal.command")

// plugin
//  on player.prev ...

string text = "
e root
 e vbox menubar
  e menubar-item border t9-top-left file
  e menubar-item border t9-top-left play
  e menubar-item border t9-top-left list
  e menubar-item border t9-top-left services
  e menubar-item border t9-top-left output
  e menubar-item border t9-top-left view

 e vbox toolbar
  e toolbar-item t9-top-left  tb-search
  e toolbar-item t9-top-left  tb-open
  e toolbar-item t9-top-left  tb-add
  e toolbar-item t9-top-left  tb-prev
  e toolbar-item t9-top-left  tb-play-pause
  e toolbar-item t9-top-left  tb-stio
  e toolbar-item t9-top-left  tb-next
  e toolbar-item t9-top-left  tb-position
  e toolbar-item t9-top-right tb-time
  e toolbar-item t9-top-right tb-loop
  e toolbar-item t9-top-right tb-random
  e toolbar-item t9-top-right tb-volume

 e vbox playlist
 e vbox info

 e vbox statusbar
  e t9-bottom-left  song-file-format
  e t9-bottom-right song-time

 e popup file-popup hidden
  e open
  e open-url
  e quit

root
 bg #000
 on start commands.player.start

menubar
 size    640 32
 borders 0 none colors.fg+1

menubar-item
 size.w         content
 size.h         32
 content.size   text
 text.color     colors.fg
 bg             colors.bg

toolbar
 size    640 32
 pos     0 32
 borders 0 none colors.fg+1

toolbar-item
 size.w        32
 size.h        32
 text.pos.type 9
 text.group    9
 text.dir      r
 text.color    colors.fg+1
 bg            colors.bg-1

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
 pos.type  vbox d

hidden
 hidden 1

border
 borders 2 solid colors.fg+1

focused
 borders 2 solid colors.info

input-radio
 input.type         radio
 input.radio.group  1
 input.radio.checkd 0

colors
  fg       #eee
  bg       #222
  fg+1     #e8e8e8
  fg-1     #d8d8d8
  bg+1     #282828
  bg-1     #181818
  focused  #0F0DBF
  info     #0c0
  warn     #cc0
  error    #c00

commands
  player.start      audacious
  player.prev       audtool playlist-reverse
  player.play_pause audtool playback-playpause
  player.stop       audtool playback-stop
  player.next       audtool playlist-advance

hotkeys
  x commands.player.prev
  c commands.player.play_pause
  v commands.player.stop
  b commands.player.next

// comment 1
// comment 2
";

string txt2 = "
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

colors
  primary
  secondary
  primary+1
  primary-1
  secondary+1
  secondary-1
  info
  warn
  error

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

status
  inherit_from status-`audtool playback-status`

status-plaing  
  fg green

status-paused
  fg yellow

status-stopped
  fg red

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
";

void
go (Doc* doc, string s) {
    ETree* current_t;
    Klass* current_klass;

    auto reader = Token_line_reader (s);
    foreach (t_line; reader) {
        writeln (t_line);

        if (t_line[0].type == Token.Type.string)
        if (t_line[0].s    == "e") {
            // e
            // create e
            // add classes

            // only first e
            if (doc.tree is null) {
                auto t = new ETree (new E ());
                doc.tree = t;
                current_t = t;
                current_klass = null;

                foreach (tt; t_line[1..$])
                    if (tt.type == Token.Type.string)
                        current_t.e.klasses ~= doc.find_klass_or_create (tt.s);
            }
            else {
                // skip 2, 3... e
            }
        }

        if (t_line[0].type == Token.Type.string)
        if (t_line[0].s    != "e") {
            // class_name
            // check class exist
            // create new class
            auto klass = doc.find_klass_or_create (t_line[0].s);
            current_klass = klass;
            current_t = null;
        }

        if (t_line[0].type == Token.Type.spaces)
        if (t_line[1].type == Token.Type.string)
        if (t_line[1].s    == "e") {
            // sub e
            // find parent e  in tree  from last e
            //   create sub e
            //   add classes
            auto parent_t = find_parent_t (current_t, t_line[0].s.length.to!ubyte);
            if (parent_t !is null) {
                auto t = new ETree (new E ());
                t.indent = t_line[0].s.length.to!ubyte;
                parent_t.add_child (t);
                current_t = t;
                current_klass = null;
            }

            foreach (tt; t_line[2..$])
                if (tt.type == Token.Type.string)
                    current_t.e.klasses ~= doc.find_klass_or_create (tt.s);
        }

        if (t_line[0].type == Token.Type.spaces)
        if (t_line[1].type == Token.Type.string)
        if (t_line[1].s    != "e") {
            // sub property
            // find parent classs
            //   create sub property
            if (current_klass !is null) {
                string[] values;
                foreach (tt; t_line[2..$])
                    if (tt.type == Token.Type.string)
                        values ~= tt.s;
                current_klass.klasse ~= KlassE (t_line[1].s, values);
            }
        }
    }
}


ETree*
find_parent_t (ETree* current_t, ubyte for_indent) {
    if (current_t is null)
        return null;

    if (current_t.indent < for_indent)
        return current_t;

    if (current_t.indent == for_indent)
        return current_t.parent;

    if (current_t.indent > for_indent)
        while (current_t.parent !is null && current_t.indent > for_indent)
            current_t = current_t.parent;
        return current_t;

    return null;
}
