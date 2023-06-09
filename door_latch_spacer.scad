/********************************************************
 * Door Latch Spacer - vsergeev
 * https://github.com/vsergeev/3d-door-latch-spacer
 * CC-BY-4.0
 *
 * Release Notes
 *  * v1.0 - 06/20/2023
 *      * Initial release.
 ********************************************************/

/* [Basic] */

// in mm
spacer_z_thickness = 2;

/* [Advanced] */

// in mm (1 * 25.4)
spacer_x_width = 25.4;

// in mm (2.25 * 25.4)
spacer_y_height = 57.15;

// in mm
spacer_xy_radius = 6.5;

// in mm (1.6 * 25.4)
spacer_screw_y_spacing = 40.64;

// in mm (0.25 * 25.4)
spacer_screw_xy_diameter = 6.35;

// in mm (1.075 * 0.8 * 25.4)
spacer_latch_xy_diameter = 21.844;

/* [Hidden] */

$fn = 100;

/******************************************************************************/
/* 2D Profiles */
/******************************************************************************/

module profile_spacer() {
    difference() {
        /* Spacer Body */
        offset(r=spacer_xy_radius)
            offset(delta=-spacer_xy_radius)
                square([spacer_x_width, spacer_y_height], center=true);

        /* Screw Holes */
        translate([0, spacer_screw_y_spacing / 2])
            circle(d=spacer_screw_xy_diameter);
        translate([0, -spacer_screw_y_spacing / 2])
            circle(d=spacer_screw_xy_diameter);

        /* Latch Opening */
        circle(d=spacer_latch_xy_diameter);
    }
}

/******************************************************************************/
/* 3D Extrusions */
/******************************************************************************/

module spacer() {
    linear_extrude(spacer_z_thickness)
        profile_spacer();
}

/******************************************************************************/
/* Top Level */
/******************************************************************************/

spacer();
