float x = 300;
float y = 300;
dot dots[];
int num = 500;

class dot{
  private float x;
  private float y;
  
  dot(float a, float b){
    x = a;
    y = b;
  }
  
  public void setDot(float x, float y){
    this.x = x;
    this.y = y;
  }
}

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  dots = new dot[num];
  for(int i=0;i<num;i++){
    dot d = new dot(300, 300);
    dots[i] = d;
   }
  
}


void draw() {
  background(360);
  for(int i=0;i<dots.length;i++){
    float r1 = random(-5, 5);
    float r2 = random(-5, 5);
    float new_x = dots[i].x + r1;
    float new_y = dots[i].y + r2;
    
    colorMode(HSB, 360, 100, 100);
    float col = random(360);
    fill(col, 100, 100);
    ellipse(new_x, new_y, 5, 5);
    dots[i].setDot(new_x, new_y);
  }
}
