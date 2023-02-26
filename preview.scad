
include <casing/config.scad>;
use <electronics/assembled.scad>;
use <print-test.scad>;


// Simplified photometer model
print_test();

// Electronics to fit inside the photometer
translate([li + 1.0, ds, ds])
rotate([0, -90, 0])
electronics();
