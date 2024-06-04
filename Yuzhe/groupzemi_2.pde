void setup() {
  size(600, 600);
  background(255, 255, 255);
}


void draw() {
  
  int x= second()*10;
  if (second()%2==0) { //if second is even
    fill(255, 255, 255);// it will be filled in white color
  } else {
    fill(220, 220, 220);// it will be filled in grey color
  }
  strokeWeight(random(1, 5)); // weight of stroke change randomly
  ellipse(300+random(-10, +10), 300+random(-10, +10), x, x); // the ellipse location change randomly

  fill(250, 220, 0);
  rectMode(CENTER);
  strokeWeight(1);
  rect(300, 5, second()*10, 10);// the size of rect change with the time
  
  if(mousePressed){
  background(255,255,255);
  }
}
