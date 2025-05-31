pipeWidth = 12;
pipeHeight = 7;
edge = 2;
margin = 0.5;
type = "adapter"; // [hookRight, hookUp, hookDown, adapter]
adapterPipeWidth = 25 - edge * 2 - margin * 2;
adapterPipeHeight = 9;

totalWidth = pipeWidth + (edge * 2) + margin * 2;
totalHeight = pipeHeight + edge + margin;

if (type == "hookRight") {
  rightHook();
} else if (type == "hookUp") {
  hookUp();
} else if (type == "hookDown") {
  hookDown();
} else if (type == "adapter") {
    
}

module pipeShell(totalWidth, totalHeight, pipeWidth, pipeHeight) {
  difference() {
    cube(size = [totalWidth, totalWidth, totalHeight]);
    translate([edge, edge, edge]) {
      cube([pipeWidth + margin * 2, pipeWidth + margin * 2, pipeHeight + margin]);   
    }
  }
}

module horizontalOpening(totalWidth, totalHeight) {
    cube([totalWidth - edge * 2, edge + margin, totalHeight - edge]);
}

module verticalOpening(totalWidth, totalHeight) {
    cube([edge + margin, totalWidth - edge * 2, totalHeight - edge]);
}

module pipeOpen(direction, totalWidth, totalHeight, pipeWidth, pipeHeight) {
  if (direction == "left")
  {
    difference() {
      pipeShell(totalWidth, totalHeight, pipeWidth, pipeHeight);
      translate ([0, edge, edge]) verticalOpening(totalWidth, totalHeight);
    }
  } else if (direction == "right")
  {
    difference() {
      pipeShell(totalWidth, totalHeight, pipeWidth, pipeHeight);
      translate ([pipeWidth + edge + margin, edge, edge]) verticalOpening(totalWidth, totalHeight);
    }
  } else if (direction == "bottom")
  {
    difference() {
      pipeShell(totalWidth, totalHeight, pipeWidth, pipeHeight);
      translate ([edge, 0, edge]) horizontalOpening(totalWidth, totalHeight);
    }
  } else if (direction == "top")
  {
    difference() {
      pipeShell(totalWidth, totalHeight, pipeWidth, pipeHeight);
      translate ([edge, totalWidth - edge, edge]) horizontalOpening(totalWidth, totalHeight);
    }
  }
}

module rightHook() {
    union() {
      intersection() {
          pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
          pipeOpen("top", totalWidth, totalHeight, pipeWidth, pipeHeight);
      }
      translate([totalWidth, totalWidth, 0]) {
          intersection() {
            pipeOpen("right", totalWidth, totalHeight, pipeWidth, pipeHeight);
            pipeOpen("left", totalWidth, totalHeight, pipeWidth, pipeHeight);
          }
      }
      translate([0, totalWidth, 0]) {
          intersection() {
            pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
            pipeOpen("right", totalWidth, totalHeight, pipeWidth, pipeHeight);
          }
      }
    }
}

module hookUp() {
    union() {
      intersection() {
          pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
          pipeOpen("top", totalWidth, totalHeight, pipeWidth, pipeHeight);
      }
      translate([0, totalWidth, 0]) rotate([90,0,0])  {
          intersection() {
            pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
            pipeOpen("top", totalWidth, totalHeight, pipeWidth, pipeHeight);
          }
      }
    }
}

module hookDown() {
    union() {
      rotate([180,0,0]) translate([0, -totalWidth, -totalHeight]) intersection() {
          pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
          pipeOpen("top", totalWidth, totalHeight, pipeWidth, pipeHeight);
      }
      translate([totalWidth, totalWidth, totalHeight]) rotate([90, 0,180]) {
          intersection() {
            pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
            pipeOpen("top", totalWidth, totalHeight, pipeWidth, pipeHeight);
          }
      }
    }
    translate([0, totalWidth, 0]) scale([1, totalHeight / totalWidth, 1])  {
          intersection() {
              pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
              pipeOpen("top", totalWidth, totalHeight, pipeWidth, pipeHeight);
      }
    }
}

module adapter() {
    union () {
        intersection() {
            pipeOpen("left", totalWidth, totalHeight, pipeWidth, pipeHeight);
            pipeOpen("right", totalWidth, totalHeight, pipeWidth, pipeHeight);
            pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
        }
        
        translate([pipeWidth - edge * 2, 0, 0]) intersection() {
            pipeOpen("left", totalWidth, totalHeight, pipeWidth, pipeHeight);
            pipeOpen("bottom", totalWidth, totalHeight, pipeWidth, pipeHeight);
        }
        difference() {
            translate([0, - adapterPipeWidth - edge - margin * 2, -(adapterPipeHeight - pipeHeight)]) {
                        pipeOpen("bottom", adapterPipeWidth + (edge * 2) + margin * 2, adapterPipeHeight + edge + margin, adapterPipeWidth, adapterPipeHeight);
            }

            translate([adapterPipeWidth / 2 - pipeWidth + margin * 2 + edge * 2, 0, 0]) {
                pipeOpen("top", totalWidth - edge, totalHeight, pipeWidth, pipeHeight);
            }
            translate([pipeWidth - margin * 4, 0, 0]) intersection() {
                translate([adapterPipeWidth / 2 - pipeWidth + margin + edge, 0, 0]) {
                    pipeOpen("top", totalWidth - edge, totalHeight, pipeWidth, pipeHeight);
                }
            }
        }
    }
}
