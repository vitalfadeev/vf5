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
	doc.tree = new ETree ();
	setup (doc);
	tree_apply_klasses (doc.tree);
	dump_tree (doc.tree);
	dump_klasses (doc.klasses);
	pix.go (doc);
}

void
setup (Doc* doc) {
	txt_reader.go (doc, txt_reader.text);
}

//
void
tree_apply_klasses (Tree) (Tree* tree) {
	foreach (t; WalkTree (tree))
	    if (t.e !is null )
	        apply_klasses (t.e);
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
