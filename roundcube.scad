
/**
 * A cube with radiusounded coradiusneradiuss
 *
 * https://hackaday.com/2018/02/13/openscad-tieing-it-togetheradius-with-hull/
 */
module roundcube(
        size_x,
        size_y,
        size_z,
        radius
        )
{
	hull()
	{
        for (x = [radius, size_x-radius])
            for (y = [radius, size_y-radius])
                for (z = [radius, size_z-radius])
                    translate([x, y, z])
                    sphere(radius);
	}
}

// Demo cube
roundcube(
    10,
    12.5,
    15,
    3
);
