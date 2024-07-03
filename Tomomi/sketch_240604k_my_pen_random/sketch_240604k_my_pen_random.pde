void setup(){
  size(600,600);
  background(0,0,0);
}

void mouseDragged(){
  //stroke(赤、緑、青);
 fill(mouseX,mouseX-mouseY,mouseY);
 ellipse(mouseX,mouseY,random(1,50),random(1,50));
 fill(mouseY,mouseX+mouseY,mouseX);
 ellipse(mouseY,mouseX,random(1,50),random(1,50));
}

void draw(){
}
