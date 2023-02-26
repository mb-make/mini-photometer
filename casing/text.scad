
include <config.scad>;


/**
 * The text to carve out of the front of the box
 */
module text()
{
	rotate([ 90, 180, 180 ])
    linear_extrude(height = tb)
	{
        translate([ 1, 19, 0 ])
        text("MAX", font = "Liberation Sans:style=Bold", size = 6.25, valign = "center", halign = "center");
        translate([ 0, 12, 0 ])
        text("Photometer", font = "Liberation Sans:style=Bold", size = 4.5, valign = "center", halign = "center");
	}
}

text();
