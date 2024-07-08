float[] ballXs;
float[] ballYs;
float[] ballSize;
float[] ballBlue;
float[] ballRed;
float[] ballGreen;
int x=500;

void setup() {
  size(600, 600);
  noStroke();
  fill(0);
  ballXs=new float[x];
  ballYs=new float[x];
  ballSize=new float[x];
  ballBlue=new float[x];
  ballRed=new float[x];
  ballGreen=new float[x];
  for (int i=0; i<x; i++) {
    ballXs[i]=width/2;
    ballYs[i]=height/2;
    ballSize[i]=random(2, 50);
    ballBlue[i]=random(255);
    ballRed[i]=random(255);
    ballGreen[i]=random(255);
  }
}

void draw() {
  background(255);
  
  for (int i=0; i<x; i++) {
    ballXs[i]+=random(-10, 10);
    ballYs[i]+=random(-10, 10);
    ballBlue[i]+=random(-1,1);
    ballRed[i]+=random(-1,1);
    ballGreen[i]+=random(-1,1);
  }
    for (int i=0; i<x; i++) {
    
    fill(ballRed[i],ballGreen[i],ballBlue[i]);
    ellipse(ballXs[i], ballYs[i], ballSize[i],ballSize[i]);
  }
}
