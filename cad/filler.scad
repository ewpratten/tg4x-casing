// Filler plate for the TG4X

// Keyboard dimensions
KBD_WIDTH = 255;
KBD_HEIGHT = 84;

// Used to automatically render each half to a different STL file
ENABLE_HALVES = [ true, true ];

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

// Used to slice the model into halves for printing
difference() {
  // Model
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
    translate([ 0, 22, 0 ]) cube([ 45, 21, 10 ]);
  }

  // Slicing functionality
  if (!ENABLE_HALVES[0]) {
    translate([ 0, 0, 0 ]) cube([ KBD_WIDTH/2, KBD_HEIGHT, 10 ]);
  } 
  if (!ENABLE_HALVES[1]) {
    translate([ KBD_WIDTH/2, 0, 0 ]) cube([ KBD_WIDTH/2, KBD_HEIGHT, 10 ]);
  }
}