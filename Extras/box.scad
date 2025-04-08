// Copyright (c) 2024 Chris Lee and contibuters.
// Licensed under the MIT license. See LICENSE file in the project root for details.

include <ProjectBox/mounts.scad>
include <ProjectBox/project_box.scad>
include <ProjectBox/shtc3_window.scad>
include <board.scad>

ones = [1, 1, 1];

wall_thickness = 1;
gap = 0.2;
corner_radius = 2;
mount_offset = pad_space;

space_above_board = 1;
space_below_board = 2;
inner_dims = (board_dims
	      + Z*(space_above_board+space_below_board)
	      + 2*gap*ones);
outer_dims = (inner_dims
	      + 2*ones*wall_thickness
	      + [2, 2, 0] * corner_radius);

module PowerBox(top) {
  wall = wall_thickness;
  u = pad_space;

  difference() {
    union() {
      project_box(outer_dims,
		  wall_thickness=wall_thickness,
		  gap=gap,
		  snaps_on_sides=true,
		  corner_radius=corner_radius,
		  top=top);
    }
    // Cut outs.

    if (top) {
      translate([3*u, 5*u, board_dims[2]-2]) cube([8*u, 3*u, 10]);  
      translate([13*u, 3*u, board_dims[2]]) cube([4*u, 6*u, 10]);  
    }
  }
}
