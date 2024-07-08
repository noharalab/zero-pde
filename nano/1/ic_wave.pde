import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup() {
  size(1080, 540, P3D);
  minim = new Minim(this);
  player = minim.loadFile("Instant Crush.mp3", 512);
  stroke(0,255,0);
  noFill();
  strokeWeight(1.5);
}

void draw() {
  background(0);
  for (int i = 0; i < player.bufferSize() -1; i++) {
    float x = map(i, 0, player.bufferSize(), 0, width);
    float y = map(player.left.get(i), -1, 1, 0, height/2);
    point(x, y);
  }
  translate(0, height/2);
  for (int i= 0; i < player.bufferSize() -1; i++) {
    float x = map(i, 0, player.bufferSize(), 0, width);
    float y = map(player.left.get(i), -1, 1, 0, height/2);
    point(x, y);
  }
}


void mousePressed() {
  player.rewind();
  player.play();
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}

  
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
