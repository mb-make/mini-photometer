
include <../electronics/config.scad>;
use <pins.scad>;
use <esp8266mod.scad>;


/**
 * D1-mini breakout board with Espressif ESP8266 Wifi MCU module
 */
module d1mini(
            // PCB outline
            pcb_color = "darkblue",
            pcb_size_x = d1mini_pcb_size_x,
            pcb_size_y = d1mini_pcb_size_y,
            pcb_size_z = 1.0,

            // Pins
            pin_color = "black",
            pin_spacing = 2.54,
            pin_count = 8,
            pins_size_z = 7.5,
            pins_inset_y = 6.8,

            // Placeholders for SMD components
            smd_color = "gray",
            smd_size_z = 2.5,
            usb_size_x = usb_size_x,
            usb_size_y = usb_size_y,
            usb_size_z = usb_size_z,
            usb_inset_x = d1mini_usb_inset_x,

            // MCU module
            mod_inset_x = 5.0,
            mod_inset_y = 10.5
        )
{
    pins_size_y = pin_count * pin_spacing;
    pins_size_x = pin_spacing;

    // PCB outline
    color(pcb_color)
    cube([pcb_size_x, pcb_size_y, pcb_size_z]);

    // Pins left
    translate([
        pin_spacing/2,
        pins_inset_y,
        pcb_size_z - nothing
    ])
    socket(pin_count, spacing=pin_spacing);

    // Pins right
    translate([
        pcb_size_x - pin_spacing/2,
        pins_inset_y,
        pcb_size_z - nothing
    ])
    pins(pin_count, spacing=pin_spacing);

    // Generic placeholders
    color(smd_color)
    {
        // SMD parts
        translate([0, pins_inset_y, -smd_size_z + nothing])
        cube([
            pcb_size_x,
            pins_size_y,
            smd_size_z
        ]);

        // USB port
        translate([usb_inset_x-usb_size_x/2, 0, -usb_size_z + nothing])
        cube([
            usb_size_x,
            usb_size_y,
            usb_size_z
        ]);

        // Reset button
        // translate([0, 0, -placeholder_size_z + nothing])
        // cube([
        //     pcb_size_x,
        //     placeholder_size_y,
        //     placeholder_size_z
        // ]);
    }

    // MCU board
    translate([mod_inset_x, mod_inset_y, pcb_size_z-nothing])
    esp8266mod();
}


// Preview
d1mini();
