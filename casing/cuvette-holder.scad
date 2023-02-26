
include <config.scad>;


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
