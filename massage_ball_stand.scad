HEIGHT = 10;
module cone() {
    translate([0,0,HEIGHT])
    mirror([0,0,1])
    linear_extrude(HEIGHT, scale=[0.5,0.5])
    circle(40);
}
scale([1.1,1.1,1])
translate([0,0,HEIGHT])
union() {
    difference() {
        cone();
        translate([0,0,2])
        scale([1.2,1.2,2])
        cone();
    }
    mirror([0,0,1])
        cone();
}
