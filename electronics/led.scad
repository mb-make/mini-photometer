
include <config.scad>;
use <../lib/pins.scad>;


/**
 * Socket for a three-color LED (4 terminals)
 * including the LED, angled 90 degrees
 */
module led_socket(
            // Pins
            pin_color = "silver",
            pin_spacing = led_socket_pin_spacing,
            pin_count = led_socket_pin_count,

            // LED
            led_color = "red",
            led_d = led_diameter,
            led_h = 11.0,
            led_z = 16.0
        )
{
    led_x = pin_count/2 * pin_spacing;

    // Pin socket
    translate([0, pin_spacing/2, 0])
    rotate([0, 0, -90])
    pins(count=pin_count, spacing=pin_spacing);

    // LED pins
    color(pin_color)
    translate([pin_spacing/2, pin_spacing/4 + nothing, nothing])
    cube([3*pin_spacing, pin_spacing/2, led_z]);

    // LED body
    color(led_color)
    translate([led_x, pin_spacing/2, led_z])
    rotate([-90, 0, 0])
    cylinder(
        r = led_d/2,
        h = led_h
    );
}

led_socket();
