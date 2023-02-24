
include <config.scad>;
use <../lib/pins.scad>;


module adapter(
            // PCB outline
            pcb_color = "darkblue",
            pcb_x = adapter_pcb_size_x,
            pcb_y = adapter_pcb_size_y,
            pcb_z = adapter_pcb_size_z,

            // Pin sockets left and right
            pin_spacing = 2.54,
            pins_inset_y = 7.0,
            pin_count = 8,

            // Bottom-left corner
            corner_x = 2.0,
            corner_y = 7.0,
        )
{
    difference()
    {
        // PCB
        color(pcb_color)
        cube([
            pcb_x,
            pcb_y,
            pcb_z
        ]);

        // Bottom-left corner
        translate([-nothing, -nothing, -nothing])
        cube([
            corner_x + nothing,
            corner_y + nothing,
            pcb_z + 2*nothing
        ]);
    }

    // Pins left
    translate([
        pin_spacing/2,
        pins_inset_y + nothing,
        nothing
    ])
    rotate([0, 180, 0])
    pins(pin_count, spacing=pin_spacing);

    // Pins right
    translate([
        pcb_x - pin_spacing/2,
        pins_inset_y,
        nothing
    ])
    rotate([0, 180, 0])
    socket(pin_count, spacing=pin_spacing);
}

adapter();
