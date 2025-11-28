$fn=100;

difference() {
        minkowski() { 
            cube([55,20,12], center=true);
            cylinder(r=10,h=1);
        } 
    translate([30,0,9]) cylinder(h=9, d1=6.5, d2=30, center=true);
    translate([30,0,0]) cylinder(h=60, d=6.5, center=true);
    translate([-30,0,0]) cylinder(h=60, d=6.5, center=true);
    translate([-30,0,9]) cylinder(h=9, d1=6.5, d2=30, center=true);

    rotate([0,0,90]) {
        translate([15,0,-6]) cylinder(h=3, d1=5.5, d2=5.5, center=true);
        translate([15,0,0]) cylinder(h=20, d=3.5, center=true);
        translate([-15,0,0]) cylinder(h=20, d=3.5, center=true);
        translate([-15,0,-6]) cylinder(h=3, d1=5.5, d2=5.5, center=true);
    }
}
