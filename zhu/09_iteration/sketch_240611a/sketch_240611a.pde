void setup() {
  size(600, 600);
  background(255);
  noFill();
  stroke(180);
}

void mousePressed() {
  int i = 0;
  while(i < 10) {
    ellipse(mouseX, mouseY, i * 100, i * 100);
    i = i + 1;
  }
}

void draw() {
}
