union() {
    difference() {
        cylinder(h=27, d2=36, d1=42);
        cylinder(h=27, d=15);
    }
    difference() {
        cylinder(h=27, d1=70, d2=50);
        cylinder(h=27, d=45);
    }
    difference() {
        cylinder(h=12, d=45);
        cylinder(h=12, d=15);
    }
}