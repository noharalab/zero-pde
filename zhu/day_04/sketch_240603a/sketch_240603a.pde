void setup() {
  size(600, 600);
  background(255, 255, 255);
  noStroke();
}

void mouseDragged() {
  fill(0, 0, 0);
  ellipse(mouseX, mouseY, 100, 100);
  if (mouseButton == LEFT) {
    stroke(0, 0, 0);
  }
  else if (mouseButton == RIGHT) {
    stroke(255, 0, 0);
  }
  
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void draw() {
}
