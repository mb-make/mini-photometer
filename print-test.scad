
include <casing/config.scad>;
use <casing/box.scad>;


/**
 * A test 3d-print to check all the measurements
 */
module print_test()
{
  cut_size_x = box_size_x + 2*nothing;
  cut_size_y = box_size_y + 2*nothing;
  cut_below_z = box_wall_thickness;
  cut_above_z = 2/3*box_size_z;

  // Cut away some stuff
  difference()
  {
    // The complete photometer box
    box();

    // Cut away the bottom plate
    translate([-nothing, -nothing, -box_size_z+cut_below_z+nothing])
    cube([cut_size_x, cut_size_y, box_size_z]);

    // Cut away from the top
    translate([-nothing, -nothing, cut_above_z-nothing])
    cube([cut_size_x, cut_size_y, box_size_z]);
  }
}

print_test();
