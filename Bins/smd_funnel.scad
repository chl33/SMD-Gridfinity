use <gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-utility.scad>
use <gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-holes.scad>

$fa = 8;
$fs = 0.25; // .01

radius=5;
hole_r=2;

module funnel() {
  scale([1, 1, 2]) difference() {
    cylinder(radius, radius+hole_r, radius+hole_r);
    rotate_extrude() translate([radius+hole_r, 0, 0]) circle(r=radius);
  }
}

difference() {
  union() {
    gridfinityInit(1, 1, height(2), 0, 42) {
      cut(x=0, y=0, w=1, h=1, t=1, s=0.5);
    }
    gridfinityBase([1, 1]);
  }
  translate([-10, -8, -3]) funnel();
}
