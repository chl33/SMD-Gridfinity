include <ProjectBox/hexsheet.scad>
include <ProjectBox/rounded_box.scad>

epsilon = 0.01;

module SMDCabinet(num_shelves=1) {
  drawer_dims = [167, 84, 25];  // 2x4 grid, magnets  20 high if not magnet base.
  // drawer_dims = [167, 84/2, 25];  // 1x4 grid, magnets  20 high if not magnet base.
  extra_space = 1;
  wall = 2;
  corner_radius = 1;

  
  drawer_space = drawer_dims + extra_space*[2, 1, 2];

  space_between_shelves = wall + drawer_space[2];

  outer_dims = [drawer_space[0] + wall*4,
		drawer_space[1] + wall,
		num_shelves * space_between_shelves + wall];

  difference() {
    cube(outer_dims);
    translate([-epsilon, 0, 0]) {
      hside = wall * 1.5;
      space = wall * 2 / 3;
      border = wall * 3;
      hexes_yz(outer_dims[1], outer_dims[2], 2*wall+2*epsilon, hside, space, border);
      translate([outer_dims[0]-2*wall, 0, 0]) {
	hexes_yz(outer_dims[1], outer_dims[2], 2*wall+2*epsilon, hside, space, border);
      }
    }
    translate([0, outer_dims[1]-wall-epsilon, 0]) {
      hside = wall * 1.5;
      space = wall * 2 / 3;
      border = wall * 3;
      hexes_xz(outer_dims[0], outer_dims[2], wall+2*epsilon, hside, space, border);
    }
    for (i = [0:num_shelves-1]) {
      translate([2*wall, -epsilon, wall + i * space_between_shelves]) {
	cube(drawer_space);
	// Add a slot in sides to guide tabs in shelves.
	translate([-wall, 0, wall]) cube([outer_dims[0]-2*wall, drawer_space[1], wall+extra_space]);
      }
    }
  }
}


SMDCabinet(num_shelves=3);
