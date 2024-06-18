PImage img0;
PImage img1;
PImage img2;
PImage img3;

void setup() {
  size(600, 600);
  img0 = loadImage("0x00041.png");
  img1 = loadImage("0x00042.png");
  img2 = loadImage("0x00043.png");
  img3 = loadImage("0x00044.png");
}

float count;

void draw() {
  background(255);
  count = count + 0.1;
  if (count >= 4) {
    count = 0;
  }

  int f = floor(count);

  if (f == 0) {
    image(img0, 245, 245);
  }
  else if (f == 1) {
    image(img1, 245, 245);
  }
  else if (f == 2) {
    image(img2, 245, 245);
  }
  else if (f == 3) {
    image(img3, 245, 245);
  }
  
  if (mouseX < 100) {
    image(img0, 245, 245);
  }
  else if (mouseX > 500) {
    image(img3, 245, 245);
  }
}
