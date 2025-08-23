difference() {
    union() {
        cylinder(h=34, r=8.25);
        translate([0,0,30]) cylinder(h=2, r=15);
        translate([0,0,28]) cylinder(h=2, r=8.5);
    }
    translate([0,0,-1]) cylinder(h=34, r=6.25);
    translate([0,0,30]) cylinder(h=7, r=4);

    translate([0,0,6]) cube([6,20,6], center = true);


    rotate([0,0,90]) translate([0,10,6]) cube([4.5,20,6], center = true);

    rotate([0,0,90]) translate([0,10,1]) cube([2,20,6], center = true);
}

difference() {
 rotate([0,0,60]) translate([0,0,29])  rotate_extrude(angle=60) translate([9,0,0]) square([2,2],center=true); 
    
    rotate([0,0,55]) translate([0,0,29.5]) rotate_extrude(angle=55) translate([9.5,0,0]) square([2,1],center=true); 
}

difference() {
    rotate([0,0,240]) translate([0,0,29]) rotate_extrude(angle=60) translate([9,0,0])     square([2,2],center=true);
    
    rotate([0,0,235]) translate([0,0,29.5]) rotate_extrude(angle=55) translate([9.5,0,0]) square([2,1],center=true); 
}

translate([0,9.5,32]) cube([1.5,5,5]);

rotate([0,0,180]) translate([0,9.5,32]) cube([1.5,5,5]);
