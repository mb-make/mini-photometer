
include <../casing/config.scad>;
use <cuboid.scad>;


/**
 * A box with rounded corners and a hole for a slidable lid
 */
module sliderbox(
          size_x = box_size_x,
          size_y = box_size_y,
          size_z = box_size_z,
          wall_thickness = box_wall_thickness,
          curvature_radius = box_curvature_radius,
          slider_inset_x = lid_inset_slider,
          slider_size_z = lid_slider_size_z,
          holder_inset_x = lid_inset_holder
        )
{
  holder_size_z = wall_thickness - slider_size_z;

  difference()
  {
    // A complete cuboid
    cuboid(
      size_x = size_x,
      size_y = size_y,
      size_z = size_z,
      curvature_radius = curvature_radius
    );

    // Cut away the free space inside
    translate([wall_thickness, wall_thickness, wall_thickness])
    cube([size_x-2*wall_thickness, size_y-2*wall_thickness, size_z-2*wall_thickness]);

    // Holder left
    translate([holder_inset_x, -nothing, size_z-holder_size_z-nothing])
    cube([size_x-2*holder_inset_x, size_y+2*nothing, holder_size_z+2*nothing]);

    // Slider left
    translate([slider_inset_x, -nothing, size_z-holder_size_z-slider_size_z-nothing])
    cube([size_x-2*slider_inset_x, size_y+2*nothing, slider_size_z+nothing]);
  }
}


/**
 * A lid with rounded corners to slide on the box
 */
module sliderbox_lid(
          size_x = box_size_x,
          size_y = box_size_y,
          thickness = box_wall_thickness,
          curvature_radius = box_curvature_radius,
          slider_inset_x = lid_inset_slider,
          slider_size_z = lid_slider_size_z,
          holder_inset_x = lid_inset_holder
        )
{
  size_z = 10.0;
  holder_size_z = thickness - slider_size_z;

	// Cut away the bottom part of the box
	difference()
	{
		// A complete cuboid
  	translate([0, 0, -size_z+thickness])
		cuboid(
			size_x = size_x,
			size_y = size_y,
			size_z = size_z,
			curvature_radius = curvature_radius
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
      slider_inset_x + nothing,
      size_y + 2*nothing,
      thickness + 2*nothing
    ]);

    // Holder inset left
    translate([-nothing, -nothing, slider_size_z])
    cube([
      holder_inset_x + nothing,
      size_y + 2*nothing,
      holder_size_z + nothing
    ]);

    // Slider inset right
    translate([size_x-slider_inset_x, -nothing, -nothing])
    cube([
      slider_inset_x + nothing,
      size_y + 2*nothing,
      thickness + 2*nothing
    ]);

    // Holder inset right
    translate([size_x-holder_inset_x, -nothing, slider_size_z])
    cube([
      holder_inset_x + nothing,
      size_y + 2*nothing,
      holder_size_z + nothing
    ]);
	}
}


// Demo
sliderbox();

translate([box_size_x*1.1, 0, 0])
sliderbox_lid();
