
$fn = 20;

nothing = 0.01;


/*
 * Cuvette parameters (cubic)
 */
cuvette_size_x = 10;
cuvette_size_y = 10;
cuvette_size_z = 45;

// Additional space to leave empty between cuvette and 3d-printed surfaces
cuvette_margin_x = 0.1;
cuvette_margin_y = 0.1;
cuvette_margin_z = 0.1;

/*
 * Box parameters
 */
box_wall_thickness = 1.7;
box_inner_size_x = 39.5;
box_inner_size_y = 37.5;
box_inner_size_z = 26;

box_size_x = box_inner_size_x + box_wall_thickness;
box_size_y = box_inner_size_y + box_wall_thickness;
box_size_z = box_inner_size_z + box_wall_thickness;

box_curvature_radius = 2;

/*
 * Lid parameters
 */
lid_inset_slider = box_wall_thickness / 2;
lid_inset_holder = 2.5;
lid_slider_size_z = 1.0;


// Die Bauhöhe des Stapels setzt sich aus dem
// D1 mini, der Adapterplatine und dem Lichtsensor zusammen.
// Unter dem D1 Mini sollte etwas Luft bleiben
// Optional mit zweitem Sensor für Fluoreszenzmessung
// LED Lichtaustrittsöffnung anpassbar (15.05.19)
zs = 0.0;   // zs=1.0 => mit zweitem Sensor , zs:=0.0 =< ohne zweiten Sensor
hd1 = 12.0; // Bauhöhe D1 mini (X)
// hap = 3.5;  // Bauhöhe der Adapterplatine (Platine und liegende Bauteile) im gestecktem Zustand (X)
hap = 2.0;
// hls = 18.5+zs*4.5; // Bauhöhe des Lichtsensors im gestecktem Zustand (Gy-2561 mit 2 Löchern oder TSL2561 mit 3 Löchern) (X)
// hls = 19.5 + zs * 4.5; // Bauhöhe des Lichtsensors im gestecktem Zustand (Gy-302 / BH1750 mit 2 Löchern) (X)
// hls = 22.5; // Bauhöhe des Lichtsensors im gestecktem Zustand (Adafruit TSL2561 Lux Sensor) (X)
hls = 20;
hlu = 1.0; // Luft unter dem D1 mini (X)

// Innenmaße
ds = 1.6;                   // Dicke Seitenwand (X, Y, Z)
shift_x = 3.0;
bi = hd1 + hap + hls + hlu + shift_x; // Breite innen (X)
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
tu = 0.4 + 2.0; // Zusätzliche Tiefe USB (Y)

// Küvette
kmode = 0; // 0:= eckige Küvette , 1:= runde Küvette
// (! Gedruckt ist die Aussparung ca 0.2 mm kleiner als das angegebene Maß!)
kk = 12.6; // 13.2; // Kantenlänge bzw Durchmesser für Küvettenaussparung 13.2 eckig (Rohmaß Küvette: 12.3) (X, Y)
// kk = 16.8; // Kantenlänge bzw Durchmesser für Küvettenaussparung 16.8 rund (X, Y))

// Sensor
bs = 5.0 + zs * 2.0; // Einbaubreite Lichtsensor (Standard = 5.0, Für Adafruit Sensor besser 6.0) (Y)
dc = 3.0;            // 4.0; // Duchmesser der Öffnung für den Sensor Chip
// asc = 12.0; // Abstand der Mitte des Sensorchips von der Unterkante seiner Platine (GY-2561 oder BH1750 mit 2 Löchern) (X)
// asc= 10.0; // Abstand der Mitte des Sensorchips von der Unterkante seiner Platine (TSL2561 mit 3 Löchern) (X)
// asc= 11.2; // Abstand der Mitte des Sensorchips von der Unterkante seiner Platine (Adafruit TSL2561 Lux Sensor) (X)
asc = 15.0;
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
