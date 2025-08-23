module prism(l, w, h) {
    polyhedron(
       points=[[0,0,0], [0,w,h], [l,w,h], [l,0,0], [0,w,0], [l,w,0]],
       faces=[[0,1,2,3],[2,1,4,5], [0,3,5,4], [0,4,1], [3,2,5]]
   );
}
               
difference() {
    union() {
        difference() {
            cylinder(h=12, r=6.5);
            translate([0,0,-1]) cylinder(h=13, r=4.5);
        }
    
        translate([0,0,12]) {
            difference() {
                cylinder(h=12, r=5.5);
                translate([0,0,1]) cylinder(h=13, r=3.5);
        
                rotate([0,0,90]) translate([0,10,7]) cube([4.5,20,8], center = true);

                rotate([0,0,90]) translate([0,10,1]) cube([2,20,6], center = true);
            }
        }
    }
    
    translate([0,0.5,-1]) rotate([0,0,180]) cube([7,1,23]);
    translate([-7,-4.5,-2]) cube([7,9,13]);
}

translate([-1.5,5.4,24]) rotate([270,0,00]) prism(3, 7, 1);

rotate([0,0,180]) translate([-1.5,5.4,24]) rotate([270,0,00]) prism(3, 7, 1);


translate([0,0,6]) difference() {
    cylinder(h=1, r=6.5);
    translate([0,0,-1]) cylinder(h=2, r=2);
    translate([0,1,-1]) rotate([0,0,180]) cube([7,3,23]);
}

translate([0,6,0]) cube([1,2,8]);
rotate([0,0,180]) translate([0,6,0]) cube([1,2,8]);
