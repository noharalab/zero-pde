void setup() {
  size(600, 600);
  background(255);
}

void mouseDragged() {
  stroke(0);
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  stroke(0, 0, 0);
  line(pmouseX, pmouseY + 10, mouseX, mouseY + 10);
  
  line(pmouseX, pmouseY, pmouseX, pmouseY + 10);
  line(mouseX, mouseY, mouseX, mouseY + 10);
}

void draw() {
}
