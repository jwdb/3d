pipeWidth = 12;
pipeHeight = 9;
edge = 2;
margin = 0.5;
type = "hookRight"; // [hookRight, hookUp, hookDown]

totalWidth = pipeWidth + (edge * 2) + margin * 2;
totalHeight = pipeHeight + edge + margin;

if (type == "hookRight") {
  rightHook();
} else if (type == "hookUp") {
  hookUp();
} else if (type == "hookDown") {
  hookDown();
}

module pipeShell() {
  difference() {
    cube(size = [totalWidth, totalWidth, totalHeight]);
    translate([edge, edge, edge]) {
      cube([pipeWidth + margin * 2, pipeWidth + margin * 2, pipeHeight + margin]);   
    }
  }
}

module horizontalOpening() {
    cube([totalWidth - edge * 2, edge + margin, totalHeight - edge]);
}

module verticalOpening() {
    cube([edge + margin, totalWidth - edge * 2, totalHeight - edge]);
}

module pipeOpen(direction) {
  if (direction == "left")
  {
    difference() {
      pipeShell();
      translate ([0, edge, edge]) verticalOpening();
    }
  } else if (direction == "right")
  {
    difference() {
      pipeShell();
      translate ([pipeWidth + edge + margin, edge, edge]) verticalOpening();
    }
  } else if (direction == "bottom")
  {
    difference() {
      pipeShell();
      translate ([edge, 0, edge]) horizontalOpening();
    }
  } else if (direction == "top")
  {
    difference() {
      pipeShell();
      translate ([edge, totalWidth - edge, edge]) horizontalOpening();
    }
  }
}

module rightHook() {
    union() {
      intersection() {
          pipeOpen("bottom");
          pipeOpen("top");
      }
      translate([totalWidth, totalWidth, 0]) {
          intersection() {
            pipeOpen("right");
            pipeOpen("left");
          }
      }
      translate([0, totalWidth, 0]) {
          intersection() {
            pipeOpen("bottom");
            pipeOpen("right");
          }
      }
    }
}

module hookUp() {
    union() {
      intersection() {
          pipeOpen("bottom");
          pipeOpen("top");
      }
      translate([0, totalWidth, 0]) rotate([90,0,0])  {
          intersection() {
            pipeOpen("bottom");
            pipeOpen("top");
          }
      }
    }
}

module hookDown() {
    union() {
      rotate([180,0,0]) translate([0, -totalWidth, -totalHeight]) intersection() {
          pipeOpen("bottom");
          pipeOpen("top");
      }
      translate([totalWidth, totalWidth, totalHeight]) rotate([90, 0,180]) {
          intersection() {
            pipeOpen("bottom");
            pipeOpen("top");
          }
      }
    }
    translate([0, totalWidth, 0]) scale([1, totalHeight / totalWidth, 1])  {
          intersection() {
              pipeOpen("bottom");
              pipeOpen("top");
      }
    }
}