/**
 * typewriter. time reactive. 
 * 
 * MOUSE
 * position y           : adjust spacing (line height)
 * 
 * KEYS
 * a-z                  : text input (keyboard)
 * backspace            : delete last typed letter
 * ctrl                 : save png + pdf
 */

import processing.pdf.*;
import java.util.Calendar;

boolean doSave = false;

String textTyped = "Type fast and slow";
float[] fontSizes = new float[textTyped.length()];
float minFontSize = 15;
float maxFontSize = 500;
float newFontSize = 0;

int pMillis;
float maxTimeDelta = 5000.0;

float spacing = 10; // line height
float tracking = 0; // between letters
PFont font;



void setup() {
  size(800, 600);
  // make window resizable
  surface.setResizable(true);

  font = createFont("Arial",10);

  smooth();
  noCursor();

  // init fontSizes
  for (int i = 0; i < textTyped.length(); i++) {
    fontSizes[i] = minFontSize;
  }

  pMillis = millis();
}


void draw() {
  if (doSave) beginRecord(PDF, timestamp()+".pdf");
  background(255);
  textAlign(LEFT);
  fill(0);
  noStroke();

  spacing = map(mouseY, 0,height, 0,120);
  translate(0, 200+spacing);

  float x = 0, y = 0, fontSize = 20;

  for (int i = 0; i < textTyped.length(); i++) {
    // get fontsize for the actual letter from the array
    fontSize = fontSizes[i];
    textFont(font, fontSize);
    char letter = textTyped.charAt(i);
    float letterWidth = textWidth(letter) + tracking;
    
    if (x+letterWidth > width) {
      // start new line and add line height
      x = 0;
      y += spacing; 
    }
    
    // draw letter
    text(letter, x, y);
    // update x-coordinate for next letter
    x += letterWidth;
  }

  // blinking cursor after text
  float timeDelta = millis() - pMillis;
  newFontSize = map(timeDelta, 0,maxTimeDelta, minFontSize,maxFontSize);
  newFontSize = min(newFontSize, maxFontSize);

  fill(200, 30, 40);
  if (frameCount/10 % 2 == 0) fill(255);
  rect(x, y, newFontSize/2, newFontSize/20);


  if (doSave) {
    doSave = false;
    endRecord();
    saveFrame(timestamp()+"_##.png");
  }
}



void keyReleased() {
  // export pdf and png
  if (keyCode == CONTROL) doSave = true;
}


void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case DELETE:
    case BACKSPACE:
      if (textTyped.length() > 0) {
        textTyped = textTyped.substring(0,max(0,textTyped.length()-1));
        fontSizes = shorten(fontSizes);
      }
      break;
      // disable those keys
    case TAB:
    case ENTER:
    case RETURN:
    case ESC:
      break;
    default:
      textTyped += key;
      fontSizes = append(fontSizes, newFontSize);
    }

    // reset timer
    pMillis = millis();
  }
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
