void setup() {
  size(600, 600);
  background(200, 200, 200);
  noStroke();
}

void mouseMoved() {
  if (mouseX < 150) {
    fill(0, 0, 0);
  }
  else if(mouseX >= 150 & mouseX < 300){
    fill(255, 0, 0);
  }
  else if(mouseX >= 300 & mouseX < 450) {
    fill(0, 255, 0);
  }
  else {
    fill(0, 0, 255);
  }

  ellipse(mouseX, mouseY, 100, 100);
}

void draw() {
}
