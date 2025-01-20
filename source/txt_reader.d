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

// RESERVED CLASSES
// input-text
// input-check
// input-radio
// checked
// focused

string text = "
e menubar
 e menubar-item file border
 e menubar-item play border
 e menubar-item list border

menubar
 size 640 32

menubar-item
 size.w auto
 size.h 32

file
 popup file-popup
 pos.x 0
 text  File
 image /home/vf/src/vf5/img/file.png

play
 text Play
 pos.x 65
 image /home/vf/src/vf5/img/play.png
 on click player.play_pause

list
 text List
 image /home/vf/src/vf5/img/list.png
 pos.x 230

hidden
 hidden 1

border
 borders 2 solid #cfc

e popup file-popup hidden
 e open
 e open-url
 e quit

input-radio
 input.type radio
 input.radio.group 1
 input.radio.checkd 0
";

string txt2 = "
window
 title App
 size 640 480
 pos 10 10
 pos center
 fullscreen 1
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

            auto t = new ETree (new E ());
            doc.tree.add_child (t);
            current_t = t;
            current_klass = null;

            foreach (tt; t_line[1..$])
                if (tt.type == Token.Type.string)
                    current_t.e.klasses ~= doc.find_klass_or_create (tt.s);
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
