void setup() {
  size(600, 600);
  background(255, 255, 255);
  strokeWeight(2);
}

void draw() {
  
  background(255, 255, 255);
  line(0, height/4, width, height/4);
  line(0, height/2, width, height/2);
  line(0, height * 3 / 4, width, height * 3 / 4);
  
  line(width/4, 0, width/4, height);
  line(width/2, 0, width/2, height);
  line(width * 3 / 4, 0, width * 3 / 4, height);
  
  fill(255, 200, 100);
  ellipse(second() * width / 60, height/4, 50, 50);
  ellipse(width * 3 / 4, second() * height / 60, 50, 50);
  fill(0, 160, 200);
  ellipse(minute() * width / 60, height/2, 50, 50);
  ellipse(width/2, minute() * height / 60, 50, 50);
  fill(215, 50, 50);
  ellipse(hour() * width / 24, height * 3 / 4, 50, 50);
  ellipse(width/4, hour() * height / 24, 50, 50);
  
  println(hour());
  println(minute());
  println(second());
}
