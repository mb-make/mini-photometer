
include <config.scad>;
use <d1-mini.scad>;
use <adapter.scad>;
use <led.scad>;
use <sensor.scad>;


module electronics()
{
    board_to_board_z = 12.0;

    d1_mini();

    translate([0, 0, board_to_board_z])
    {
        adapter();

        translate([
                adapter_size_x/2 - led_socket_size_x/2,
                adapter_size_y/2,
                adapter_size_z
            ])
        {
            rotate([-90, 0, 0])
            sensor_pcb();

            translate([
                    0,
                    adapter_size_y,
                    0
                ])
            rotate([0, 0, 180])
            led_socket();
        }
    }
}

electronics();
