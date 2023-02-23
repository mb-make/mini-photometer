
include <config.scad>;
use <pins.scad>;


module sensor_pcb()
{
    pcb_color = "darkblue";
    pcb_x = 20.0;
    pcb_y = 20.0;
    pcb_z = 1.0;

    ears_inner_d = 2.0;
    ears_outer_d = 3.0;

    hole_d = 4.5;

    sensor_color = "lightgray";
    sensor_x = 4;
    sensor_y = 2;
    sensor_z = 1.5;
    sensor_inset_x = 8.0;
    sensor_inset_y = 3.0;

    RM = 2.54;
    pin_count = 4;
    pinsocket_y = 16.0;
    pinsocket_inset_x = pcb_x/2 - pin_count*RM/2;

    difference()
    {
        color(pcb_color)
        union()
        {
            // Main body
            cube([pcb_x, pcb_y, pcb_z]);

            // Ear left
            translate([0, pcb_y/2, -nothing])
            cylinder(
                    r = ears_outer_d,
                    h = pcb_z + 2*nothing
                );

            // Ear right
            translate([pcb_x, pcb_y/2, -nothing])
            cylinder(
                    r = ears_outer_d,
                    h = pcb_z + 2*nothing
                );
        }

        // Bottom edge hole
        translate([pcb_x/2, 0, -nothing])
        cylinder(
                r = hole_d/2,
                h = pcb_z + 2*nothing
            );

        // Top edge hole
        translate([pcb_x/2, pcb_y, -nothing])
        cylinder(
                r = hole_d/2,
                h = pcb_z + 2*nothing
            );

        union()
        {
            // Ear hole left
            translate([0, pcb_y/2, -2*nothing])
            cylinder(
                    r = ears_inner_d,
                    h = pcb_z + 4*nothing
                );

            // Ear hole right
            translate([pcb_x, pcb_y/2, -2*nothing])
            cylinder(
                    r = ears_inner_d,
                    h = pcb_z + 4*nothing
                );
        }
    }

    // SMD sensor IC
    color(sensor_color)
    translate([
        sensor_inset_x,
        sensor_inset_y,
        pcb_z-nothing
    ])
    cube([sensor_x, sensor_y, sensor_z+nothing]);

    // Pin socket
    translate([pinsocket_inset_x, pinsocket_y, 0])
    rotate([0, 0, -90])
    pinsocket(count=pin_count, RM=RM);
};

sensor_pcb();
