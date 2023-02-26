
include <config.scad>;


module lid()
{
	rotate([ 0, 0, 90 ])
	translate([ 0, -(2 * ds + li), 0 ])
	{
		difference()
		{
			union()
			{
				translate([ ds + fl, 0, 0 ])
				cube([ bi - 2 * fl, ds + li + ds, dd - kr ]); // Deckel
				difference()
				{ // mit Abrundung an Kante
					hull()
					{
						translate([ ds + fl, 0 + kr, dd - kr ])
						rotate([ 0, 90, 0 ])
						cylinder(h = bi - 2 * fl, r = kr);
						translate([ ds + fl, ds + li + ds - kr, dd - kr ])
						rotate([ 0, 90, 0 ])
						cylinder(h = bi - 2 * fl, r = kr);
					}
					translate([ ds - df + fl - 20, 0 - 20, -20 ])
					cube([ df + bi + df - 2 * fl + 40, ds + li + ds + 40, dd / 2 - 2 * fl + 20 ]);
				}
				translate([ ds - df + fl, 0, 0 ])
				cube([ df + bi + df - 2 * fl, ds + li + ds, dd / 2 - 2 * fl ]);
			} // Deckelführung

			translate([ ds + bi / 2 - lr / 2 - fl, ds, 0 ])
			cube([ lr + 2 * fl, tr, tr ]); // Aussparung Rastnase

			translate([ ds + bi / 2 - lr / 2 - fl, ds + li - tr, 0 ])
			cube([ lr + 2 * fl, tr, tr ]); // Aussparung Rastnase

			translate([ ds + bi / 2 - 10, 4.5 + 5, dd - tb ])
			rotate([ 0, 0, -45 ])
			{ // Beschriftung Text
				linear_extrude(height = tb)
				{
					translate([ 0, 15, 0 ])
					text("192.168.4.1", font = "Liberation Sans:style=Bold", size = 6, valign = "center",
					     halign = "center");
				}
			}
		}
	}
}
