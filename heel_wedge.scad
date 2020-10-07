module wedge() {
    translate([-10,-40,0])
    scale([1,8,0.5])
    cube(10);
    difference() {
        linear_extrude(5)
            scale([3,1,1])
            circle(40);
        translate([70,0,-8])
            linear_extrude(30)
            circle(80);
        translate([0,-50,-10])
            cube(100);
    }
}
module wedge_tilt() {
    translate([0,0,5.1])
    scale([1,2,2])
    rotate([0,-1.1,0])
    wedge();
}
module edge_cutter() {
    mirror([1,0,0])
    scale([10,1,5])
    translate([0,29.43,-5])
    cube(10);
}
difference() {
    translate([7,0,0])
    union() {
        scale([0.75,0.75,1])
        translate([-40,0,0])
        difference()
        {
            wedge();
            wedge_tilt();
        }
        translate([-4,0,0])
        difference()
        {
            translate([-33,0,2.6])
            scale([1,1.035,5.2])
            circle(30);
            translate([0,0,1.5])
            rotate([0,-1,0])
            wedge_tilt();
        }
    }
    edge_cutter();
    mirror([0,1,0])
    edge_cutter();
}
