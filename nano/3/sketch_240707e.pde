import ddf.minim.*;

Minim minim;
AudioPlayer player1, player2, player3, player4;
float n = 200;
float m = 400;

void setup() {
  size(1080, 540, P2D);
  minim = new Minim(this);
  player1 = minim.loadFile("Instant Crush [music].mp3");
  player2 = minim.loadFile("Instant Crush [vocals].mp3");
  player3 = minim.loadFile("Instant Crush [bass].mp3");
  player4 = minim.loadFile("Instant Crush [drums].mp3");
  
  player1.loop();
  player2.loop();
  player3.loop();
  player4.loop();
}

void draw() {
  background(#FFFFFF);
  
  float radius1 = player1.mix.level() * width;
  float radius2 = player2.mix.level() * width;
  float radius3 = player3.mix.level() * width;
  float radius4 = player4.mix.level() * width;
  
  setColorAndDrawCircle(radius1, width / 5, height / 2);
  
  setColorAndDrawCircle(radius2, 2 * width / 5, height / 2);
  
  setColorAndDrawCircle(radius3, 3 * width / 5, height / 2);
  
  setColorAndDrawCircle(radius4, 4 * width / 5, height / 2);
}

void setColorAndDrawCircle(float radius, float x, float y) {
  float diameter = radius * 2;
  if (diameter < n) {
    fill(random(255), random(255), random(255), 200);
  } else if (diameter < m) {
    fill(random(255), random(255), random(255), 200);
  } else {
    fill(random(255), random(255), random(255), 200);
  }
  ellipse(x, y, radius, radius);
}

import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
