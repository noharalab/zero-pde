void setup() {
  size(600, 600);
  noFill();
  strokeWeight(16);
}

void draw() {
  background(255);
  
  stroke(200, 200, 200);
  ellipse(width/2, height/2, 500, 500);
  ellipse(width/2, height/2, 400, 400);
  ellipse(width/2, height/2, 300, 300);
  
  // second

  stroke(255, 200, 100);

  arc(
    width/2, height/2,
    500, 500,
    -PI / 2,
    -PI / 2 + 2 * PI * second() / 60
  );
  
  // minute
  
  stroke(0, 160, 200);
  
  arc(
    width/2, height/2,
    400, 400,
    -PI / 2,
    -PI / 2 + 2 * PI * minute() / 60
  );
  
  // hour
  
  stroke(215, 50, 50);
  
  arc(
    width/2, height/2,
    300, 300,
    -PI / 2,
    -PI / 2 + 2 * PI * hour() / 24
  );
}
