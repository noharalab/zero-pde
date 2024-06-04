// Draw the color spectrum by moving the mouse

/* 
 * Mouse
 * position x       : saturation
 * position y       : brightness 
 *
 * 
 * KEYS
 * 1-5              : number of segments
 * s                : save png
 * p                : save pdf
*/ 

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

int segmentCount = 360;
int radius = 360;

void setup() {
  size(800, 800);
}

void draw() {
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");
  
  noStroke();
  colorMode(HSB, 360, width, height); // the ranges of the values will be changed according to the h and w
  background(360);
  
  float angleStep = 360/segmentCount; // Angle increment depends on how many segments will be drawn
  
  beginShape(TRIANGLE_FAN);
  vertex(width/2, height/2); // the first vertex is the middle of the display
  for (float angle=0; angle<=360; angle+=angleStep){
    float vx = width/2 + cos(radians(angle))*radius;
    float vy = height/2 + sin(radians(angle))*radius;
    vertex(vx, vy);
    fill(angle, mouseX, mouseY);
  }
  endShape();
  
  if (savePDF) {
    savePDF = false;
    endRecord();
  }  
} 

void keyReleased(){
  if (key=='s' || key=='S') saveFrame(timestamp()+"_##.png");
  if (key=='p' || key=='P') savePDF = true;

  switch(key){
  case '1':
    segmentCount = 360;
    break;
  case '2':
    segmentCount = 45;
    break;
  case '3':
    segmentCount = 24;
    break;
  case '4':
    segmentCount = 12;
    break;
  case '5':
    segmentCount = 6;
    break;
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
