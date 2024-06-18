PImage img;

void setup() {
  size(600, 600);
  background(255);

  img = loadImage("0x00055.png");
}

void mousePressed() {
  image(img, mouseX, mouseY);
}

void draw() {
}
