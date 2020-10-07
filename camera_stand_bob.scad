translate([0,0,16])
union() {
    translate([0,0,-8])
    scale([2,2,1])
    cube(17.5, center=true);
    translate([0,0,9])
    difference() {
        scale([2,2,1])
        cube(17.5, center=true);
        translate([-10,0,0])
        scale([2,1,1.1])
        cube(17.5, center=true);
    }
}
