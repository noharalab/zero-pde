
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
  for(int i=0;i<600;i++){
    fill( (float)i / 600 * 255,0,255 -(float) i / 600 * 255);
    rect(i, 0, 1, 600);
  }
  
}


void draw() {
}
