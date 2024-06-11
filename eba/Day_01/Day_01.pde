// Changing colors using mouse movement

/**
 * position x         : size
 * position y         : color
 * 
 * KEYS
 * s                  : save PNG
 * p                  : save pdf
*/

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;


// setup function sets the size of teh display window and makes the cursor invisible
void setup() {
  size(720, 720);
  noCursor();
}

void draw() {
  // this line will start pdf export, if the variable savePDF was set to true
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  
  // Colors should pass through the hue spectrum in this program. 
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
  background(mouseY/2, 100, 100); // the y-value of the mouse is divided by 2 to get the values from 0 to 360 on the color wheel)
  
  fill(360-mouseY/2, 100, 100);
  rect(360, 360, mouseX+1, mouseX+1);
  
  // end of the pdf recording
  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyPressed() {
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;
}

String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
