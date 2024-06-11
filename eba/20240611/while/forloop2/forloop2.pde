void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);
  fill(#F1F1F1);
  noStroke();

  float tilesX = 16 * 6;
  float tilesY = 9 * 6;

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  translate(tileW / 2, tileH / 2);

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      
      float waveX = sin(radians( frameCount * 2 + x * 1.5 + y * 1 )) * 500;
      float waveY = sin(radians( frameCount * 2 + x * 1 + y * 3 )) * 500;
      
      pushMatrix();
      translate(tileW * x + waveX, tileH * y + waveY);
      ellipse(0,0,tileW / 2,tileH / 2);
      popMatrix();
      
    }
  }
}
