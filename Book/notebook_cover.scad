include <MCAD/units.scad>

module notebook_cover(front=true) {
  difference() {
    hole_x = 10;
    hole_y = 1*inch;
    hole_r = 2;
    dim_x = front ? hole_x + hole_r * 2 : 5*inch;
    dim_z = front ? 2.0 : 1.0;
    dim = [dim_x, 7*inch, dim_z];
    cube(dim);
    translate([hole_x, hole_y, -epsilon]) {
      cylinder(dim[2]+2, hole_r, hole_r, $fn=40);
    }
    translate([hole_x, dim[1]-hole_y, -epsilon]) {
      cylinder(dim[2]+2, hole_r, hole_r, $fn=40);
    }
  }
}
