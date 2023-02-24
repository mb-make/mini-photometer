
include <config.scad>;
use <../lib/roundcube.scad>;
use <cuvette-holder.scad>;


// Beschriftungen an den Gehäuseseiten anbringen
module beschriftungen()
{
	translate([ ds + bi / 2, ds + li + ds - tb, 30 ])
	rotate([ 90, 180, 180 ])
	{ // Hinten - Beschriftung mit HAW Photometer
		linear_extrude(height = tb)
		{
			// translate ([-10,19-6.0/2,0]) haw_logo(6);
			translate([ 1, 19, 0 ])
			text("MAX", font = "Liberation Sans:style=Bold", size = 6.25, valign = "center", halign = "center");
			translate([ 0, 12, 0 ])
			text("Photometer", font = "Liberation Sans:style=Bold", size = 4.5, valign = "center", halign = "center");
		}
	}
	translate([ ds + bi / 2, tb, 30 ])
	rotate([ 90, 180, 0 ])
	{ // Vorne - Beschriftung mit HAW Logo
		linear_extrude(height = tb)
		{
			translate([ 3, 15, 0 ])
			text("MAX", font = "Liberation Sans:style=Bold", size = 7.0, valign = "center", halign = "center");
			translate([ 0, 6, 0 ])
			text("Photometer", font = "Liberation Sans:style=Bold", size = 4.5, valign = "center", halign = "center");
			// translate ([0,20,0]) haw_logo(7.0);
		}
	}

	// translate([ tb, ds + li / 2, 30 ])
	// rotate([ 270, 0, 90 ])
	// { // Links - In diesem Block ist Platz für eine Gerätenummer oder ein eigenes Logo
	// 	linear_extrude(height = tb)
	// 	{
	// 		translate([ 0, 15, 0 ])
	// 		text("", font = "Liberation Sans:style=Bold", size = 6.0, valign = "center", halign = "center");
	// 	}
	// }
	// translate([ 2 * ds + bi - tb, ds + li / 2, 30 ])
	// rotate([ 90, 180, 90 ])
	// { // Rechts - In diesem Block ist Platz für eine Gerätenummer oder ein eigenes Logo
	// 	linear_extrude(height = tb)
	// 	{
	// 		translate([ 0, 15, 0 ])
	// 		text("", font = "Liberation Sans:style=Bold", size = 6.0, valign = "center", halign = "center");
	// 	}
	// }
}


module arrow()
{
    linear_extrude(height = tb)
    {
        difference()
        { // Beschriftung Pfeil
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
		translate([ 0, 0, 0 ])
		roundcube(ds + bi + ds, ds + li + ds, ds + hi + dd, kr); // Außenhülle

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

		beschriftungen();
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
