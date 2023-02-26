
include <casing/config.scad>;
include <electronics/config.scad>;
use <electronics/assembled.scad>;
use <print-test.scad>;


// Show simplified photometer model
print_test();

// The fully assembled electronics must fit inside the photometer preview
translate([
  box_size_x - box_margin_x - box_wall_thickness - usb_size_z,
  box_wall_thickness + box_margin_y,
  box_wall_thickness + box_margin_z
])
rotate([0, -90, 0])
electronics();
