float ballSize;
float ballX;
float ballY;

void setup() {
  size(600, 600);
  strokeWeight(2);
  fill(255, 200, 100);
  ballSize=100;
  ballX=600/2;
  ballY=600/2;
}

void draw() {
  background(255, 255, 255);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void mousePressed() {
  ballSize=ballSize+10;
}

void keyPressed() {
  if (keyCode==LEFT) {
    ballX=ballX-10;
  } else if(keyCode==RIGHT){
    ballX=ballX+10;
  }
}
