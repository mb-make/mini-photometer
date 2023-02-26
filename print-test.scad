
include <casing/config.scad>;
use <casing/box.scad>;


/**
 * A test 3d-print to check all the measurements
 */
module print_test()
{
  // Cut away some stuff
	difference()
	{
		casing();

    // Cut away the bottom plate
		translate([0, 0, -nothing])
		cube([ 60, 60, ds+2*nothing ]);
	}
}

print_test();
