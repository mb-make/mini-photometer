
$fn = 20;

// Quick-fix for rendering issues on overlapping surfaces
nothing = 0.001;


/*
 * Cuvette parameters (cubic)
 */
cuvette_size_x = 10.0;
cuvette_size_y = 10.0;
cuvette_size_z = 45.0;

// Additional space to leave empty between cuvette and 3d-printed surfaces (holder as well as cap)
cuvette_margin_x = 0.1;
cuvette_margin_y = 0.1;
cuvette_margin_z = 0.1;

/*
 * Box parameters
 */
box_wall_thickness = 2.0;

box_inner_size_x = 39.5;
box_inner_size_y = 37.5;
box_inner_size_z = 26.0;

box_size_x = box_inner_size_x + 2*box_wall_thickness;
box_size_y = box_inner_size_y + 2*box_wall_thickness;
box_size_z = box_inner_size_z + 2*box_wall_thickness;

box_curvature_radius = 2.0;

/*
 * Lid parameters
 */
lid_inset_slider = 1.0;
lid_inset_holder = 2.0;
lid_slider_size_z = 1.0;

/**
 * Cuvette holder parameters
 */
cuvette_holder_wall_thickness = 1.0;

// Distance between inner box wall and holder
cuvette_holder_inset_y = 13.0;

// Distance between inner box wall (bottom) and center of circular openings (on the Y axis)
lightpath_offset_z = 15.0;

lightpath_hole_diameter = 5.0;
lightpath_size_x = 5.0;
lightpath_size_y = 10.0;

/*
 * Cap parameters
 */
cap_hole_diameter = 1.0;
