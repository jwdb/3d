difference() {
    union() {
        translate([0.18, -2.4, 0]) cube([23.6, 5, 74], true);
        rotate(5) difference() {
            cube([24, 7, 74], true);
            translate([0, 2, 0]) cube([22, 5, 71.5], true);
        }
    }
    translate([0.18, -3.5, 0]) cube([24.5, 5, 74.5], true);
}
