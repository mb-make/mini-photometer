
include <config.scad>;


/**
 * The cap to put on the cuvette to block light from the surrounding environment
 */
module cuvette_cap()
{
	wand = 1.2;
	innenkante = 14.0;
	innenhoehe = 18.5;
	difference()
	{
		cube(size = [ innenkante + 2 * wand, innenkante + 2 * wand, innenhoehe + wand ]);
		translate([ wand, wand, wand ])
		cube(size = [ innenkante, innenkante, innenhoehe + 2 * wand ]);
		translate([ wand + innenkante / 2, wand + innenkante / 2, -wand ])
		cylinder(d = wand, h = innenhoehe * 2, $fn = 50);
	}
}
