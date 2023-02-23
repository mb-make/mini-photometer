
include <config.scad>;
use <pins.scad>;
use <esp8266mod.scad>;


module d1_mini()
{
    pcb_color = "darkblue";
    pcb_x = 26.0;
    pcb_y = 35.0;
    pcb_z = 1.0;

    RM = 2.54;
    pins_color = "black";
    pins_inset_y = 7.0;
    pins_y = 8*2.54;
    pins_x = 2.54;
    pins_z = 7.5;

    smd_color = "gray";
    smd_z = 2.5;
    placeholder_y = 6.5;
    placeholder_z = 3.0;

    mod_inset_x = 5;
    mod_inset_y = 10.5;

    color(pcb_color)
    cube([pcb_x, pcb_y, pcb_z]);

    // Pins left
    translate([RM/2, pins_inset_y, pcb_z-nothing])
    pinsocket(8, RM=2.54);

    // Pins right
    translate([pcb_x-RM/2, pins_inset_y, pcb_z-nothing])
    pinsocket(8, RM=2.54);

    color(smd_color)
    {
        // SMD parts
        translate([0, pins_inset_y, nothing-smd_z])
        cube([pcb_x, pins_y, smd_z]);

        // USB port and reset button
        translate([0, 0, nothing-placeholder_z])
        cube([pcb_x, placeholder_y, placeholder_z]);
    }

    translate([mod_inset_x, mod_inset_y, pcb_z-nothing])
    esp8266mod();
}

d1_mini();
