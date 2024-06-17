float ballX;
float ballY;
float ballSize;
boolean isInc;

void setup() {
  size(600, 600);
  background(255);
  
  strokeWeight(3);
  colorMode(HSB, 360, 100, 100);
  
  ballX = width/2;
  ballY = height/2;
  ballSize = 50;
  isInc = true;
}

void keyPressed() {
  if (isInc) {
    ballSize = ballSize + 1;
  } else {
    ballSize = ballSize - 1;
  }
  
  if (isInc && ballSize == 200) {
    isInc = false;
  }
  
  if (!isInc && ballSize == 50) {
    isInc = true;
  }
  
  if (keyCode == LEFT) {
    ballX = ballX - 10;
    if (ballX - ballSize/2 < 0) {
      ballX = width - ballSize/2;
    }
  } else if (keyCode == RIGHT) {
    ballX = ballX + 10;
    if (ballX + ballSize/2 > width) {
      ballX = ballSize / 2;
    }
  } else if (keyCode == UP) {
    ballY = ballY - 10;
    if (ballY - ballSize/2 < 0) {
      ballY = height - ballSize/2;
    }
  } else if (keyCode == DOWN) {
    ballY = ballY + 10;
    if (ballY + ballSize/2 > height) {
      ballY = ballSize / 2;
    }
  }
}

void mouseClicked() {
  background(255);
  ballX = width/2;
  ballY = height/2;
  ballSize = 50;
}

void draw() {
  fill(
    map(second(), 0, 60, 0, 360),
    map(second(), 0, 24, 0, 100),
    map(minute(), 0, 60, 50, 100)
  );
  ellipse(ballX, ballY, ballSize, ballSize);
}
