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

	 //UTree
	Doc* doc = new_doc ();
	doc.setup ();
	doc.update (doc);

	// Check
	//dump_tree (doc_t);
	//dump_klasses (doc_t);

	//
	pix.go (pix,doc);
}

void
setup (Doc* doc) {
	create_reserved_classes (doc);
	txt_reader.go (doc, txt_reader.text);
}

void
create_reserved_classes (Doc* doc) {
	import klasses.e        : E_Klass;
	import klasses.progress : Progress;
	import klasses.button   : Button;
	import klasses.check    : Check;
	import klasses.edit     : Edit;

	doc.add_child (new_reserved_klass!E_Klass ());
	doc.add_child (new_reserved_klass!Progress ());
	doc.add_child (new_reserved_klass!Button ());
	doc.add_child (new_reserved_klass!Check ());
	doc.add_child (new_reserved_klass!Edit ());
}

Klass*
new_reserved_klass (KLASS) () {
	return cast (Klass*) new KLASS ();
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


// button
//   on mouse-button-pressed  add klass "pressed"
//   on mouse-button-released rem klass "pressed"
// check
//   on click add klass "checked"
//   on click rem klass "checked"
// edit
//   on key ... edit text
// progress
//   drag "progress-cursor"
//   fill bg rect size.w * percent
//   percent `command`
//   on percent `command $percent`
// list
//   childs
//   generator childs  <-- data + template
//     select
//       from generator
//       offset A
//       limit  B
//   generator.s[a..b]

