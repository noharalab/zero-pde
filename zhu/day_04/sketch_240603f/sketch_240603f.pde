void setup() {
  size(600, 600);

  strokeWeight(2);
  fill(255, 200, 100);
}

void draw() {
  background(255, 255, 255);
  ellipse(second(), frameCount, 50, 50);
}
