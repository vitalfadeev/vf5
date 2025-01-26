import std.stdio;
import e;
import etree;
import klass;
import pix;
import txt_reader;
import doc;
import events;


void 
main() {
	pix_init ();
	Doc* doc = new Doc ();
	setup (doc);
	doc_apply_klasses (doc);
	doc.update_pos_size ();
	dump_tree (doc.tree);
	dump_klasses (doc.klasses);
	on_start (doc);
	pix_go (doc);
}

void
setup (Doc* doc) {
	txt_reader.go (doc, txt_reader.text);
}


//
void
on_start (Doc* doc) {
    foreach (t; WalkTree (doc.tree))
        _on_start (t.e);
}

void
_on_start (E* e) {
    foreach (_on; e.on) {
        if (_on.event == "start") {
        	exec_action (_on.action);
        }
    }
}



//e
// e
//  e box green rounded
//
// e box green rounded
// "e box green rounded"\n
// "e" "box" "green" "rounded" "\n"
// new_e
//   add_classes "box" "green" "rounded" "\n"

// box
//  boder: 1px solid #ccc
// boder: 1px solid #ccc\n
// "  " boder" ":" " " "1px" " " "solid" " " "#ccc\n" "\n"
// find_e ()
// add_property ( "boder" ":" " " "1px" " " "solid" " " "#ccc\n" "\n" )

// e.pos.x = 100
// on e.pos.x.changed = { ... }
// e
//   pos.x = value
//   on_pos_x_changed ()
//   on_[ID.pos_x]_changed ()

