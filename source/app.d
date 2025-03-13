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
	E* root = new_root ();
	root.setup ();
	//root.update ();

	// Check
	//dump_tree (root);
	//dump_klasses (root);

	//
	pix.go (pix,root);
}

void
setup (E* root) {
	create_reserved_classes (root);
	txt_reader.go (root, txt_reader.text);
}

void
create_reserved_classes (E* root) {
	import klasses.e        : E_Klass;
	import klasses.progress : Progress;
	import klasses.button   : Button;
	import klasses.check    : Check;
	import klasses.edit     : Edit;

	root.defined_klasses ~= new_reserved_klass!E_Klass ();
	root.defined_klasses ~= new_reserved_klass!Progress ();
	root.defined_klasses ~= new_reserved_klass!Button ();
	root.defined_klasses ~= new_reserved_klass!Check ();
	root.defined_klasses ~= new_reserved_klass!Edit ();
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

