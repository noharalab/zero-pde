PImage img0;
PImage img1;
PImage img2;
PImage img3;

float time = 0;

void setup() {
  size(600, 600);
  background(255,255,255);
  noFill();
  
  
  img0 = loadImage("frame0.png");
  img1 = loadImage("frame1.png");
  img2 = loadImage("frame2.png");
  img3 = loadImage("frame3.png");
  
}

void mousePressed(){
 
}

void draw() {
  
  time += 0.1;
  if(time >= 4){
    time = 0;
  }
  
  int count = (int)time;
  
  if(count == 0){
    image(img0, 0,0);
  }else if(count == 1){
    image(img1, 0, 0);
  }else if(count == 2){
    image(img2, 0,0);
  }else{
    image(img3, 0, 0);
  }
}
