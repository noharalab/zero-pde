void setup() {
  size(600, 600);
  noStroke();
  fill(155, 0, 155);
}

void draw() {
  background(0, 100, 255);

  for (int y = 0; y <= 600; y += 10) {
    for (int x = 0; x <= 600; x += 10) {
      float d = dist(x, y, mouseX, mouseY);
      float sz = d * 0.04;

      square(x, y, sz);
    }
  }
}
