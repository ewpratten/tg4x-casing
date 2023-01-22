// Filler plate for the TG4X

// Keyboard dimensions
KBD_WIDTH = 255;
KBD_HEIGHT = 84;

module place_standoff_holes(x = 5, y = 4) {
  linear_extrude(height = 10) {
    // Left
    translate([ 62, 0, 0 ]) square([ x, y ]);
    // Middle
    translate([ 125, 0, 0 ]) square([ x, y ]);
    // Right
    translate([ 188, 0, 0 ]) square([ x, y ]);
  }
}

difference() {
  // Keyboard bounds
  cube([ KBD_WIDTH, KBD_HEIGHT, 3 ]);

  // Cut out the standoff holes
  union() {
    // Corner cuts
    linear_extrude(height = 10) {
      // Top left
      translate([ 0, 80, 0 ]) square([ 4, 4 ]);
      // Bottom left
      translate([ 0, 0, 0 ]) square([ 4, 4 ]);
      // Top right
      translate([ 251, 80, 0 ]) square([ 4, 4 ]);
      // Bottom right
      translate([ 251, 0, 0 ]) square([ 4, 4 ]);
    }

    // Centeral standoff holes
    translate([ 0, 80, 0 ]) place_standoff_holes();
    translate([ 0, 40, 0 ]) place_standoff_holes(y = 5);
    translate([ 0, 0, 0 ]) place_standoff_holes();
  }

  // Cut out a space for the controller
  translate([ 0, 22, 0 ]) cube([45,21,10]);
}