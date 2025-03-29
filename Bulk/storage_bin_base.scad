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

module StorageBin(bin_sz_x = 1, bin_sz_y = 2, bin_div_x = 3, bin_div_y = 1) {
  $fa = 8;
  $fs = 0.25; // .01

  gridfinityInit(bin_sz_x, bin_sz_y, height(5), 0, 42) {
    dx = bin_sz_x / bin_div_x;
    dy = bin_sz_y / bin_div_y;
    for (x = [0:dx:bin_sz_x]) {
      for (y = [0:dy:bin_sz_y]) {
	// Put lift-tab only at the front holes of the bin.
	tab = (y + dy + 0.1 >= bin_sz_y) ? 1 : 5;
	cut(x=x, y=y, w=dx, h=dy, s=0.5, t=tab);
      }
    }
  }
  gridfinityBase([bin_sz_x, bin_sz_y], hole_options=hole_options);
}

// SMDBin();
