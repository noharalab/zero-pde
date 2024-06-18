PImage img;
PImage img2;

void setup() {
  size(600, 600);
  background(255);

  img = loadImage("0x00055_o.png");
  img2 = loadImage("0x00055.png");
}

void mouseDragged() {
  image(img2, mouseX, mouseY);
}

void mousePressed() {
  image(img, mouseX, mouseY);
}

void draw() {
}
