
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
  colorMode(HSB, 360, 100, 100);
  
  int count = 30;
  int len = 600 / count;
  for(int i=0; i<=count;i++){
    for(int j=0;j<=count;j++){
      color col = (int)random(360);
      fill(col, 100, 100);
      square(i * len, j * len, len);
    }
  }
}

void draw() {
  
}
