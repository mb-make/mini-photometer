
include <casing/config.scad>;
include <electronics/config.scad>;
use <casing/box.scad>;
use <electronics/assembled.scad>;


/**
 * A test 3d-print to check all the measurements
 */
module preview(
          show_electronics = true,
          cut_from_top = true,
          cut_from_bottom = true
        )
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
    if (cut_from_bottom)
    {
      translate([-nothing, -nothing, -box_size_z+cut_below_z+nothing])
      cube([cut_size_x, cut_size_y, box_size_z]);
    }

    // Cut away from the top
    if (cut_from_top)
    {
      translate([-nothing, -nothing, cut_above_z-nothing])
      cube([cut_size_x, cut_size_y, box_size_z]);
    }
  }

  // The fully assembled electronics must fit inside the photometer preview
  if (show_electronics)
  {
    translate([
      box_size_x - box_margin_x - box_wall_thickness - usb_size_z,
      box_wall_thickness + box_margin_y,
      box_wall_thickness + box_margin_z
    ])
    rotate([0, -90, 0])
    electronics();
  }
}


// Show simplified photometer model
preview(
  show_electronics = true,
  cut_from_top = false,
  cut_from_bottom = false
);
