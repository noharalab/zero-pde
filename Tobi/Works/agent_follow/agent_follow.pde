float x = 300;
float y = 300;

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
}


void draw() {
  fill(0);
  background(255);
  float speed = 50;
  float dir_x = (mouseX - x)  / speed;
  float dir_y = (mouseY - y) / speed;
  
  float r1 = random(7);
  float r2 = random(7);
  ellipse(x + dir_x + r1, y + dir_y + r2, 20, 20);
  x = x + dir_x;
  y = y + dir_y;
}
