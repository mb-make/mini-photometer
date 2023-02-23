
include <config.scad>;
use <pins.scad>;


module led_socket()
{
    RM = 2.54;

    led_color = "red";
    led_r = 5;
    led_h = 11;
    led_x = 2.0 * RM;
    led_z = 15.0;

    rotate([0, 0, -90])
    pinsocket(count=4, RM=2.54);

    translate([RM/2, -RM/2+nothing, 0])
    cube([3*RM, RM/2+nothing, led_z]);

    color(led_color)
    translate([led_x, 0, led_z])
    rotate([-90, 0, 0])
    cylinder(
            r = led_r,
            h = led_h
        );
}

led_socket();
