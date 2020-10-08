module mirror_copy(v = [1, 0, 0]) {
    children();
    mirror(v) children();
}
module hoop_hole_cube() {
    CUBE_LENGTH = 80;
    SHIFT = 5;
    translate([SHIFT,SHIFT,0])
    scale([1,1,1.35])
    cube(CUBE_LENGTH);
}

module hoop() {
    scale([0.75,0.75,1])
    difference() {
        translate([0,0,10])
        linear_extrude()
        circle(75);
        scale([0.9,0.9,2])
        translate([0,0,10])
        linear_extrude()
        circle(75);
        translate([0,0,-15])
        mirror_copy([0,1,0])
        mirror_copy()
        hoop_hole_cube();
        translate([0,0,-79])
        cube(200,center=true);
    }
}
module ball(radius) {
    sphere(radius, $fn = 100);
}


scale([0.75,0.75,0.75])
union() {
    BALL_RADIUS = 22;
    translate([0,0,BALL_RADIUS + 129])
    ball(BALL_RADIUS);

    // Pool
    POOL_RADIUS = 25;
    translate([0,0,32])
    difference() {
    rotate_extrude(convexity = 10)
        translate([100, 0, 0])
        circle(r = POOL_RADIUS, $fn = 100);
    rotate_extrude(convexity = 10)
        translate([96, 10, 0])
        circle(r = POOL_RADIUS, $fn = 100);
    rotate_extrude(convexity = 10)
        translate([105, 10, 10])
        circle(r = POOL_RADIUS, $fn = 100);
    }
    translate([0,0,-40])
    union() {
        HEIGHT_STEP = 40;
        translate([0,0,HEIGHT_STEP])
        resize([160,160,100])
        hoop();
        translate([0,0,1.5 * HEIGHT_STEP])
        resize([70,70,100])
        hoop();
    }
    // hill
    HILL_RADIUS = 85;
    translate([0,0,-23])
    scale([1.2,1.2,0.9])
    difference() {
        sphere(HILL_RADIUS);
        translate([0,0,-HILL_RADIUS + 30])
        cube(2 * HILL_RADIUS, center=true);
    }
}
