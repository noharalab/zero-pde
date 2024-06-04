void setup(){
  size(600, 600);
  background(0, 200, 255);
 
  strokeWeight(10);
  ellipse(300, 300, 400, 400);
 
 fill(0);
 ellipse(225, 250, 50, 50);
 ellipse(375, 250, 50, 50);
 
 strokeWeight(0);
 fill(255, 0, 0);
 beginShape();
 vertex(225, 400);
 vertex(225, 350);
 bezierVertex(225,340,245, 320, 255, 320);
 vertex(345, 320);
 bezierVertex(355,320, 375, 340, 375, 350);
 vertex(375, 400);
 vertex(225, 400);
 endShape();
 
 endShape();
 
}
