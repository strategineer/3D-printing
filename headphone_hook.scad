TABLE_LENGTH = 15;
KNOB_RADIUS = 2 * TABLE_LENGTH;
OFFSET = -10;

VERTICAL_HOLE_RADIUS = 10;
VERTICAL_HOLE_HEIGHT = 80;
HORIZONTAL_HOLE_RADIUS = VERTICAL_HOLE_RADIUS * 0.6;
HORIZONTAL_HOLE_HEIGHT = VERTICAL_HOLE_HEIGHT;

module mirror_copy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}

module knob_hole_1() {
    mirror_copy([0,0,1])
    rotate([0,-90,0])
    translate([0.6 * KNOB_RADIUS,-0.3 * KNOB_RADIUS,0.5 * -HORIZONTAL_HOLE_HEIGHT])
    cylinder(r=HORIZONTAL_HOLE_RADIUS * 1.2, h=HORIZONTAL_HOLE_HEIGHT);
}

module knob_hole_2() {
    mirror_copy([1,0,0])
    mirror_copy([0,0,1])
    rotate([90,0,0])
    translate([0.4 * KNOB_RADIUS, 0.55 * KNOB_RADIUS,-HORIZONTAL_HOLE_HEIGHT / 2])
    cylinder(r=HORIZONTAL_HOLE_RADIUS, h=HORIZONTAL_HOLE_HEIGHT);
}

module knob() {
    difference() {
        difference() {
            translate([0,OFFSET,0])
            sphere(KNOB_RADIUS);
            scale([4,4,1])
            cube(TABLE_LENGTH,center=true);
        }
        translate([0,OFFSET,-VERTICAL_HOLE_HEIGHT / 2])
        cylinder(r=VERTICAL_HOLE_RADIUS, h=VERTICAL_HOLE_HEIGHT);
        knob_hole_2();
        knob_hole_1();
    }
}

module headphone_hook() {
    scale([0.95,0.95,0.95])
    knob_hole_2();
    translate([0,80,0])
    sphere(60);
}

union() {
    translate([-35,35,28])
    knob();
    translate([30,-30,139])
    rotate([-90,0,0])
    headphone_hook();
}
// todo add headphone_hook for headphone
// todo think about making this "generic" different bit and bobs to slid in and out of these knobs for different kinds of storage
