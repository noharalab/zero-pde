
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  for(int i=0; i<=600;i++){
  float mx = i * 255 / 600;
  fill(mx,100, 100);
  square((float)i, 0, 600);
  }
}
