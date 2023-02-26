
include <casing/config.scad>;
use <casing/box.scad>;
use <casing/lid.scad>;
use <casing/cap.scad>;


/**
 * Arrange all parts for 3d-printing
 */
module print()
{
  casing();

  translate([0, 1 * (ds + li + ds + druckabstand), 0 ])
  lid();

  translate([0, 2 * (ds + li + ds + druckabstand), 0 ])
  cuvette_cap();
}

print();
