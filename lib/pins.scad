

module socket(count, spacing=2.54)
{
    // Component-specific parameters
    socket_color = "black";
    socket_z = 7.5;

    pin_color = "lightgray";
    pin_radius = spacing/4;
    pin_z = 2;


    // Solder pin
    // color(pin_color)
    // translate([spacing/2, spacing/2, -pin_z])
    // cylinder(
    //         r = pin_radius,
    //         h = pin_z + nothing
    //     );

    // Socket
    color(socket_color)
    translate([-spacing/2, 0, 0])
    cube([spacing, count*spacing, socket_z]);
}


module pins(count, spacing=2.54)
{
    socket(count, spacing);

    // TODO...
}
