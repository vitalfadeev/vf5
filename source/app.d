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
main (string[] args) {
	E       root;
	Klasses klasses;

	init_reserved_classes (&klasses);

	//UTree
	//E* root = open ("test_1.txt");
	//E* root = open ("test_3.txt");
	//E* root = open ("test_t3.txt");
	//E* root = open ("test_generator_klass.txt");
	//E* root = open ("test_audacious.txt");
	auto file = TreeFile ("test_t9.txt");
	//E* root = open ("test_file_manager.txt");

	root     = file.root;
	klasses ~= file.klasses;

	// Check
	//dump_tree (root);
	//dump_klasses (root);

	//
	auto events = Events (args);

	//
	Pix (args)
		.go (&events,&root,&klasses);
}

struct
TreeFile {
    string  name;
    E       root = E (Length (DEFAULT_WINDOW_W,DEFAULT_WINDOW_H));
    Klasses klasses;

    this (string name) {
    	this.name = name;
    	_open ();
    }

	void
	_open () {
		import std.file : readText;
		txt_reader.go (&root,&klasses,name.readText);
	}
}

void
init_reserved_classes (Klasses* klasses) {
	import klasses.e         : E_Klass;
	import klasses.progress  : Progress;
	import klasses.button    : Button;
	import klasses.check     : Check;
	import klasses.edit      : Edit;
	import klasses.list      : List;
	import klasses.scrollbar : Scrollbar;

	reserved_klasses ~= cast (Klass*) new E_Klass ();
	reserved_klasses ~= cast (Klass*) new Progress ();
	reserved_klasses ~= cast (Klass*) new Button ();
	reserved_klasses ~= cast (Klass*) new Check ();
	reserved_klasses ~= cast (Klass*) new Edit ();
	reserved_klasses ~= cast (Klass*) new List ();
	reserved_klasses ~= cast (Klass*) new Scrollbar ();
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

