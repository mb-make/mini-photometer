
include <../electronics/config.scad>;
use <pins.scad>;


/**
 * Seeedstudio Grove module:
 * Digital light sensor with AMS TSL2561
 *
 * https://wiki.seeedstudio.com/Grove-Digital_Light_Sensor/
 * https://wiki.seeedstudio.com/Grove_System/
 * https://ams.com/tsl2561
 */
module sensor_pcb(
            // PCB outline
            pcb_color = "darkblue",
            pcb_size_x = sensor_pcb_size_x,
            pcb_size_y = sensor_pcb_size_y,
            pcb_size_z = sensor_pcb_size_z,

            // PCB cutouts
            ears_inner_d = 2.0,
            ears_outer_d = 3.0,

            hole_d = 4.5,

            // Sensor IC parameters
            sensor_color = "lightgray",
            sensor_size_x = 4,
            sensor_size_y = 2,
            sensor_size_z = 1.5,
            sensor_inset_x = 8.0,
            sensor_inset_y = 3.0,

            // Pin socket parameters
            pin_spacing = 2.54,
            pin_count = 4,
            pins_inset_y = 16.0
        )
{
    // Pins sentered on X axis
    pins_inset_x = pcb_size_x/2 - pin_count*pin_spacing/2;

    difference()
    {
        color(pcb_color)
        union()
        {
            // Main body
            cube([
                pcb_size_x,
                pcb_size_y,
                pcb_size_z
            ]);

            // Ear left
            translate([
                0,
                pcb_size_y/2,
                -nothing
            ])
            cylinder(
                    r = ears_outer_d,
                    h = pcb_size_z + 2*nothing
                );

            // Ear right
            translate([pcb_size_x, pcb_size_y/2, -nothing])
            cylinder(
                    r = ears_outer_d,
                    h = pcb_size_z + 2*nothing
                );
        }

        // Bottom edge hole
        translate([
            pcb_size_x/2,
            0,
            -nothing
        ])
        cylinder(
            r = hole_d/2,
            h = pcb_size_z + 2*nothing
        );

        // Top edge hole
        translate([
            pcb_size_x/2,
            pcb_size_y,
            -nothing
        ])
        cylinder(
            r = hole_d/2,
            h = pcb_size_z + 2*nothing
        );

        union()
        {
            // Ear hole left
            translate([
                0,
                pcb_size_y/2,
                -2*nothing
            ])
            cylinder(
                r = ears_inner_d,
                h = pcb_size_z + 4*nothing
            );

            // Ear hole right
            translate([
                pcb_size_x,
                pcb_size_y/2,
                -2*nothing
            ])
            cylinder(
                r = ears_inner_d,
                h = pcb_size_z + 4*nothing
            );
        }
    }

    // SMD sensor IC
    color(sensor_color)
    translate([
        sensor_inset_x,
        sensor_inset_y,
        pcb_size_z-nothing
    ])
    cube([
        sensor_size_x,
        sensor_size_y,
        sensor_size_z+nothing
    ]);

    // Pin socket
    translate([
        pins_inset_x,
        pins_inset_y,
        pcb_size_z+nothing
    ])
    rotate([0, 0, -90])
    socket(count=pin_count, spacing=pin_spacing);
};

sensor_pcb();
