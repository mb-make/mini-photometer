
include <config.scad>;
use <../lib/sliderbox.scad>;
use <cuvette-holder.scad>;
use <text.scad>;


/**
 * Main photometer casing
 */
module box()
{
  // Carve stuff in a box
  difference()
	{
    sliderbox(
      size_x = box_size_x,
      size_y = box_size_y,
      size_z = box_size_z,
      wall_thickness = box_wall_thickness,
      curvature_radius = box_curvature_radius,
      slider_inset_x = lid_inset_slider,
      slider_size_z = lid_slider_size_z,
      holder_inset_x = lid_inset_holder
    );

    // Opening for USB plug
    // TODO

    // Inscription
    // TODO
	}

  // Add cuvette holder
  cuvette_holder();
}


/**
 * The lid to put on the bottom of the photometer casing
 */
module lid()
{
  difference()
  {
    sliderbox_lid(
      size_x = box_size_x,
      size_y = box_size_y,
      thickness = box_wall_thickness,
      curvature_radius = box_curvature_radius,
      slider_inset_x = lid_inset_slider,
      slider_size_z = lid_slider_size_z,
      holder_inset_x = lid_inset_holder
    );

    // Opening for cuvette
    // TODO
  }
}


// Preview
box();

translate([box_size_x*1.1, 0, 0])
lid();
