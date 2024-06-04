
void setup() {
  size(600, 600);
  background(255,255,255);
  noFill();
  
}

void mousePressed(){
 int i = 0;
 while(i < 15){
   stroke(i + 1, 200 - i * 20);
   ellipse(mouseX, mouseY + i * 30, 30 + i * 30, 30 + i * 30);
   i++;
 }
}

void draw() {
  
}
