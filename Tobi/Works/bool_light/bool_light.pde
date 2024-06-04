int count = 0;

void setup() {
  size(600, 600);
  stroke(0);
  fill(0);
}

void mousePressed() {
  count++;
}

void draw() {
  if(count%2 == 0){
    background(0);
    fill(10,10,10);
    ellipse(300, 300, 100, 100);
  }else{
    background(255);
    fill(250,250,0);
    noStroke();
    ellipse(300, 300, 100, 100);
  }
}
