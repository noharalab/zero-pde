void setup() {
  size(600, 600);
  background(255);
}

void mouseDragged() {
  stroke(0, 0, 0, 50);
  line(mouseX, mouseY, width/2, height/2);
  
  if (mouseY > height/2) {
    line(pmouseX, pmouseY + 10, mouseX, mouseY + 10);
    line(pmouseX, pmouseY, pmouseX, pmouseY + 10);
    line(mouseX, mouseY, mouseX, mouseY + 10);
  } else {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mouseClicked() {
  background(255);
}

void draw() {
}
