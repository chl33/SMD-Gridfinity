use <gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-utility.scad>
use <gridfinity-rebuilt-openscad/src/core/gridfinity-rebuilt-holes.scad>


/* [Base Hole Options] */
//Use gridfinity refined hole style. Not compatible with magnet_holes!
refined_holes = false;
// Base will have holes for 6mm Diameter x 2mm high magnets.
magnet_holes = false;
// Base will have holes for M3 screws.
screw_holes = true;
// Magnet holes will have crush ribs to hold the magnet.
crush_ribs = true;
// Magnet/Screw holes will have a chamfer to ease insertion.
chamfer_holes = true;
// Magnet/Screw holes will be printed so supports are not needed.
printable_hole_top = true;

hole_options = bundle_hole_options(refined_holes, magnet_holes, screw_holes, crush_ribs,
                                   chamfer_holes, printable_hole_top);

module SMDBin(bin_div_x = 2, bin_div_y = 2) {
  $fa = 8;
  $fs = 0.25; // .01

  gridfinityInit(1, 1, height(2), 0, 42) {
    dx = 1 / bin_div_x;
    dy = 1 / bin_div_y;
    for (x = [0:dx:1]) {
      for (y = [0:dy:1]) {
	cut(x=x, y=y, w=dx, h=dy, t=1, s=0.5);
      }
    }
    // cut(x=0.5, y=0, w=0.5, h=0.5, t=5, s=0.5);
    // cut(x=0, y=0.5, w=0.5, h=0.5, t=1, s=0.5);
    // cut(x=0.5, y=0.5, w=0.5, h=0.5, t=5, s=0.5);
  }
  gridfinityBase([1, 1], hole_options=hole_options);
}

// SMDBin();
