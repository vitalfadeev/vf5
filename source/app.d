import std.stdio;
import e;
import etree;
import klass;
import pix;
import txt_reader;
import doc;
import events;


void 
main () {
	//
	auto pix = new Pix ();
	pix.setup ();

	//
	Doc* doc = new Doc ();
	doc.setup ();
	doc.update (doc);
	//dump_tree (doc.tree);
	//dump_klasses (doc.klasses);

	//
	pix.go (pix,doc);
}

void
setup (Doc* doc) {
	doc.create_reserved_classes ();
	txt_reader.go (doc, txt_reader.text);
}

void
create_reserved_classes (Doc* doc) {
	import klasses.e        : E_Klass;
	import klasses.progress : Progress;

	doc.add_klass (cast (Klass*) (new E_Klass ()));
	doc.add_klass (cast (Klass*) (new Progress ()));
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

