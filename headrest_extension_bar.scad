length = 82.4;
holeRadius = 2.8;
width = 4.5;
depth = 6;

$fn=50;
difference() {
    minkowski() {
        cube([length, width-2, depth/6]);
        cylinder(h=depth/6, r=7);
        rotate([90,0,0]) cylinder(h=depth/6, r=2);
    }
    translate([0,((width-3)/2),-2]) cylinder(h=depth, r=holeRadius);
    translate([length,((width-3)/2),-2]) cylinder(h=depth, r=holeRadius);
}
