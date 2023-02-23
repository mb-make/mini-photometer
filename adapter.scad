
include <config.scad>;
use <pins.scad>;


module adapter()
{
    pcb_color = "darkblue";
    pcb_x = 26;
    pcb_y = 29;
    pcb_z = 1;

    corner_x = 2;
    corner_y = 7;

    RM = 2.54;
    pins_inset_y = 7.0;

    difference()
    {
        // PCB
        color(pcb_color)
        cube([pcb_x, pcb_y, pcb_z]);

        // Bottom-left corner
        translate([-nothing, -nothing, -nothing])
        cube([corner_x+nothing, corner_y+nothing, pcb_z+2*nothing]);
    }

    // Pins left
    translate([RM/2, pins_inset_y+nothing, nothing])
    rotate([0, 180, 0])
    pinsocket(8, RM=2.54);

    // Pins right
    translate([pcb_x-RM/2, pins_inset_y, nothing])
    rotate([0, 180, 0])
    pinsocket(8, RM=2.54);
}

adapter();
