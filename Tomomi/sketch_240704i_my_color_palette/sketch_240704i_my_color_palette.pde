//独自の色パレット

void setup() {
  size(600, 600);

  colorMode(HSB, 360, 100, 100);
  noStroke();

  for (int iy = 0; iy < 50; iy++) {
    for (int ix = 0; ix < 50; ix++) {
      float h = random(100, 200);
      float s = map(
        cos(map(h, 100, 200, 0, 2*PI)),
        -1, +1,
        0, 240);
      float b = random(0, s);
      fill(h, s, b);
      rect(
        ix * 12, iy * 12,
        12, 12
        );
    }
  }
}

void draw() {
}
void mousePressed() {
  save("Tomomi's-color-palette.png");
}
