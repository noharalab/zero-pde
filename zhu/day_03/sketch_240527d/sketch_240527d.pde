void setup() {
  size(600, 600);
  background(255);
}

void mouseDragged() {
  stroke(0, 0, 0, 50);
  
  if (mouseX <= width/2 & mouseY <= height/2) {
    line(mouseX, mouseY, width, height);
  }
  
  if (mouseX <= width/2 & mouseY > height/2) {
    line(mouseX, mouseY, 0, height);
  }
  
  if (mouseX > width/2 & mouseY <= height/2) {
    line(mouseX, mouseY, width, 0);
  }
  
  if (mouseX > width/2 & mouseY > height/2) {
    line(mouseX, mouseY, 0, 0);
  }
  
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mouseClicked() {
  background(255);
}

void draw() {
}
