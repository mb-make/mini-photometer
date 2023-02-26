
include <../casing/config.scad>;
use <../casing/box.scad>;
use <../casing/cuvette-cap.scad>;


/**
 * Arrange all parts for 3d-printing
 */
module print()
{
  translate([0, cuvette_size_y*1.5, 0])
  box();

  translate([box_size_x*1.1, 0, 0])
  lid();

  cuvette_cap();
}

print();
