
include <../electronics/config.scad>;


/**
 * PCB with Espressif ESP8266 Wifi MCU and onboard antenna
 */
module esp8266mod(
            // PCB outline
            pcb_color = "black",
            pcb_size_x = 16.0,
            pcb_size_y = 24.0,
            pcb_size_z = 1.0,

            // MCU shield outline
            shield_color = "lightgray",
            shield_size_x = 12,
            shield_size_y = 15,
            shield_size_z = 3,
            shield_inset_x = 2,
            shield_inset_y = 1
        )
{
    // Board
    color(pcb_color)
    cube([pcb_size_x, pcb_size_y, pcb_size_z]);

    // MCU shield
    color(shield_color)
    translate([shield_inset_x, shield_inset_y, pcb_size_z-nothing])
    cube([shield_size_x, shield_size_y, shield_size_z]);
}

esp8266mod();
