// units are in cm
LENGTH_MULTI = 1.0;

// todo handle
translate([0,0,14])
rotate([90]) {
    HORI_HANDLE_WIDTH = 9.5;
    // bottom handle
    cylinder(HORI_HANDLE_WIDTH , center=true);
    // top handle
    translate([0,5,0])
    cylinder(HORI_HANDLE_WIDTH , center=true);
    // side handle
    rotate([90,0,0]) 
    translate([0,0,0]){
        VERT_HANDLE_WIDTH = 6;
        translate([0,3.5,-2.5])
        cylinder(VERT_HANDLE_WIDTH, center=true);
        translate([0,-3.5,-2.5])
        cylinder(VERT_HANDLE_WIDTH,center=true);
    }
}

// middle rod
translate([0,0,1.5])
cylinder(12);

for (i=[0: 60: 300])
rotate(i) {
    // supports
    rotate([90,0,90])
    translate([4.2 * LENGTH_MULTI,2,0])
        cylinder(h=2* LENGTH_MULTI, r=0.5,center=true);
    
    // struts
    rotate([90,90,90])
    translate([-2,0,0])
        cylinder(h=3.5* LENGTH_MULTI, r=0.5);
    // holders
    translate([5* LENGTH_MULTI,0,0])
    difference() {
        HEX_ROT = 60;
        rotate(HEX_ROT) cylinder($fn = 6, h=4, r=1.75* LENGTH_MULTI);
        translate([0,0,.5]) rotate(HEX_ROT) cylinder($fn = 6, h=5, r=1.5* LENGTH_MULTI);
        translate([0,0,.5]) rotate(HEX_ROT) cylinder($fn = 6, h=5.2, r=1.30* LENGTH_MULTI);
        }
 }