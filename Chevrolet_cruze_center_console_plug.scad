rounding = 300;
hole_size = 10;
top_radius = 19;
top_outer_radius = 17;
top_depth = 5;
total_depth = 24;
insert_radius = 14;
insert_wall = 1;

union() {
    difference() {
        cylinder(h=1, r1=insert_radius - 1, r2=insert_radius, $fn=rounding);
        cylinder(h=1, r=insert_radius - insert_wall, $fn=rounding);
    }
    translate([0,0,1]) {
        difference() {
            union() {
                difference() {
                    cylinder(h=total_depth, r=insert_radius, $fn=rounding);
                    cylinder(h=total_depth-top_depth, r=insert_radius - insert_wall, $fn=rounding);
                }
                translate([0,0,total_depth-top_depth]) {
                        cylinder(h=top_depth, r1=total_depth-top_depth, r2=top_outer_radius, $fn=rounding);
                }
            }
            cylinder(h=total_depth, r=hole_size, $fn=rounding);
        }
    }
}
