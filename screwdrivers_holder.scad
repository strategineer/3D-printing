// units are in cm
LENGTH_MULTI = 1.0;

// handle
$fa = 1;
$fs = 0.4;
wheel_radius = 24;
tyre_diameter = 8;
scale([1.5,1,1])
translate([0,0,154])
rotate([90,0,0])
rotate_extrude(angle=360) {
        translate([wheel_radius - tyre_diameter/2, 0])
                circle(d=tyre_diameter);
}

*translate([0,0,135])
rotate([90]) {
    HORI_HANDLE_WIDTH = 50;
    // bottom handle
    cylinder(HORI_HANDLE_WIDTH, 5, 5
    , center=true);
}

// middle rod
translate([0,0,10])
cylinder(125, 5 , 5);

for (i=[0: 60: 300])
rotate(i) {
    // supports
    rotate([90,0,90])
    translate([42 * LENGTH_MULTI,5.25,0])
        cylinder(h=20* LENGTH_MULTI, r=5,center=true);
    
    // struts
    rotate([90,90,90])
    translate([-5,0,0])
        cylinder(h=35* LENGTH_MULTI, r=5);
    // holders
    translate([50* LENGTH_MULTI,0,0])
    difference() {
        HEX_ROT = 60;
        rotate(HEX_ROT) cylinder($fn = 6, h=40, r=17.5* LENGTH_MULTI);
        translate([0,0,5])
        rotate(HEX_ROT) {
            cylinder($fn = 6, h=50, r=15* LENGTH_MULTI);
            cylinder($fn = 6, h=52, r=13* LENGTH_MULTI);
            translate([0,0,-4]) cylinder($fn = 6, h=52, r=11* LENGTH_MULTI);
        }
    }
}
