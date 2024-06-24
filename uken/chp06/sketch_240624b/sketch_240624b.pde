float[][] cells;

void setup() {
  size(600, 600);
  noStroke();

  cells = new float[31][31];
  
  for (int iy = 0; iy <= 30; iy++) {
    for (int ix = 0; ix <= 30; ix++) {
      cells[iy][ix] = 1;
    }
  }
}

void draw() {
  background(255);

  for (int iy = 0; iy <= 30; iy++) {
    for (int ix = 0; ix <= 30; ix++) {

      float sz = cells[iy][ix];
      fill(map(sz, 1, 60, 0, 255), 0, map(sz, 1, 60, 0, 255)); // color and shape
      rect(
        ix * 20 - sz / 2,
        iy * 20 - sz / 2,
        sz, sz
      );
      
      if (cells[iy][ix] > 1) {
        cells[iy][ix] -= 0.2;  // getting smaller
      }
    }
  }
}

void mouseDragged() {
  int ix = round(mouseX / 20.0);
  if (ix < 0) {
    ix = 0;
  }
  else if (ix >= 30) {
    ix = 30;
  }

  int iy = round(mouseY / 20.0);
  if (iy < 0) {
    iy = 0;
  }
  else if (iy >= 30) {
    iy = 30;
  }

  cells[iy][ix] += 2;
}
