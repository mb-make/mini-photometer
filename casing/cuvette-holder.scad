
include <config.scad>;


module cuvette_holder()
{
	translate([ 1.7, 0 , 0 ])
	difference()
	{ // Küvettenführung und LED Halter
		union()
		{
			if (kmode == 0)
				translate([ ds - wi + (hls - asc - kk / 2) - zs * wi, ds + bs - 1.0, ds + nothing ])
				cube([ kk + 2 * wi + zs * wi, kk + 2 * wi + 1.0, hi - 2*nothing ]); // eckige Küvettenführung
			if (kmode == 1)
				translate([ ds + (hls - asc), ds + bs + wi + kk / 2, ds ])
				cylinder(d = kk + 2 * wi, h = hi); // runde Küvettenführung

			translate([ ds - wi + kk / 2 - bl / 2 + (hls - asc - kk / 2), ds + bs + 0 * wi + kk, ds ])
			cube([ wi + bl + wi, ll + wi, hi - nothing ]); // LED Halter Block

			if (kmode == 0)
				translate([ ds + hls - asc - kk / 2 - wi, ds + bs + wi + kk, 0 ])
				cube([ wi + (kk - bl) / 2, 4 * wi, ds + hi ]); // Küvetten Haltefeder Aussparung links
			if (kmode == 0)
				translate([ ds + hls - asc + bl / 2, ds + bs + wi + kk, 0 ])
				cube([ wi + (kk - bl) / 2, 4 * wi, ds + hi ]); // Küvetten Haltefeder Aussparung rechts
		}

		if (kmode == 0)
			translate([ ds + (hls - asc - kk / 2), ds + bs + wi + nothing, ds ])
	    	cube([ kk, kk, hi ]); // eckige Küvettenführung Bodendurchbruch
		if (kmode == 1)
			translate([ ds + (hls - asc), ds + bs + wi + kk / 2, ds ])
    		cylinder(d = kk, h = hi); // runde Küvettenführung Bodendurchbruch

		translate([ ds - wi + kk / 2 - bl / 2 + wi + (hls - asc - kk / 2), ds + bs + 2 * wi + kk, ds + hi / 2 ])
		cube([ bl, ll + 2 * wi, hi / 2 ]); // LED Halter Aussparung

		translate([ ds - wi + kk / 2 + wi + (hls - asc - kk / 2), ds + bs + (-2) * wi + kk + 4 * wi, ds + hi / 2 ])
		rotate([ -90, 0, 0 ])
		cylinder(h = ll + 3 * wi, d = bl); // LED Aussparung

		translate([ ds - wi + kk / 2 + wi + (hls - asc - kk / 2), ds + bs + (-2) * wi + kk + 0 * wi, ds + hi / 2 ])
		rotate([ -90, 0, 0 ])
		cylinder(h = ll + 3 * wi,
		         d = lla+1.5); // LED Lichtweg Austrittsöffnung

		hull()
		{
			translate([ ds - wi + kk / 2 + wi + (hls - asc - kk / 2), ds + bs, ds + hsmp + dc / 2 ])
			rotate([ -90, 0, 0 ])
			cylinder(h = 2 * wi, d = dc); // Sensor Lichtweg

			translate([ ds - wi + kk / 2 + wi + (hls - asc - kk / 2), ds + bs - 1.5, ds + hsmp - dc / 2 ])
			rotate([ -90, 0, 0 ])
			cylinder(h = 2 * wi, d = dc); // Sensor Lichtweg
		}

		if (zs > 0.0)
		{
			hull()
			{
				translate([ ds + (hls - asc) - kk / 2 - 2 * wi, ds + bs + wi + kk / 2 - dc / 2, ds + hsmp + dc / 2 ])
				rotate([ 0, 90, 0 ])
				cylinder(h = 3 * wi, d = dc); // Zweiter Sensor Lichtweg
				translate([ ds + (hls - asc) - kk / 2 - 2 * wi, ds + bs + wi + kk / 2 + dc / 2, ds + hsmp - dc / 2 ])
				rotate([ 0, 90, 0 ])
				cylinder(h = 3 * wi, d = dc); // Zweiter Sensor Lichtweg
			};
			if (kmode == 0)
				translate([ ds - wi + (hls - asc - kk / 2) - zs * wi / 4, ds + bs + wi, 0 ])
			cube([ wi / 2, kk, hi + 2 * ds ]); // Filteraussparung bei eckiger Küvettenführung
		};
		if (kmode == 0)
			translate([ ds + hls - asc - kk / 2, ds + bs + wi + kk, 0 ])
		cube([ (kk - bl) / 2 - wi, 3 * wi, ds + hi + dd ]); // Küvetten Haltefeder Aussparung links
		if (kmode == 0)
			translate([ ds + hls - asc + bl / 2 + wi, ds + bs + wi + kk, 0 ])
		cube([ (kk - bl) / 2 - wi, 3 * wi, ds + hi + dd ]); // Küvetten Haltefeder Aussparung rechts
	}
}