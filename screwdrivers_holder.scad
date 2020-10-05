// units are in cm

for (i=[0: 60: 300])
rotate(i) {
    rotate([90,0,0])
        cylinder(h=4, r=0.5);
    translate([5,0,0])
    cube(1,5);
    translate([5,0,0])
    difference() {
        HEX_ROT = 60;
        rotate(HEX_ROT) cylinder($fn = 6, h=4, r=1.75);
        translate([0,0,.5]) rotate(HEX_ROT) cylinder($fn = 6, h=5, r=1.5);
        translate([0,0,.5]) rotate(HEX_ROT) cylinder($fn = 6, h=5.2, r=1.30);
        }
 }