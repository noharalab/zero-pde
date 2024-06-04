class dot{
  float x;
  float y;
  
  public dot(float a, float b){
    x = a;
    y = b;
  }
}

dot dots[];

void setup(){
 size(600, 600);
  background(0);
  
  drawMap(70, 100, 50);
  drawMap(70, 100, 255);
 
}

void drawMap(int num, int dis, int col){
  dots = new dot[num];
  for(int i=0;i<num;i++){
    float r1 = random(600);
    float r2 = random(600);
    dots[i] = new dot(r1, r2);
    fill(col);
    ellipse(r1, r2, 8, 8);
  }
  
  for(int i=0;i<num;i++){
    
    for(int j=0;j<num;j++){
      if(dis(dots[i], dots[j]) <= dis){
        drawLine(dots[i], dots[j], col);
      }
      
    }
  }
}

void drawLine(dot d1, dot d2, int col){
  stroke(col);
  line(d1.x, d1.y, d2.x, d2.y);
}

float dis(dot d1, dot d2){
  float deltaX = d1.x - d2.x;
  float deltaY = d1.y - d2.y;
  return (float)Math.sqrt(Math.pow(deltaX, 2) + Math.pow(deltaY, 2));
}

void draw(){
  
}
