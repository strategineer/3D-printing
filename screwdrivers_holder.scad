// units are in cm
LENGTH_MULTI = 1.0;

// todo handle
translate([0,0,135])
rotate([90]) {
    HORI_HANDLE_WIDTH = 85;
    // bottom handle
    cylinder(HORI_HANDLE_WIDTH, 10, 10, center=true);
    // top handle
    translate([0,50,0])
    cylinder(HORI_HANDLE_WIDTH, 10, 10 , center=true);
    // side handle
    rotate([90,0,0]) 
    translate([0,0,0]){
        VERT_HANDLE_WIDTH = 60;
        translate([0,35,-25])
        cylinder(VERT_HANDLE_WIDTH, 5, 5, center=true);
        translate([0,-35,-25])
        cylinder(VERT_HANDLE_WIDTH, 5, 5,center=true);
    }
}

// middle rod
translate([0,0,15])
cylinder(120, 10,10);

for (i=[0: 60: 300])
rotate(i) {
    // supports
    rotate([90,0,90])
    translate([42 * LENGTH_MULTI,20,0])
        cylinder(h=20* LENGTH_MULTI, r=5,center=true);
    
    // struts
    rotate([90,90,90])
    translate([-20,0,0])
        cylinder(h=35* LENGTH_MULTI, r=5);
    // holders
    translate([50* LENGTH_MULTI,0,0])
    difference() {
        HEX_ROT = 60;
        rotate(HEX_ROT) cylinder($fn = 6, h=40, r=17.5* LENGTH_MULTI);
        translate([0,0,5]) rotate(HEX_ROT) cylinder($fn = 6, h=50, r=15* LENGTH_MULTI);
        translate([0,0,5]) rotate(HEX_ROT) cylinder($fn = 6, h=52, r=13* LENGTH_MULTI);
        }
 }