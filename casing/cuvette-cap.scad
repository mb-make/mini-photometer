
include <config.scad>;


/**
 * The cap to put on the cuvette to block light from the surrounding environment
 * with a small hole on top to be able to check the light source
 */
module cuvette_cap(
        wall_thickness = cuvette_holder_wall_thickness,
        cuvette_size_x = cuvette_size_x + 2*cuvette_margin_x,
        cuvette_size_y = cuvette_size_y + 2*cuvette_margin_y,
        size_z = cuvette_size_z - box_inner_size_z - box_wall_thickness + cuvette_holder_wall_thickness + cuvette_margin_z,
        hole_diameter = cap_hole_diameter
      )
{
  // Calculate outer cap dimension
	size_x = cuvette_size_x + 2*wall_thickness;
	size_y = cuvette_size_y + 2*wall_thickness;

	difference()
	{
    // A complete cuboid
		cube([size_x, size_y, size_z]);

    // Carve out space for the cuvette
		translate([wall_thickness, wall_thickness, wall_thickness])
		cube([cuvette_size_x, cuvette_size_y, size_z]);

    // Punch a hole in the bottom
    if (hole_diameter > 0.0)
    {
      translate([size_x/2, size_y/2, -nothing])
      cylinder(
          d = hole_diameter,
          h = wall_thickness + 2*nothing
        );
    }
	}
}


// Preview
cuvette_cap();
