include <gridfinity-rebuilt-openscad/gridfinity-rebuilt-baseplate.scad>

/* [General Settings] */
// number of bases along x-axis
gridx = 4;

// number of bases along y-axis
gridy = 3;

/* [Screw Together Settings - Defaults work for M3 and 4-40] */
// screw diameter
d_screw = 3.35;
// screw head diameter
d_screw_head = 5;
// screw spacing distance
screw_spacing = .5;
// number of screws per grid block
n_screws = 1; // [1:3]


/* [Fit to Drawer] */
// minimum length of baseplate along x (leave zero to ignore, will automatically fill area if gridx is zero)
distancex = 0;
// minimum length of baseplate along y (leave zero to ignore, will automatically fill area if gridy is zero)
distancey = 0;

// where to align extra space along x
fitx = 0; // [-1:0.1:1]
// where to align extra space along y
fity = 0; // [-1:0.1:1]


/* [Styles] */

// baseplate styles
style_plate = 2; // [0: thin, 1:weighted, 2:skeletonized, 3: screw together, 4: screw together minimal]

// hole styles
style_hole = 0; // [0:none, 1:countersink, 2:counterbore]

/* [Magnet Hole] */
// Baseplate will have holes for 6mm Diameter x 2mm high magnets.
enable_magnet = true;
// Magnet holes will have crush ribs to hold the magnet.
crush_ribs = true;
// Magnet holes will have a chamfer to ease insertion.
chamfer_holes = true;

hole_options = bundle_hole_options(refined_hole=false, magnet_hole=enable_magnet, screw_hole=false,
				   crush_ribs=crush_ribs, chamfer=chamfer_holes, supportless=false);

epsilon = 0.01;

module SMDShelf() {
  // drawer_dims = [167, 84/2, 25];  // 1x4 grid, magnets  20 high if not magnet base.
  drawer_dims = [167, 84/2*gridy, 25];  // 2x4 grid, magnets  20 high if not magnet base.
  extra_space = 1;
  wall = 2;

  corner_r = 2;

  // Tabs on sides to slide along side slots.
  translate([-drawer_dims[0]/2-wall+epsilon, -(drawer_dims[1]-2*corner_r)/2, wall+extra_space/2]) {
    cube([wall, drawer_dims[1]-2*corner_r, wall]);
  }
  translate([drawer_dims[0]/2-epsilon, -(drawer_dims[1]-2*corner_r)/2, wall+extra_space/2]) {
    cube([wall, drawer_dims[1]-2*corner_r, wall]);
  }

  // Pull tab
  tab_y = 8;
  tab_x = 20;
  translate([-tab_x/2, -drawer_dims[1]/2-tab_y, 0]) {
    cube([tab_x, tab_y, wall]);
  }
  
}

SMDShelf();
