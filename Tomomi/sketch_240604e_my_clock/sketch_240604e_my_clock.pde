void setup() {
  size(400, 400);
  strokeWeight(30);
}

void draw() {
  background(255, 255, 255);

  if (second() % 2 == 0) {
    stroke(255, 0, 0);
  } else {
    stroke(0, 0, 255);
  }

  ellipse(200, 200, minute()*8, minute()*8);

  if (second() % 2 == 0) {
    stroke(0, 0, 255);
  } else {
    stroke(255, 0, 0);
  }

  ellipse(200, 200, minute()*4, minute()*4);
}
