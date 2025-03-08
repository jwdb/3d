$fn=25;
module holder() {

    minkowski()
    {
        translate([1,2,8]) rotate([55,45]) cube([10,22,1]);
        cylinder(h=1, r=1);
    }
     translate([2,0,8]) rotate([0,45,0]) cube([9,5,5]);
}

union() {
    holder();
    
    translate([0,0,60]) rotate([0,90,0]) holder();

    translate([60,0,60]) rotate([0,180,0]) holder();

    translate([60,0,0]) rotate([0,270,0]) holder();

    minkowski()
    {
        difference() {
            cube([60,5,60]);
            translate([1,0,1]) cube([58,5,58]);
        }
        difference() {
            sphere(r=4);
            translate([-5,-7.5,-5]) cube([10,7.5,10]);
        }
    }
    
    difference() {
        translate([30,13,30]) rotate([90,0,180]) cylinder(h=28, r1=17, r2=27);
        translate([30,13,30]) rotate([90,0,180]) cylinder(h=28, r1=15.7, r2=25.7);
    }
}
