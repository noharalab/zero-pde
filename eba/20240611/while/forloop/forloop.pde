void setup() {
  size(1920, 1080);
}

void draw() {
  background(0);
  fill(#F1F1F1);
  noStroke();

  // number of tiles along the x&y axes
  float tilesX = 16;
  float tilesY = 9;

  // calculates the width of the each tile
  float tileW = width / tilesX;
  float tileH = height / tilesY;

  // moves the origin to the center of the first tile
  translate(tileW / 2, tileH / 2);

  // nested for loops to draw the tiles - Iterate over the number of tiles in both x,y directions
  // 
  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {
      
      // Calculates a wave effect based on the frame count and tile position 
      float wave = sin(radians( frameCount + x * 10 + y * 10 )) * 300;
      
      pushMatrix(); // saves the current transition matrix
      translate(tileW * x + wave, tileH * y);
      ellipse(0,0,tileW / 2,tileH / 2); // draws ellipse at the origin
      popMatrix(); // restore the previous transition matrix
    }
  }

}
