int numBalls = 5000;
float[] ballXs;
float[] ballYs;
float[] ballSizes;
color[] ballColors;

void setup() {
  size(600, 600);
  noStroke();

  ballXs = new float[numBalls];
  ballYs = new float[numBalls];
  ballSizes = new float[numBalls];
  ballColors = new color[numBalls];

  for (int i = 0; i < numBalls; i++) {
    ballXs[i] = width / 2;
    ballYs[i] = height / 2;
    ballSizes[i] = random(10, 50); 
    ballColors[i] = color(random(255), random(255), random(255)); 
  }
}

void draw() {
  background(255);

  for (int i = 0; i < numBalls; i++) {
    ballXs[i] += random(-10, 10);
    ballYs[i] += random(-10, 10);
  }

  for (int i = 0; i < numBalls; i++) {
    fill(ballColors[i]);
    ellipse(ballXs[i], ballYs[i], ballSizes[i], ballSizes[i]);
  }
}
