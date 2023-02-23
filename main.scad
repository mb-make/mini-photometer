// Gehäuse für Photometer mit D1 mini
// U. Scheffler 07.10.2020

include <config.scad>;
use <electronics/electronics.scad>;
use <casing.scad>;


module all()
{
  // ********************************************************************************************************
  anzahlSpalten = 1; // Photometer Anzahl pro Zeile
  druckabstand = 2;  // Abstand der einzelnen Teile zueinander
  kappe = 16.4;      // Kantenlänge der Kappen
  // for (i = [0:anzahlSpalten-1]) {
  // translate([i*(ds+bi+ds+druckabstand) ,0*(ds+li+ds+druckabstand),0]) cuvette_cap();
  // translate([i*(ds+bi+ds+druckabstand)+ ds+bi+ds-kappe,0*(ds+li+ds+druckabstand),0]) cuvette_cap(); // Zweitete Kappe
  // translate([i*(ds+bi+ds+druckabstand) ,(1-1)*(ds+li+ds+druckabstand)+kappe+druckabstand,0]) casing();
  // translate([i*(ds+bi+ds+druckabstand) ,(2-1)*(ds+li+ds+druckabstand)+kappe+druckabstand,0]) casing();
  // translate([i*(ds+bi+ds+druckabstand) ,(3-1)*(ds+li+ds+druckabstand)+kappe+druckabstand,0]) lid();
  // translate([i*(ds+bi+ds+druckabstand) ,(3-1)*(ds+li+ds+druckabstand)+(df+bi+df-2*fl)+druckabstand+kappe+druckabstand,
  // 0]) lid();
  //
  //}
  for (i = [0:anzahlSpalten - 1])
  {
    translate([ i * (ds + bi + ds + druckabstand), 0 * (ds + li + ds + druckabstand), 0 ])
    casing();
    translate([ i * (ds + bi + ds + druckabstand), 1 * (ds + li + ds + druckabstand), 0 ])
    lid();
    translate([ i * (ds + bi + ds + druckabstand), 2 * (ds + li + ds + druckabstand), 0 ])
    cuvette_cap();
  }
  *difference()
  { // Gehäuse im Anschnitt für grafische Darstellungen
    casing();
    translate([ ds + hls - asc, 0, -nothing ])
    cube([ ds + bi + ds, ds + li + ds, ds + hi + dd ]);
  }
}

module probedruck()
{
	anzahlSpalten = 1; // Photometer Anzahl pro Zeile
	druckabstand = 2;  // Abstand der einzelnen Teile zueinander
	kappe = 16.4;      // Kantenlänge der Kappen

	difference()
	{
		casing();

		translate([0, 0, -nothing])
		cube([ 60, 60, ds+2*nothing ]);
	}
}

// all();
probedruck();

// translate([li + 1.0, ds, ds])
// rotate([0, -90, 0])
// electronics();
