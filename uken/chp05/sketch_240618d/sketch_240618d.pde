float x = 10;

void setup() {
  size(600, 600);

  noStroke();

  for (int iy = 0; iy < 60; iy++) {
    for (int ix = 0; ix < 60; ix++) {
      float r = random(0, 255);
      float g = random(0, 255);
      float b = random(0, 0);
      fill(r, g, b);

      rect(
        ix * 10, iy * 10,
        10, 10
      );
    }
  }
}

void draw() {
}

void mousePressed() {
  for (int iy = 0; iy < 60; iy++) {
    x++;
    for (int ix = 0; ix < 60; ix++) {
      float r = random(0, 255 - x);
      float g = random(0, 255);
      float b = random(0, 0 + x);
      fill(r, g, b);

      rect(
        ix * 10, iy * 10,
        10, 10
      );
    }
  }
}
