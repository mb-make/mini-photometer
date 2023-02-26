
include <config.scad>;


/**
 * The cap to put on the cuvette to block light from the surrounding environment
 * with a small hole on top to be able to check the light source
 */
module cuvette_cap(
        wall_thickness = 1.2,
        size_x = cuvette_size_x + 2*cuvette_margin_x,
        size_y = cuvette_size_y + 2*cuvette_margin_y,
        size_z = cuvette_size_z - box_inner_size_z - box_wall_thickness + cuvette_margin_z,
        hole_diameter = 1.5
      )
{
	inner_size_x = size_x - 2*wall_thickness;
	inner_size_y = size_y - 2*wall_thickness;
	inner_size_z = size_z - wall_thickness;

	difference()
	{
		cube([size_x, size_y, size_z]);

		translate([wall_thickness, wall_thickness, wall_thickness])
		cube([inner_size_x, inner_size_y, inner_size_z+nothing]);

		translate([size_x/2, size_y/2, -nothing])
		cylinder(
				d = hole_diameter,
				h = wall_thickness + 2*nothing
			);
	}
}


// Preview
cuvette_cap();
