
/**
 * A cuboid with rounded corners
 *
 * https://hackaday.com/2018/02/13/openscad-tieing-it-together-with-hull/
 */
module cuboid(
          size_x,
          size_y,
          size_z,
          curvature_radius
        )
{
  // Generate a closed surface around eight spheres placed the corners of a cuboid
	hull()
	{
    for (x = [curvature_radius, size_x-curvature_radius])
      for (y = [curvature_radius, size_y-curvature_radius])
        for (z = [curvature_radius, size_z-curvature_radius])
          translate([x, y, z])
          sphere(curvature_radius);
	}
}

// Demo cuboid
cuboid(
  size_x = 10,
  size_y = 12.5,
  size_z = 15,
  curvature_radius = 3
);
