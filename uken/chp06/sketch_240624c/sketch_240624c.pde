void setup() {
  size(600, 600);
  frameRate(0.5);
}

void setRandomFillColor() {
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  int alpha = int(random(50, 255));
  fill(r, g, b, alpha);
}

void drawWeirdLine(float x1, float y1, float x2, float y2) {
  strokeWeight(random(1, 10));
  stroke(random(255), random(255), random(255), random(50, 255));
  line(x1, y1, x2, y2);
}

void drawWeirdRect(float x, float y, float w, float h) {
  for (int i = 0; i < 4; i++) {
    float[] l = new float[4];
    for (int j = 0; j < 4; j++) {
      l[j] = random(0.9, 1.1);
    }

    beginShape();
    for (int j = 0; j < 4; j++) {
      float vx = x + (j % 2 == 0 ? w : 0) * l[j];
      float vy = y + (j / 2 == 0 ? h : 0) * l[j];
      vertex(vx, vy);
    }
    endShape(CLOSE);
  }
}

void myEllipse(float ox, float oy, float w, float h) {
  for (int j = 0; j < 2; j++) {
    float[] l = new float[8];
    for (int i = 0; i < 8; i++) {
      l[i] = random(0.9, 1.1);
    }

    beginShape();
    for (int i = -2; i < 8 + 1; i++) {
      int ii = (i + 8) % 8;
      float a = map(i, 0, 8, 0, 2 * PI);
      curveVertex(
        ox + cos(a) * w / 2 * l[ii],
        oy + sin(a) * h / 2 * l[ii]
      );
    }
    endShape();
  }
}

void draw() {
  background(140, 180, 200);
  
  for (int y = 100; y <= 500; y += 100) {
    for (int x = 100; x <= 500; x += 100) {
      setRandomFillColor();
      
      float sz = random(50, 100);
      myEllipse(x, y, sz, sz);
      
      drawWeirdLine(x, y, x + random(-50, 50), y + random(-50, 50));
      
      drawWeirdRect(x + random(-20, 20), y + random(-20, 20), sz / 2, sz / 2);
    }
  }
}
