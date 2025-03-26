import std.stdio;
import etree;
import e;
import e_update;
import klass;
import types;
import pix;
import events;
import txt_reader;

void 
main () {
	//
	auto pix = new Pix ();
	pix.setup ();

	//UTree
	//E* root = open ("test_1.txt");
	//E* root = open ("test_t3.txt");
	//E* root = open ("test_generator_klass.txt");
	E* root = open ("test_audacious.txt");
	//E* root = open ("test_t9.txt");
	//E* root = open ("test_file_manager.txt");
	writefln ("root: %s, %s", *root, root);
	writefln ("root.parent: %s", root.parent);

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
    auto root = new E ();
    create_reserved_classes (root);
    root.size = Size (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H);
    return root;
}

void
create_reserved_classes (E* root) {
	import klasses.e         : E_Klass;
	import klasses.progress  : Progress;
	import klasses.button    : Button;
	import klasses.check     : Check;
	import klasses.edit      : Edit;
	import klasses.list      : List;
	import klasses.scrollbar : Scrollbar;

	reserved_klasses ~= new_reserved_klass!E_Klass ();
	reserved_klasses ~= new_reserved_klass!Progress ();
	reserved_klasses ~= new_reserved_klass!Button ();
	reserved_klasses ~= new_reserved_klass!Check ();
	reserved_klasses ~= new_reserved_klass!Edit ();
	reserved_klasses ~= new_reserved_klass!List ();
	reserved_klasses ~= new_reserved_klass!Scrollbar ();
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

// path
//   tree + klasses
//
// list
//   path
//
// generator
//   path
//     tree

// TxtGenerator
//   tree + klasses


// App
//   E
//     E
//
// focus
//   event -> from focused -> to up parent 
//
// MouseEvent  -> focus (x,y) -> deepest -> event() -> parent.event()
// ClickEvent  -> focus (x,y) -> deepest -> event() -> parent.event()
// KeyEvent    -> focused                -> event() -> parent.event()
// ScrollEvent ->                        -> event() -> parent.event()
// always up
//
// from up : focus -> deepest -> up
// from dn :                  -> up

