int totalFrames = 300; // Total frames to complete the entire drawing
int currentFrame = 0;

void setup() {
  size(600, 600);
  background(255);
  stroke(0);
  noFill();
}

void draw() {
  background(255);
  beginShape();

  // Starting vertex
  vertex(136.8, 384.4);

  if (currentFrame > 0) {
    float t = map(currentFrame, 0, totalFrames, 0, 1);
    bezierVertex(136.8, 499.6, 196.8, 557.2, 300.0, 557.2);
  }

  if (currentFrame > 1 * totalFrames / 11) {
    float t = map(currentFrame - 1 * totalFrames / 11, 0, totalFrames, 0, 1);
    bezierVertex(403.2, 557.2, 464.4, 492.4, 464.4, 384.4);
  }

  if (currentFrame > 2 * totalFrames / 11) {
    float t = map(currentFrame - 2 * totalFrames / 11, 0, totalFrames, 0, 1);
    vertex(464.4, 135.2);
  }

  if (currentFrame > 3 * totalFrames / 11) {
    float t = map(currentFrame - 3 * totalFrames / 11, 0, totalFrames, 0, 1);
    bezierVertex(464.4, 118.0, 451.2, 106.4, 436.8, 106.4);
  }

  if (currentFrame > 4 * totalFrames / 11) {
    float t = map(currentFrame - 4 * totalFrames / 11, 0, totalFrames, 0, 1);
    bezierVertex(421.2, 106.4, 409.2, 118.0, 409.2, 135.2);
  }

  if (currentFrame > 5 * totalFrames / 11) {
    float t = map(currentFrame - 5 * totalFrames / 11, 0, totalFrames, 0, 1);
    vertex(409.2, 385.6);
  }

  if (currentFrame > 6 * totalFrames / 11) {
    float t = map(currentFrame - 6 * totalFrames / 11, 0, totalFrames, 0, 1);
    bezierVertex(409.2, 467.2, 372.0, 511.6, 301.2, 511.6);
  }

  if (currentFrame > 7 * totalFrames / 11) {
    float t = map(currentFrame - 7 * totalFrames / 11, 0, totalFrames, 0, 1);
    bezierVertex(230.4, 511.6, 193.2, 472.8, 193.2, 385.6);
  }

  if (currentFrame > 8 * totalFrames / 11) {
    float t = map(currentFrame - 8 * totalFrames / 11, 0, totalFrames, 0, 1);
    vertex(193.2, 135.4);
  }
  
  if (currentFrame > 9 * totalFrames / 11) {
    float t = map(currentFrame - 9 * totalFrames / 11, 0, totalFrames, 0, 1);
    bezierVertex(193.2, 121.0, 181.2, 110.4, 165.6, 110.4);
  }
  
  if (currentFrame > 10 * totalFrames / 11) {
    float t = map(currentFrame - 10 * totalFrames / 11, 0, totalFrames, 0, 1);
    bezierVertex(148.8, 110.4, 136.8, 121.0, 136.8, 135.4);
  }
  
  if (currentFrame >= 11 * totalFrames / 11) {
    float t = map(currentFrame - 11 * totalFrames / 11, 0, totalFrames, 0, 1);
    vertex(136.8, 384.4);
  }

  endShape();
  
  currentFrame++;
  if (currentFrame > totalFrames) {
    noLoop(); // Stop the animation once all segments are drawn
  }
}
