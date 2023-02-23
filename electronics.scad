
include <config.scad>;
use <d1-mini.scad>;
use <adapter.scad>;


module electronics()
{
    board_to_board_z = 12.0;

    d1_mini();

    translate([0, 0, board_to_board_z])
    adapter();
}

electronics();
