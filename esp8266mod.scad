
include <config.scad>;


module esp8266mod()
{
    pcb_color = "black";
    pcb_x = 16.0;
    pcb_y = 24.0;
    pcb_z = 1.0;

    shield_color = "lightgray";
    shield_inset_x = 2;
    shield_inset_y = 1;
    shield_x = 12;
    shield_y = 15;
    shield_z = 3;

    color(pcb_color)
    cube([pcb_x, pcb_y, pcb_z]);

    color(shield_color)
    translate([shield_inset_x, shield_inset_y, pcb_z-nothing])
    cube([shield_x, shield_y, shield_z]);
}

esp8266mod();
