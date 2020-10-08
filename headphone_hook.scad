TABLE_LENGTH = 15;
KNOB_RADIUS = 2 * TABLE_LENGTH;
OFFSET = -10;

module mirror_copy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}

module knob() {
    difference() {
        difference() {
            translate([0,OFFSET,0])
            sphere(KNOB_RADIUS);
            scale([4,4,1])
            cube(TABLE_LENGTH,center=true);
        }
        VERTICAL_HOLE_RADIUS = 7.5;
        VERTICAL_HOLE_HEIGHT = 80;
        HORIZONTAL_HOLE_RADIUS = VERTICAL_HOLE_RADIUS * 0.8;
        HORIZONTAL_HOLE_HEIGHT = VERTICAL_HOLE_HEIGHT;
        translate([0,OFFSET,-VERTICAL_HOLE_HEIGHT / 2])
        cylinder(r=VERTICAL_HOLE_RADIUS, h=VERTICAL_HOLE_HEIGHT);
        // holes
        mirror_copy([1,0,0])
        mirror_copy([0,0,1])
        rotate([90,0,0])
        translate([0.5 * KNOB_RADIUS, 0.5 * KNOB_RADIUS,-HORIZONTAL_HOLE_HEIGHT / 2])
        cylinder(r=HORIZONTAL_HOLE_RADIUS, h=HORIZONTAL_HOLE_HEIGHT);
    }
}
knob();

// todo add hook for headphone
// todo think about making this "generic" different bit and bobs to slid in and out of these knobs for different kinds of storage
