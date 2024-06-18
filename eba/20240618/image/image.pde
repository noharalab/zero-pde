color bg = #f1f1f1;
color fg = 0;

PImage img;

int tilesX = 100;
int tilesY = 100;

void setup() {
  size(900, 900, P3D);
  img = loadImage("data/image.jpeg");
  img.resize(tilesX, tilesY);

}

void draw() {
  background(bg);
  fill(fg);
  noStroke();
  
  
  // Set camera
  float camX = map(mouseX, 0, width, -1000, 1000); // Camera position based on mouseX
  float camY = map(mouseY, 0, height, -1000, 1000); // Camera position based on mouseY
  float camZ = height / 2.0 / tan(PI * 30.0 / 180.0);
  //camera(camX, camY, camZ, width/2, height/2, 0, 0, 1, 0);

  float tileW = width / tilesX;
  float tileH = height / tilesY;
  ellipseMode(CENTER);

  push();
  translate(width/2, height/2);
  scale(0.8);
  //float rotation = map(sin(radians(frameCount * 0.5)), 1, -1, -360, 0);
  //rotateY(radians(rotation));
  
  for (int x = 0; x < tilesX; x++) {
    for (int y = 0; y < tilesY; y++) {

      // the color of the pixel
      color c = img.get(x, y);

      // the brightness of the pixel
      float b = brightness(c);

      // the scalar for the tiles
      // the brightness, mapped to a range between 1 and 0
      float s = map(b, 0, 255, 1, 0);

      // position z
      // the brightness, mapped to a range between -1 and 1
      float z = map(b, 0, 255, -1, 1);

      // magnitude of the tiles on the z-axis
      float mag = 150;

      push();
      translate(x * tileW - width/2, y * tileH - height/2, z * mag);
      ellipse(0, 0, tileW * s * 1.5, tileH * s * 1.5);
      pop();
    }
  }

  pop();
}
