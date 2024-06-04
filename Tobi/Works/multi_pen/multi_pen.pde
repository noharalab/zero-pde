color col = #0000ff;
int count = 0;

void setup() {
  size(600, 600);
  
  background(255,255,255);
}

void mouseDragged(){
  
  stroke(col);
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void mousePressed(){
  if(mouseButton == RIGHT){
    if(count ==  0){
      col = #ff0000;
    }else if (count == 1){
      col = #00ff00;
    }else{
      col = #0000ff;
    }
    count = (count + 1) % 3;
  }
  
}

void draw() {
  noStroke();
  fill(col);
  ellipse(550, 50, 20, 20);
}
