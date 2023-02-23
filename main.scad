// Gehäuse für Photometer mit D1 mini
// U. Scheffler 07.10.2020

$fn = 20;
nothing = 0.01;

// Die Bauhöhe des Stapels setzt sich aus dem
// D1 mini, der Adapterplatine und dem Lichtsensor zusammen.
// Unter dem D1 Mini sollte etwas Luft bleiben
// Optional mit zweitem Sensor für Fluoreszenzmessung
// LED Lichtaustrittsöffnung anpassbar (15.05.19)
zs = 0.0;   // zs=1.0 => mit zweitem Sensor , zs:=0.0 =< ohne zweiten Sensor
hd1 = 12.0; // Bauhöhe D1 mini (X)
hap = 3.5;  // Bauhöhe der Adapterplatine (Platine und liegende Bauteile) im gestecktem Zustand (X)
// hls = 18.5+zs*4.5; // Bauhöhe des Lichtsensors im gestecktem Zustand (Gy-2561 mit 2 Löchern oder TSL2561 mit 3
// Löchern) (X)
hls = 19.5 + zs * 4.5; // Bauhöhe des Lichtsensors im gestecktem Zustand (Gy-302 / BH1750 mit 2 Löchern) (X)
// hls = 22.5; // Bauhöhe des Lichtsensors im gestecktem Zustand (Adafruit TSL2561 Lux Sensor) (X)
hlu = 1.0; // Luft unter dem D1 mini (X)

// Innenmaße
ds = 1.6;                   // Dicke Seitenwand (X, Y, Z)
bi = hd1 + hap + hls + hlu; // Breite innen (X)
li = 36.0 + zs * 2.0;       // Länge innen (Y)
wi = 0.8;                   // Wandstärke Innen (X, Y)
hi = 26.0;                  // Höhe innen (Z)
kr = 1.6;                   // Kanten Radius

// Deckel
dd = 2.0; // Dicke Deckel (Z)
df = 0.8; // Deckel Führungsnut
fl = 0.2; // Freilauf für Deckelführung

// Rastnasen
tr = 1.2; // Tiefe der Rastnase
lr = 8.0; // Länge der Rastnase

// USB Anschluss
bu = 8.0;            // Breite USB (X)
hu = 11.0;           // Höhe USB (Z)
tu = 0.4 + zs * 2.0; // Zusätzliche Tiefe USB (Y)

// Küvette
kmode = 0; // 0:= eckige Küvette , 1:= runde Küvette
// (! Gedruckt ist die Aussparung ca 0.2 mm kleiner als das angegebene Maß!)
kk = 12.6; // 13.2; // Kantenlänge bzw Durchmesser für Küvettenaussparung 13.2 eckig (Rohmaß Küvette: 12.3) (X, Y)
// kk = 16.8; // Kantenlänge bzw Durchmesser für Küvettenaussparung 16.8 rund (X, Y))

// Sensor
bs = 5.0 + zs * 2.0; // Einbaubreite Lichtsensor (Standard = 5.0, Für Adafruit Sensor besser 6.0) (Y)
dc = 3.0;            // 4.0; // Duchmesser der Öffnung für den Sensor Chip
asc =
    12.0; // Abstand der Mitte des Sensorchips von der Unterkante seiner Platine (GY-2561 oder BH1750 mit 2 Löchern) (X)
// asc= 10.0; // Abstand der Mitte des Sensorchips von der Unterkante seiner Platine (TSL2561 mit 3 Löchern) (X)
// asc= 11.2; // Abstand der Mitte des Sensorchips von der Unterkante seiner Platine (Adafruit TSL2561 Lux Sensor) (X)
hsmp = hi / 2 + 2.54 / 2; // Höhe des Sensormmittelpunkts (der Sensor ist um einen Halbe Rasterbreite gegenüber dem
                          // Baugruppenmittelpunkt verschoben) (Z)

// Führung für Platinen
dw = 5.0;              // Dicke für D1 mini (X)
bf = 10.0;             // Breite Führungsblock (X)
lf = 8.0 + zs * 2.0;   // Länge Führungsblock (Y)
duw = 3.0;             // Dicke unter D1 mini (X)
afu = 30.0 + zs * 2.0; // Abstand der Führung unter der Platine zur USB Seite (Y)

// LED Führung
bl = 5.5;  // Breite des Ausschitts für die LED (X)
ll = 8.5;  // Länge der Auflagefläche für die LED (Y)
lla = 3.0; // Durchmesser Lichtaustrittsöffnung für die LED (X)

// Beschriftungen
tb = 0.4;   // Einprägetiefe
bpf = 4.0;  // Breite Pfeilschaft
lpf = 10.0; // Länge Pfeilschaft
dpf = 0.8;  // Breite der Prägelinie
apf = 1.0;  // Abstand Pfeil zum Küvettendurchbruch

// Küvetten Haltefeder
h_khf = ds + hi;         // Höhe max (z)
hu_khf = 1.6;            // Höhe des an der Küvettenhalterungswand festen Teils (z)
hr_khf = h_khf - hu_khf; // Höhe des runden Teils im mitleren Bereich (z)
ao_khf = 1.0;            // Abstand von der Küvettenhalterungswand des geraden Teils im oberen Bereich (x)
t_khf = 2.0;             // Tiefe der Feder (Abstand von der Küvettenhalterungswand) (x)
b_khf = 2.0;             // Breite der Feder (y)
d_khf = 1.0;             // Dicke der Feder (x)
rr_khf = (4 * pow(t_khf, 2) + pow(hr_khf, 2)) / (8 * t_khf); // Radius des runden Teils im mitleren Bereich

module roundcube(x, y, z, r)
{
	// "cube" mit abgerundeten Kanten und Radius = r
	hull()
	{
		translate([ r, r, r ])
		sphere(r = r);
		translate([ x - r, r, r ])
		sphere(r = r);
		translate([ r, y - r, r ])
		sphere(r = r);
		translate([ x - r, y - r, r ])
		sphere(r = r);
		translate([ r, r, z - r ])
		sphere(r = r);
		translate([ x - r, r, z - r ])
		sphere(r = r);
		translate([ r, y - r, z - r ])
		sphere(r = r);
		translate([ x - r, y - r, z - r ])
		sphere(r = r);
	}
}

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
	translate([ tb, ds + li / 2, 30 ])
	rotate([ 270, 0, 90 ])
	{ // Links - In diesem Block ist Platz für eine Gerätenummer oder ein eigenes Logo
		linear_extrude(height = tb)
		{
			translate([ 0, 15, 0 ])
			text("", font = "Liberation Sans:style=Bold", size = 6.0, valign = "center", halign = "center");
		}
	}
	translate([ 2 * ds + bi - tb, ds + li / 2, 30 ])
	rotate([ 90, 180, 90 ])
	{ // Rechts - In diesem Block ist Platz für eine Gerätenummer oder ein eigenes Logo
		linear_extrude(height = tb)
		{
			translate([ 0, 15, 0 ])
			text("", font = "Liberation Sans:style=Bold", size = 6.0, valign = "center", halign = "center");
		}
	}
}

module feder()
{ // Küvetten-Haltefeder
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

module gehaeuse()
{ // Gehäuse
	difference()
	{
		translate([ 0, 0, 0 ])
		roundcube(ds + bi + ds, ds + li + ds, ds + hi + dd, kr); // Außenhülle
		translate([ ds, ds, ds ])
		cube([ bi, li, hi + dd ]); // Innenraum
		translate([ ds + bi + ds - bu, 0, ds + hi / 2 - hu / 2 ])
		cube([ bu, ds + tu, hu ]); // USB Anschluss
		translate([ ds, 0, ds + hi ])
		cube([ bi, ds + li + ds, dd ]); // Deckelloch
		translate([ ds - df, 0, ds + hi ])
		cube([ df + bi + df, ds + li + ds, dd / 2 ]); // Deckelführung
		if (kmode == 0)
			translate([ ds + (hls - asc - kk / 2), ds + bs + wi, 0 ])
		cube([ kk, kk, ds ]); // eckige Küvettenführung Bodendurchbruch
		if (kmode == 0 && zs > 0.0)
			translate([ ds - wi + (hls - asc - kk / 2) - zs * wi / 4, ds + bs + wi, 0 ])
		cube([ wi / 2, kk, hi + 2 * ds ]); // Filteraussparung bei eckiger Küvettenführung
		if (kmode == 1)
			translate([ ds + (hls - asc), ds + bs + wi + kk / 2, 0 ])
		cylinder(d = kk, h = ds); // runde Küvettenführung Bodendurchbruch
		translate([ ds + kk / 2 - bpf + (hls - asc - kk / 2), ds + bs + wi + kk + wi + apf, 0 ])
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
		beschriftungen();
	}
	difference()
	{ // Führung für Platinen (zwischen den Platinen) mit Aussparung für die USB Buchse
		translate([ ds + bi - dw - bf, ds, ds ])
		cube([ bf, lf, hi ]); // Außen
		translate([ ds + bi - dw - bf + wi, ds, ds ])
		cube([ bf - 2 * wi, lf + wi, hi ]); // Innen
		translate([ ds + bi + ds - bu, 0, ds + hi / 2 - hu / 2 ])
		cube([ bu, ds + tu, hu ]); // USB
	}
	difference()
	{ // Küvettenführung und LED Halter
		union()
		{
			if (kmode == 0)
				translate([ ds - wi + (hls - asc - kk / 2) - zs * wi, ds + bs, ds ])
			cube([ kk + 2 * wi + zs * wi, kk + 2 * wi, hi ]); // eckige Küvettenführung
			if (kmode == 1)
				translate([ ds + (hls - asc), ds + bs + wi + kk / 2, ds ])
			cylinder(d = kk + 2 * wi, h = hi); // runde Küvettenführung
			translate([ ds - wi + kk / 2 - bl / 2 + (hls - asc - kk / 2), ds + bs + 0 * wi + kk, ds ])
			cube([ wi + bl + wi, ll + wi, hi ]); // LED Halter Block
			if (kmode == 0)
				translate([ ds + hls - asc - kk / 2 - wi, ds + bs + wi + kk, 0 ])
			cube([ wi + (kk - bl) / 2, 4 * wi, ds + hi ]); // Küvetten Haltefeder Aussparung links
			if (kmode == 0)
				translate([ ds + hls - asc + bl / 2, ds + bs + wi + kk, 0 ])
			cube([ wi + (kk - bl) / 2, 4 * wi, ds + hi ]); // Küvetten Haltefeder Aussparung rechts
		}
		if (kmode == 0)
			translate([ ds + (hls - asc - kk / 2), ds + bs + wi, ds ])
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
		         d = lla); // LED Lichtweg Austrittsöffnung
		hull()
		{
			translate([ ds - wi + kk / 2 + wi + (hls - asc - kk / 2), ds + bs, ds + hsmp + dc / 2 ])
			rotate([ -90, 0, 0 ])
			cylinder(h = 2 * wi, d = dc); // Sensor Lichtweg
			translate([ ds - wi + kk / 2 + wi + (hls - asc - kk / 2), ds + bs, ds + hsmp - dc / 2 ])
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
	if (kmode == 0)
		translate([ ds + hls - asc - kk / 2 + (kk / 2 - wi - bl / 2) / 2 - b_khf / 2, ds + bs + wi + kk + wi, 0 ])
	feder(); // Küvetten Haltefeder links
	if (kmode == 0)
		translate([ ds + hls - asc + kk / 2 - (kk / 2 - wi - bl / 2) / 2 - b_khf / 2, ds + bs + wi + kk + wi, 0 ])
	feder(); // Küvetten Haltefeder rechts
	translate([ ds + bi - duw, ds + afu, ds ])
	cube([ duw, wi, hi ]); // Platinenführung unter D1 mini
	translate([ ds + bi / 2 - lr / 2 + tr / 2, ds + tr / 2, ds + hi ])
	sphere(, d = tr); // Rastnase 1 Rundung oben
	translate([ ds + bi / 2 - lr / 2, ds, ds + hi - tr ])
	cube([ tr, tr, tr ]); // Rastnase 1 Halter
	translate([ ds + bi / 2 - lr / 2, ds, ds + hi - tr ])
	rotate([ -90, 0, -90 ])
	cylinder(h = tr, d = 2 * tr); // Rastnase 1 Rundung unten
	translate([ ds + bi / 2 + lr / 2 - tr / 2, ds + tr / 2, ds + hi ])
	sphere(, d = tr); // Rastnase 1 Rundung oben
	translate([ ds + bi / 2 + lr / 2 - tr, ds, ds + hi - tr ])
	cube([ tr, tr, tr ]); // Rastnase 1 Halter
	translate([ ds + bi / 2 + lr / 2 - tr, ds, ds + hi - tr ])
	rotate([ -90, 0, -90 ])
	cylinder(h = tr, d = 2 * tr); // Rastnase 1 Rundung unten
	translate([ ds + bi / 2 - lr / 2 + tr / 2, ds + li - tr / 2, ds + hi ])
	sphere(, d = tr); // Rastnase 2 Rundung oben
	translate([ ds + bi / 2 - lr / 2, ds + li - tr, ds + hi - tr ])
	cube([ tr, tr, tr ]); // Rastnase 2 Halter
	translate([ ds + bi / 2 - lr / 2, ds + li, ds + hi - tr ])
	rotate([ -90, 0, -90 ])
	cylinder(h = tr, d = 2 * tr); // Rastnase 2 Rundung unten
	translate([ ds + bi / 2 + lr / 2 - tr / 2, ds + li - tr / 2, ds + hi ])
	sphere(, d = tr); // Rastnase 2 Rundung oben
	translate([ ds + bi / 2 + lr / 2 - tr, ds + li - tr, ds + hi - tr ])
	cube([ tr, tr, tr ]); // Rastnase 2 Halter
	translate([ ds + bi / 2 + lr / 2 - tr, ds + li, ds + hi - tr ])
	rotate([ -90, 0, -90 ])
	cylinder(h = tr, d = 2 * tr); // Rastnase 2 Rundung unten
}

module deckel()
{ // Deckel
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

module kappe_eckig()
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
// ********************************************************************************************************
anzahlSpalten = 1; // Photometer Anzahl pro Zeile
druckabstand = 2;  // Abstand der einzelnen Teile zueinander
kappe = 16.4;      // Kantenlänge der Kappen
// for (i = [0:anzahlSpalten-1]) {
// translate([i*(ds+bi+ds+druckabstand) ,0*(ds+li+ds+druckabstand),0]) kappe_eckig();
// translate([i*(ds+bi+ds+druckabstand)+ ds+bi+ds-kappe,0*(ds+li+ds+druckabstand),0]) kappe_eckig(); // Zweitete Kappe
// translate([i*(ds+bi+ds+druckabstand) ,(1-1)*(ds+li+ds+druckabstand)+kappe+druckabstand,0]) gehaeuse();
// translate([i*(ds+bi+ds+druckabstand) ,(2-1)*(ds+li+ds+druckabstand)+kappe+druckabstand,0]) gehaeuse();
// translate([i*(ds+bi+ds+druckabstand) ,(3-1)*(ds+li+ds+druckabstand)+kappe+druckabstand,0]) deckel();
// translate([i*(ds+bi+ds+druckabstand) ,(3-1)*(ds+li+ds+druckabstand)+(df+bi+df-2*fl)+druckabstand+kappe+druckabstand,
// 0]) deckel();
//
//}
for (i = [0:anzahlSpalten - 1])
{
	translate([ i * (ds + bi + ds + druckabstand), 0 * (ds + li + ds + druckabstand), 0 ])
	gehaeuse();
	translate([ i * (ds + bi + ds + druckabstand), 1 * (ds + li + ds + druckabstand), 0 ])
	deckel();
	translate([ i * (ds + bi + ds + druckabstand), 2 * (ds + li + ds + druckabstand), 0 ])
	kappe_eckig();
}
*difference()
{ // Gehäuse im Anschnitt für grafische Darstellungen
	gehaeuse();
	translate([ ds + hls - asc, 0, 0 ])
	cube([ ds + bi + ds, ds + li + ds, ds + hi + dd ]);
}
