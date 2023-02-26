
include <config.scad>;
use <../lib/d1mini.scad>;
use <../lib/sensor.scad>;
use <adapter-pcb.scad>;
use <light-source.scad>;


/**
 * Completely assembled photometer electronics:
 *  - MCU board
 *  - adapter board
 *  - LED
 *  - sensor
 */
module electronics(
            // From  MCU PCB to adapter PCB (bottom edges, respectively)
            adapter_pcb_offset_z = 12.0
        )
{
    // MCU board
    d1mini();

    translate([0, 0, adapter_pcb_offset_z])
    {
        // Adapter/breakout board
        adapter();

        // On top of the adapter board
        translate([0, 0, adapter_pcb_size_z - nothing])
        {
            // Centered on the X axis, almost on the bottom edge of the adapter board
            translate([adapter_pcb_size_x/2 - sensor_pcb_size_x/2, adapter_pin_spacing/2, 0])
            {
                // Properly rotated sensor board
                translate([0, 0, sensor_pcb_size_y])
                rotate([-90, 0, 0])
                sensor_pcb();
            }

            // Centered on the X axis, on the top edge of the adapter board
            translate([
                adapter_pcb_size_x/2 - led_socket_size_x/2,
                adapter_pcb_size_y,
                0
            ])
            {
                // Properly rotated LED socket with LED
                translate([led_socket_size_x, 0, 0])
                rotate([0, 0, 180])
                light_source();
            }
        }
    }
}

electronics();
