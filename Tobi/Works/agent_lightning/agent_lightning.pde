float x = 300;
float y = 300;

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
}

void mousePressed(){
    float x = mouseX;
    float y = mouseY;
  for(int i=0;i<500;i++){
    float r_x = random(-10,10);
    float r_y = random(-10,10);
    stroke(0);
    line(x, y, x + r_x, y + r_y);
    x =  x + r_x;
    y = y + r_y;
  }
}

void draw() {
  
}
