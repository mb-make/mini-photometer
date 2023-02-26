
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
    translate([
      box_size_x/2,
      box_size_y - box_inscription_depth,
      box_size_z/2
    ])
    rotate([90, 0, 180])
    inscription(
      size_z = box_inscription_depth + nothing
    );
	}

  // Add cuvette holder
  translate([
    box_wall_thickness - nothing,
    box_wall_thickness + cuvette_holder_inset_y,
    box_wall_thickness - nothing
  ])
  cuvette_holder(
    wall_thickness = cuvette_holder_wall_thickness,
    cuvette_size_x = cuvette_size_x + 2*cuvette_margin_x,
    cuvette_size_y = cuvette_size_y + 2*cuvette_margin_y,
    size_z = box_inner_size_z,
    lightsource_offset_z = lightpath_offset_z,
    lightsource_hole_diameter = lightpath_hole_diameter,
    sensor_offset_z = lightpath_offset_z,
    sensor_hole_diameter = lightpath_hole_diameter
  );
}


/**
 * The lid to put on the bottom of the photometer casing
 */
module lid()
{
  difference()
  {
    // The complete lid
    sliderbox_lid(
      size_x = box_size_x,
      size_y = box_size_y,
      thickness = box_wall_thickness,
      curvature_radius = box_curvature_radius,
      slider_inset_x = lid_inset_slider,
      slider_size_z = lid_slider_size_z,
      holder_inset_x = lid_inset_holder
    );

    // Cut an opening for the cuvette
    translate([
      box_wall_thickness + cuvette_holder_wall_thickness - nothing,
      box_wall_thickness + cuvette_holder_wall_thickness + cuvette_holder_inset_y - nothing,
      -nothing
    ])
    cube([
      cuvette_size_x + 2*cuvette_margin_x,
      cuvette_size_y + 2*cuvette_margin_y,
      box_wall_thickness + 2*nothing
    ]);
  }
}


// Preview
box();

translate([box_size_x*1.1, 0, 0])
lid();
