
include <config.scad>;
use <../lib/cuboid.scad>;
use <text.scad>;


module arrow()
{
    linear_extrude(height = tb)
    {
        difference()
        {
            polygon(points = [[bpf, 0], [0, bpf], [1 / 2 * bpf, bpf], [bpf / 2, bpf + lpf],
                                [3 * bpf / 2, bpf + lpf], [3 * bpf / 2, bpf], [2 * bpf, bpf]]);
            polygon(points =
                        [[bpf, sqrt(2) * dpf], [sqrt(2) * dpf + dpf, bpf - dpf], [1 / 2 * bpf + dpf, bpf - dpf],
                            [bpf / 2 + dpf, bpf + lpf - dpf], [3 * bpf / 2 - dpf, bpf + lpf - dpf],
                            [3 * bpf / 2 - dpf, bpf - dpf], [2 * bpf - sqrt(2) * dpf - dpf, bpf - dpf]]);
        }
    }
}


module casing()
{
	difference()
	{
		cuboid(ds + bi + ds, ds + li + ds, ds + hi + dd, kr); // Außenhülle

		translate([ ds, ds, ds ])
		cube([ bi, li-0.9, hi + dd ]); // Innenraum

		translate([ ds+bi+ds-bu+2.0, 0, ds + hi / 2 - hu / 2 ])
		cube([ bu-2.0, ds + tu, hu ]); // USB Anschluss

		translate([ ds, 0, ds + hi ])
		cube([ bi, ds + li + ds, dd ]); // Deckelloch

		translate([ ds - df, 0, ds + hi ])
		cube([ df + bi + df, ds + li + ds, dd / 2 ]); // Deckelführung

		kuevettenloch();

		translate([ ds + kk / 2 - bpf + (hls - asc - kk / 2), ds + bs + wi + kk + wi + apf, 0 ])
        arrow();

		translate([ ds + bi / 2, ds + li + ds - tb, 30 ])
		text();
	}

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

    translate([1.5, 0, 0])
    {
        if (kmode == 0)
            translate([ ds + hls - asc - kk / 2 + (kk / 2 - wi - bl / 2) / 2 - b_khf / 2, ds + bs + wi + kk + wi, 0 ])
            feder(); // Küvetten Haltefeder links
        if (kmode == 0)
            translate([ ds + hls - asc + kk / 2 - (kk / 2 - wi - bl / 2) / 2 - b_khf / 2, ds + bs + wi + kk + wi, 0 ])
            feder(); // Küvetten Haltefeder rechts
    }

	// translate([ ds + bi - duw, ds + afu, ds ])
	// cube([ duw, wi, hi ]); // Platinenführung unter D1 mini

	// translate([ ds + bi / 2 - lr / 2 + tr / 2, ds + tr / 2, ds + hi ])
	// sphere(, d = tr); // Rastnase 1 Rundung oben

	// translate([ ds + bi / 2 - lr / 2, ds, ds + hi - tr ])
	// cube([ tr, tr, tr ]); // Rastnase 1 Halter

	// translate([ ds + bi / 2 - lr / 2, ds, ds + hi - tr ])
	// rotate([ -90, 0, -90 ])
	// cylinder(h = tr, d = 2 * tr); // Rastnase 1 Rundung unten

	// translate([ ds + bi / 2 + lr / 2 - tr / 2, ds + tr / 2, ds + hi ])
	// sphere(, d = tr); // Rastnase 1 Rundung oben

	// translate([ ds + bi / 2 + lr / 2 - tr, ds, ds + hi - tr ])
	// cube([ tr, tr, tr ]); // Rastnase 1 Halter
	// translate([ ds + bi / 2 + lr / 2 - tr, ds, ds + hi - tr ])
	// rotate([ -90, 0, -90 ])
	// cylinder(h = tr, d = 2 * tr); // Rastnase 1 Rundung unten

	// translate([ ds + bi / 2 - lr / 2 + tr / 2, ds + li - tr / 2, ds + hi ])
	// sphere(, d = tr); // Rastnase 2 Rundung oben

	// translate([ ds + bi / 2 - lr / 2, ds + li - tr, ds + hi - tr ])
	// cube([ tr, tr, tr ]); // Rastnase 2 Halter

	// translate([ ds + bi / 2 - lr / 2, ds + li, ds + hi - tr ])
	// rotate([ -90, 0, -90 ])
	// cylinder(h = tr, d = 2 * tr); // Rastnase 2 Rundung unten

	// translate([ ds + bi / 2 + lr / 2 - tr / 2, ds + li - tr / 2, ds + hi ])
	// sphere(, d = tr); // Rastnase 2 Rundung oben

	// translate([ ds + bi / 2 + lr / 2 - tr, ds + li - tr, ds + hi - tr ])
	// cube([ tr, tr, tr ]); // Rastnase 2 Halter

	// translate([ ds + bi / 2 + lr / 2 - tr, ds + li, ds + hi - tr ])
	// rotate([ -90, 0, -90 ])
	// cylinder(h = tr, d = 2 * tr); // Rastnase 2 Rundung unten
}
