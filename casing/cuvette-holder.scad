
include <config.scad>;


/**
 * A structure to hold a cuvette,
 * with holes to allow for light to pass through from source to sensor
 */
module cuvette_holder(
          wall_thickness = cuvette_holder_wall_thickness,
          cuvette_size_x = cuvette_size_x + 2*cuvette_margin_x,
          cuvette_size_y = cuvette_size_y + 2*cuvette_margin_y,
          size_z = box_inner_size_z,
          lightsource_offset_z = lightpath_offset_z,
          lightsource_hole_diameter = lightpath_hole_diameter,
          sensor_offset_z = lightpath_offset_z,
          sensor_hole_diameter = lightpath_hole_diameter
        )
{
  size_x = cuvette_size_x + 2*wall_thickness;
  size_y = cuvette_size_y + 2*wall_thickness;

  difference()
  {
    // A complete cube
    cube([size_x, size_y, size_z]);

    // Cut away the inside
    translate([wall_thickness, wall_thickness, -nothing])
    cube([size_x-2*wall_thickness, size_y-2*wall_thickness, size_z+2*nothing]);

    // A hole for the sensor on the front
    translate([size_x/2, -nothing, sensor_offset_z])
    rotate([-90, 0, 0])
    cylinder(
      d = sensor_hole_diameter,
      h = wall_thickness + 2*nothing
    );

    // A hole for the light source on the back
    translate([size_x/2, size_y-wall_thickness-nothing, lightsource_offset_z])
    rotate([-90, 0, 0])
    cylinder(
      d = lightsource_hole_diameter,
      h = wall_thickness + 2*nothing
    );
  }
}


// Preview
cuvette_holder();
