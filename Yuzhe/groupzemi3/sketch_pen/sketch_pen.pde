int penmode =0;

void setup() {
  size(600, 600);
  background(255, 255, 255);
}

void mousePressed() {
  if (mouseButton==RIGHT) {
    penmode=penmode+1;
    if (penmode>3) {
      penmode=0;
    }
    if (penmode==0) {
      fill(20, 20, 40);
    } else if (penmode==1) {
      fill(150, 20, 20);
    } else if (penmode==2) {
      fill(0, 180, 0);
    } else if (penmode==3) {
      fill(255, 250, 250);
    }
  }
  stroke(0, 0, 0);
  strokeWeight(2);
  ellipse(width-40, 40, 20, 20);
}

void mouseDragged() {
  {
    if (penmode==0) {
      strokeWeight(2);
      stroke(20, 20, 40);
    } else if (penmode==1) {
      strokeWeight(2);
      stroke(150, 20, 20);
    } else if (penmode==2) {
      strokeWeight(2);
      stroke(0, 180, 0);
    } else if (penmode==3) {
      strokeWeight(50);
      stroke(255, 255, 255);
    }
  }
  line(pmouseX, pmouseY, mouseX, mouseY);
}

void keyPressed() {
  int i=0;
  while (i<20) {
    float sz=random(10);
    fill(200,150,80,random(100));
    noStroke();
    //stroke(200,150,80);
    ellipse(mouseX+random(-20,20), mouseY+random(-20,20), sz, sz);
    i=i+1;
  }
}


void draw() {
}
