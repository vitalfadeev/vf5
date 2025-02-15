import std.stdio;
import e;
import utree;
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
	UTree* doc_t = utree.new_doc ();
	doc_t.setup ();
	doc_t.doc.update (doc_t);

	// Check
	//dump_tree (doc_t);
	//dump_klasses (doc_t);

	//
	pix.go (pix,doc_t);
}

void
setup (UTree* doc_t) {
	create_reserved_classes (doc_t);
	txt_reader.go (doc_t, txt_reader.text);
}

void
create_reserved_classes (UTree* doc_t) {
	import klasses.e        : E_Klass;
	import klasses.progress : Progress;
	import klasses.button   : Button;
	import klasses.check    : Check;
	import klasses.edit     : Edit;

	doc_t.add_child (new_reserved_klass!E_Klass ());
	doc_t.add_child (new_reserved_klass!Progress ());
	doc_t.add_child (new_reserved_klass!Button ());
	doc_t.add_child (new_reserved_klass!Check ());
	doc_t.add_child (new_reserved_klass!Edit ());
}

UTree*
new_reserved_klass (KLASS) () {
	return utree.new_klass!KLASS ();
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

