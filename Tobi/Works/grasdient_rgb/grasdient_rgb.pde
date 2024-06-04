
void setup() {
  size(600, 600);
  background(255);
  noStroke();

}

void draw() {
  for(int i=0; i<=600;i++){
  float mx = i * 255 / 600;
  fill(mx,0,255-mx);
  square((float)i, 0, 600);
  }
}
