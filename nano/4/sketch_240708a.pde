import processing.sound.*;

SoundFile sfl;
Amplitude amp;

void setup() {
  size(640, 640);
  frameRate(24);
  colorMode(RGB, 255);

  sfl = new SoundFile(this, "aliens.mp3");
  sfl.loop();  
  
  amp = new Amplitude(this);
  amp.input(sfl);
}

void draw() {
  drawSomething();
}

float divX = 50.0;
float divY = 20.0;
float eX = 0.0;
float eY = 0.0;

void drawSomething() {
  background(255);
  fill(random(255), random(255), random(255)); 
  translate(width * 0.5, height * 0.5);

  float eS = 100.0 - amp.analyze() * 50.0;
  eX += amp.analyze() * divX;
  eY += amp.analyze() * divY;
  ellipse(eX, eY, eS, eS);

  if (abs(eX) > width * 0.5) {
    divX *= -1.0;
  }
  if (abs(eY) > height * 0.5) {
    divY *= -1.0;
  }
}
