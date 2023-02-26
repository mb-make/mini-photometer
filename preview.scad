
include <casing/config.scad>;
use <electronics/assembled.scad>;
use <print-test.scad>;


// Show simplified photometer model
print_test();

// The fully assembled electronics must fit inside the photometer preview
translate([li + 1.0, ds, ds])
rotate([0, -90, 0])
electronics();
