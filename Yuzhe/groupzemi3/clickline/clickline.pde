int px;
int py;

void setup() {
  size(600, 600);
  stroke(0);
  fill(0);
}


void mousePressed() {
  px = mouseX;
  py = mouseY;
}

void draw() {
  background(255);
  ellipse(px, py, 10, 10);
  line(px, py, mouseX, mouseY);
}
