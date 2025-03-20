module ertee2;
version (asdf):
struct
E {
    Ways ways;
    int  a;
    int  b;
    int  c;
}

E[] e_ray;  // tree in depth in ray
            //   last element is zero
            //   or has global pointer to tree
            //   or flag next-is-able (right-is-able--or--down-is-able)
            //   or 5 bits: left/up/right/dn/stop = 3 bit + is_removed = 1 bit

enum 
Ways : byte {
    _ =  0x0000,  // no way
    d =  0x0001,  // dn
    r =  0x0010,  // right
    u =  0x0100,  // up
    l =  0x1000,  // left  - no able
    x = -1,       // removed, <0
}

E*
right (E* e) {
    auto _e = e;
    auto _dn = 0; // down counter

    select_way:
    switch (_e.ways && 0b0000_1111) {
        case Ways._: return null;
        case Ways.u: goto up;
        case Ways.d: goto dn;     // scan in deep, up, right
        case Ways.r: goto right;
        case Ways.l: return null; // no able
        default:     return null;
    }

    dn:
        _dn++;
        goto next;

    up:
        if (_dn == 0)
            return null;
        else {
            _dn--;
            goto next;
        }

    right:
        if (_dn == 0)
            return _e;  // OK
        else
            goto next;  // wait for up

    next:
        _e = (_e + 1);
    check_removed:
        if (_e.ways < 0)  // removed
            goto next;    // skip
        else
            goto select_way;
}

E*
left (E* e) {
    return null;
}

E*
next (E* e) {
    // right, dn, up
    auto _e = e;

    select_way:
    switch (_e.ways && 0b0000_1111) {
        case Ways._: return null;
        case Ways.u: goto next;
        case Ways.d: goto next; 
        case Ways.r: goto next;
        case Ways.l: return null; // no able
        default:     return null;
    }

    next:
        _e = (_e + 1);
    check_removed:
        if (_e.ways < 0)  // removed
            goto select_way;
        else
            return _e;
}

E*
child (E* e) {
    // right, dn, up
    auto _e = e;

    select_way:
    switch (_e.ways && 0b0000_1111) {
        case Ways._: return null;
        case Ways.u: return null;
        case Ways.d: goto next; 
        case Ways.r: return null;
        case Ways.l: return null; // no able
        default:     return null;
    }

    next:
        _e = (_e + 1);
    check_removed:
        if (_e.ways < 0)  // removed
            goto select_way;
        else
            return _e;
}


//struct
//Path {
//    ubyte d;  // deep
//    ubyte r;  // right
//}

// E path
//   deep,right
//        d,r
//   e    0,0
//     e  1,0
//     e  1,1

// Paths
// relative
// E
//   u
//   l
//   d
//   r
//   is_removed
//   is_hidden
//
