void setup() {
  size(600, 600);
  background(255, 255, 255);
}

void mouseDragged() {
  strokeWeight(random(1, 20));
  stroke(0, 0, random(100, 255), random(200, 255));
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void draw() {
}
