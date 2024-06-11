// define color palette
color[] bcolors = {#FDA792, #EED69E, #AEBD95, #5D6479, #304756};
color[] fcolors = {#916C56, #B1907D, #D0BAAB, #D27A64, #B65138};
color[] colors = {#B2C9FF, #89F7E9, #6AF0CC, #E0E9FF, #9EA3E3};

void setup() {
  size(600, 600);
  background(bcolors[(int)random(bcolors.length)]);
  
  strokeWeight(10);
  
  // face
  fill(fcolors[(int)random(fcolors.length)]);
  ellipse(width/2, height/2, 350, 400);
  
  // glasses
  fill(255);
  line(width/2 - 30, height * 0.45, width/2 + 30, height * 0.45);
  ellipse(width/2 - 80, height * 0.45, 100, 80);
  ellipse(width/2 + 80, height * 0.45, 100, 80);
 
  // eyes
  line(width/2 - 110, height * 0.45, width/2 - 60, height * 0.45);
  line(width/2 + 50, height * 0.45, width/2 + 100, height * 0.45);
  
  // mouth
  fill(255);
  rect(width/2 - 50, height * 0.6, 100, 100, 30, 30, 60, 60);

  // hair
  int hairxMin = width/2 - 250;
  int hairxMax = width/2 + 250;
  int hairyMin = height/2 - 280;
  int hairyMax = height/2 - 70;
  stroke(colors[(int)random(colors.length)]);
  strokeJoin(2);
  noFill();
  beginShape();
  for (int i = 0; i < 60; i++) {
     vertex(random(hairxMin, hairxMax), random(hairyMin, hairyMax));
  }
  endShape(CLOSE);
}
