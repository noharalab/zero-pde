void setup(){
  size(600,600);
  background(0,0,0);
}

void mouseDragged(){
  //stroke(赤、緑、青);
 fill(mouseX,mouseX-mouseY,mouseY);
 ellipse(mouseX,mouseY,7,7);
 fill(mouseY,mouseX+mouseY,mouseX);
 ellipse(mouseY,mouseX,7,7);
}

void draw(){
}
