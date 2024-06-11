void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);
  fill(#F1F1F1);
  noStroke();

  float tilesX = 16;
  float tilesY = 9;

  float tileW = width / tilesX;
  float tileH = height / tilesY;

  translate(tileW / 2, tileH / 2);

  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      
      float wave = sin(radians( frameCount + x * 10 + y * 10 )) * 300;
      
      pushMatrix();
      translate(tileW * x + wave, tileH * y);
      ellipse(0,0,tileW / 2,tileH / 2);
      popMatrix();
    }
  }

}
