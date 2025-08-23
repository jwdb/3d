$stem_width = 5.5/2;

difference() {
    cylinder(r=$stem_width, h=12.5);
    translate([0,0,1]) cylinder(r=$stem_width/5*4, h=10);
    translate([1.5,0,5]) cube([5,3,12.5], center=true);
}
difference() {
    translate([0,0,-1]) cylinder(r2=$stem_width,r1=$stem_width/2, h=2, center=true);
    translate([1.5,0,0]) cube([5,1,12.5], center=true);
    }

translate([0,0,12.5]) cylinder(r=$stem_width*1.5, h=2.5, center=true);

union() {
    translate([0,0,12.5]) cylinder(r=$stem_width, h=25);
    translate([0,0,37.5]) rotate([0,18,18]) cylinder(r=$stem_width+$stem_width/10, h=1.5, center=true);
}
