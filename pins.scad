

module pinsocket(count, RM=2.54)
{
    // Component-specific parameters
    socket_color = "black";
    socket_z = 7.5;

    pin_color = "lightgray";
    pin_radius = RM/4;
    pin_z = 2;


    // Solder pin
    color(pin_color)
    translate([RM/2, RM/2, -pin_z])
    cylinder(
            r = pin_radius,
            h = pin_z + nothing
        );

    // Socket
    color(socket_color)
    cube([RM, count*RM, socket_z]);
}


module pins(count, RM=2.54)
{
    pinsocket(count, RM);

    // TODO...
}
