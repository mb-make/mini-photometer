
include <config.scad>;
use <../lib/roundcube.scad>;


/**
 * The lid to place on the bottom of the box
 */
module lid(
          size_x = box_size_x,
          size_y = box_size_y,
          thickness = box_wall_thickness,
          curvature_radius = box_curvature_radius,
          slider_size_z = lid_slider_size_z
        )
{
  size_z = box_size_z;
  holder_size_z = thickness - slider_size_z;

	// Cut away the bottom part of the box
	difference()
	{
		// A complete box
  	translate([0, 0, -size_z+thickness])
		roundcube(
			size_x = size_x,
			size_y = size_y,
			size_z = size_z,
			radius = curvature_radius
		);

		// Bottom part of the box
    translate([-nothing, -nothing, -size_z-nothing])
		cube([
			size_x + 2*nothing,
			size_y + 2*nothing,
			size_z + nothing
		]);

    // Slider inset left
    translate([-nothing, -nothing, -nothing])
    cube([
      lid_inset_slider + nothing,
      size_y + 2*nothing,
      thickness + 2*nothing
    ]);

    // Holder inset left
    translate([-nothing, -nothing, slider_size_z])
    cube([
      lid_inset_holder + nothing,
      size_y + 2*nothing,
      holder_size_z + nothing
    ]);

    // Slider inset right
    translate([size_x-lid_inset_slider, -nothing, -nothing])
    cube([
      lid_inset_slider + nothing,
      size_y + 2*nothing,
      thickness + 2*nothing
    ]);

    // Holder inset right
    translate([size_x-lid_inset_holder, -nothing, slider_size_z])
    cube([
      lid_inset_holder + nothing,
      size_y + 2*nothing,
      holder_size_z + nothing
    ]);
	}
}

lid();
