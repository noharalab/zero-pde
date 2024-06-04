
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
  for(int i=0;i<600;i++){
    for(int j=0;j<600;j++){
      fill( (float)i,(float)j,0);
      rect(i, j, 1, 1);
    }
  }
  
}


void draw() {
}
