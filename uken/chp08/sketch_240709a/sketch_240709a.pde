void setup() {
  size(600, 600);
  noStroke();

  background(255);
}

void draw() {
}

void mouseDragged() {
  int colorValue = (int)map(mouseY, 0, height, 0, 255);
  fill(colorValue, 100, 150, 50);

  for (int x = 0; x < width; x += 1) {
    float y = height / 2 + sin((x + mouseX) * 0.01) * mouseY;
    
    if (mouseButton == LEFT) {
      ellipse(x, y, 3, 3); 
    } else if (mouseButton == RIGHT) {
      rect(x, y, 5, 5);  
    } else {
      triangle(x, y, x + 3, y + 5, x - 3, y + 5); 
    }
  }
}
