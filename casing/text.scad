
include <config.scad>;


/**
 * The text to carve out of the front of the box
 * lying in XY plane, centered around the coordinate system origin
 */
module inscription(
          size_z = 3.0
        )
{
	// rotate([ 90, 180, 180 ])
  linear_extrude(height = size_z)
	{
        translate([ 1, 4.0, 0 ])
        text(
          "MAX",
          font = "Liberation Sans:style=Bold",
          size = 6.25,
          valign = "center",
          halign = "center"
        );

        translate([ 0, -4.0, 0 ])
        text(
          "Photometer",
          font = "Liberation Sans:style=Bold",
          size = 4.5,
          valign = "center",
          halign = "center"
        );
	}
}


// Preview
inscription();
