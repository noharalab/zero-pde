int num = 11;


void setup() {
  size(600, 600);
  background(200);
  noStroke();
  
  for(int i=0;i<num;i++){
    for(int j=0;j<num;j++){
      float step = 600 / (num - 1);
      if(i == 0 || i == 1 || i == 4 || i == 7 || i == 8){
        fill(0);
      }else{
        fill(255);
      }
      ellipse(i * step, j * step, 10, 10);
    }
  }
  
}


void draw() {
}
