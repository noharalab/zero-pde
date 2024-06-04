int x = 0;
int y = 0;
int flag = 0;

void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
}

void drawMyLine(int x1, int y1, int x2, int y2) {
  noStroke();
  fill(0);

  // 始点と終点の区間を100分割するループを回す
  for (int i = 0; i <= 100; i++) {
    float x = map(i, 0, 100, x1, x2);
    float y = map(i, 0, 100, y1, y2);

    // 小さな円を描く
    ellipse(x, y, 2, 2);
  }
}

void mousePressed(){
  x = mouseX;
  y = mouseY;
  flag = 1;
}

void mouseDragged(){
  background(255);
  if(flag == 1){
    drawMyLine(x, y, mouseX, mouseY);
  }
}

void draw() {
  
}
