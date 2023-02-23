
include <config.scad>;


// Küvetten-Haltefeder
module feder()
{
	translate([ 0, d_khf, 0 ])
	rotate([ 0, 0, -90 ])
	{
		cube([ d_khf, b_khf, hu_khf ]);
		intersection()
		{
			difference()
			{
				translate([ t_khf - rr_khf + d_khf, b_khf, hu_khf + hr_khf / 2 ])
				rotate([ 90, 0, 0 ])
				cylinder(r = rr_khf, h = b_khf);
				translate([ t_khf - rr_khf + d_khf, b_khf, hu_khf + hr_khf / 2 ])
				rotate([ 90, 0, 0 ])
				cylinder(r = rr_khf - d_khf, h = b_khf);
			}
			translate([ 0, 0, hu_khf ])
			cube([ t_khf + d_khf, b_khf, hr_khf * 5 / 5 ]);
		}
		hull()
		{
			translate([ d_khf, 0, 0 ])
			cube([ 0.1, b_khf, 2.85 * hu_khf ]);
			translate([ -d_khf, 0, 0 ])
			cube([ d_khf, b_khf, hu_khf ]);
		}
	}
}

module kuevettenloch()
{
	if (kmode == 0)
		translate([ ds + (hls - asc - kk / 2), ds + bs + wi, 0 ])
		cube([ kk, kk, ds + nothing ]); // eckige Küvettenführung Bodendurchbruch
	if (kmode == 0 && zs > 0.0)
		translate([ ds - wi + (hls - asc - kk / 2) - zs * wi / 4, ds + bs + wi, 0 ])
		cube([ wi / 2, kk, hi + 2 * ds ]); // Filteraussparung bei eckiger Küvettenführung
	if (kmode == 1)
		translate([ ds + (hls - asc), ds + bs + wi + kk / 2, 0 ])
		cylinder(d = kk, h = ds); // runde Küvettenführung Bodendurchbruch
}


module cuvette_cap()
{ // Kappe zum Abdecken einer eckigen Küvette
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
