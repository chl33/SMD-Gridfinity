include <MCAD/units.scad>
include <ProjectBox/headers.scad>

board_dims = [1.75*inch, 0.75*inch, 1];

	// // heater barrel connector
	// translate([20.8*u, 9.5*u, 0]) cube([6*u, 5.5*u, 10]);

module PowerBoard() {
  color("green") {
    cube(board_dims);
  }
  u = pad_space;
  translate([2*u, 2*u, board_dims[2]] + [u, 18-4*u, 0]) connector_nx1(2);
  translate([6*u, 2*u, board_dims[2]] + [u, 18-4*u, 0]) connector_nx1(2);

  //translate([11*u, u, board_dims[2]]) color("black") cube([6*u, 5.5*u, 10]);  
}
