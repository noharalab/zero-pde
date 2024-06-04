int x1 = 0;
int y1 = 0;
int x2 = 0;
int y2 = 0;
int flag = 0;
dot[] dots = new dot[0];

float time = 0;

public class dot{
 private float x;
 private float y;
 
 public void setDot(float x, float y){
   this.x = x;
   this.y = y;
 }
} 

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
}

void drawMyLine(int x1, int y1, int x2, int y2) {
  noStroke();
  fill(0);

  
  dots = new dot[100];
  // 始点と終点の区間を100分割するループを回す
  for (int i = 0; i < 100; i++) {
    float x = map(i, 0, 100, x1, x2);
    float y = map(i, 0, 100, y1, y2);
    dot d = new dot();
    d.setDot(x, y);
    dots[i] = d;
    
  }
}

void mousePressed(){
  x1 = mouseX;
  y1 = mouseY;
  flag = 1;
}

void mouseDragged(){
  background(255);
  if(flag == 1){
    drawMyLine(x1, y1, mouseX, mouseY);
  }
}

void draw() {
  time += 0.2;
  if(int(time) == 1){
    background(255); //reflash
    for(int i=0;i<dots.length;i++){
      float r1 = random(-6, 6);
      float r2 = random(-6, 6);
      float r3 = random(5);
      ellipse(dots[i].x + r1, dots[i].y + r2, r3, r3);
    }
    
    time = 0;
  }
}
