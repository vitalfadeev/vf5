import std.stdio;
import etree;
import e;
import e_update;
import e_root;
import klass;
import pix;
import txt_reader;
import events;


void 
main () {
	//
	auto pix = new Pix ();
	pix.setup ();

	//UTree
	//E* root = open ("test_1.txt");
	E* root = open ("test_file_manager.txt");

	// Check
	//dump_tree (root);
	//dump_klasses (root);

	//
	pix.go (root);
}

E*
open (string file_name) {
	import std.file;
	E* root = new_root ();
	txt_reader.go (root, file_name.readText);
	return root;
}

E*
new_root () {
	import types;
    auto root = new E ();
    create_reserved_classes (root);
    root.size = Size (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H);
    return root;
}

void
create_reserved_classes (E* root) {
	import klasses.e        : E_Klass;
	import klasses.progress : Progress;
	import klasses.button   : Button;
	import klasses.check    : Check;
	import klasses.edit     : Edit;

	reserved_klasses ~= new_reserved_klass!E_Klass ();
	reserved_klasses ~= new_reserved_klass!Progress ();
	reserved_klasses ~= new_reserved_klass!Button ();
	reserved_klasses ~= new_reserved_klass!Check ();
	reserved_klasses ~= new_reserved_klass!Edit ();
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

