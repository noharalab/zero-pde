void setup() {
  size(600, 600);
  background(200, 200, 200);
  noStroke();
}

void mouseMoved() {
  
  if (mouseX + mouseY < width) {
    fill(0, 0, 0);
  }
  else {
    fill(255, 255, 255);
  }
  
  ellipse(mouseX, mouseY, 100, 100);
}

void draw() {
}
