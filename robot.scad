$fn = 80;

// --- CONFIGURATION ---
part_to_show = 0; // 0: All | 1: Front | 2: Back

// --- SIZES ---
width = 140;
length = 120;
height = 80;
thickness = 3;
rounded_edge = 8;

// --- ROUND BLOCK MODULE ---
module round_block(w, h_bloc, d, r) {
  hull() {
    for (x = [-w / 2 + r:w - 2 * r:w / 2 - r]) {
      for (y = [-h_bloc / 2 + r:h_bloc - 2 * r:h_bloc / 2 - r]) {
        translate([x, y, 0]) cylinder(h=d, r=r);
      }
    }
  }
}

// --- STANDOFF MODULE ---
module standoff(h, d_hole, d = 10) {
  difference() { cylinder(h=h, d=d); translate([0, 0, h - 8]) cylinder(h=10, d=d_hole); }
}

// --- FRONT PANEL MODULE ---
module Front() {
  difference() {
    union() {
      // PRINCIPAL BODY
      round_block(width, length, height, rounded_edge);

      // EARS
      for (x = [-1, 1])
        translate([x * (width / 2 - rounded_edge / 2), 20, height / 2])
          rotate([0, 90, 0]) cylinder(h=rounded_edge * 2, d=35, center=true);
    }

    // INNER VOID
    translate([0, 0, thickness])
      round_block(width - 2 * thickness, length - 2 * thickness, height, rounded_edge - thickness / 2);

    // --- FRONT HOLE ---
    for (i = [-2:1:2]) {
      // 5 Buttons
      translate([i * 25, -35 + abs(i) * 5, -1]) cylinder(h=thickness + 2, d=16);
    }
    for (x = [-24:8:24], y = [15:8:50]) {
      // Speaker grid
      translate([x, y, -1]) cylinder(h=thickness + 2, d=5);
    }

    // --- INTERRUPTOR HOLES ---
    translate([-width / 2 - 1, -length / 2 + 30, 15])
      cube([thickness + 10, 9, 13.5], center=true);

    // --- USB PORT ---
    translate([-width / 2 - 1, 5 + 16, height - 8])
      cube([thickness + 10, 14, 7], center=true);
  }

  // --- SPEAKER FIXATIONS ---
  // Screw holes (43mm x 43mm)
  // Centered on the speaker grid (y = 32.5 is the middle of the Speaker zone)
  translate([0, 31, thickness]) {
    for (x = [-21.5, 21.5], y = [-21.5, 21.5]) {
      translate([x, y, 0])
        difference() {
          cylinder(h=8, d=8); // Pillar for the enclosure
          translate([0, 0, 2]) cylinder(h=7, d=2.5); // Screw hole
        }
    }
  }

  // --- STRUCTURE PILLOW (Corners of the box)
  for (x = [-1, 1], y = [-1, 1]) {
    translate([x * (width / 2 - 7), y * (length / 2 - 7), thickness])
      difference() {
        cylinder(h=height - thickness, d=10);
        translate([0, 0, height - 15]) cylinder(h=16, d=2.8);
      }
  }
}

// --- BACK PANEL MODULE ---
module Back() {
  difference() {
    round_block(width, length, thickness, rounded_edge);
    for (x = [-1, 1], y = [-1, 1]) {
      translate([x * (width / 2 - 7), y * (length / 2 - 7), -1]) cylinder(h=thickness + 2, d=3.5);
    }
  }
  // STACK (Battery support / ESP Horizontal)
  // Screw holes (83 x 37)
  translate([width / 2 - 4 - thickness, 5, thickness]) {
    for (x = [0, -83], y = [0, 37]) translate([x, y, 0]) standoff(10, 2.3, d=6);
  }
  // Attached to the edge with 20mm offset to keep space for speaker
  // Screw holes (72 x 32)
  start_y = -(length / 2) + thickness + 20;
  translate([0, 0, thickness]) {
    for (x = [-36, 36], y = [start_y, start_y + 32]) translate([x, y, 0]) standoff(35, 2.5);
  }

  // i2s amp (MAX98357A) standoff
  // 2 Screw holes (12.5)
  start_x = -36 - 15;
  translate([0, 0, thickness]) {
    for (x = [start_x, start_x + 12.5], y = [37.5]) translate([x, y, 0]) standoff(4, 2.3, d=6);
  }
}

// --- ASSEMBLY ---
if (part_to_show == 1) {
  Front();
} else if (part_to_show == 2) {
  Back();
} else {
  color("MediumTurquoise") Front();
  translate([0, 0, height + 20]) color("Coral") Back();
}
