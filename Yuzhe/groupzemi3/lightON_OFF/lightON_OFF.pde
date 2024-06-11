boolean light;

void setup() {
  size(600, 600);
  fill(0);
  light=true;
}

void draw() {
  if (light==true) {
    background(255, 255, 255);
    stroke(255, 255, 200);
    strokeWeight(20);
    fill(240, 200, 200);
  } else {
    background(0, 0, 0);
    noStroke();
    fill(25, 25, 50);
  }
  
  ellipse(width/2,height/2,200,200);
}

void mousePressed() {
  if (light==true){
  light=false;
  }else{
  light=true;
  }
}
