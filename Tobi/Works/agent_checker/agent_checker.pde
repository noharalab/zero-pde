int num = 11;


void setup() {
  size(600, 600);
  background(200);
  noStroke();
  
  int count = 0;
  for(int i=0;i<num;i++){
    for(int j=0;j<num;j++){
      float step = 600 / (num - 1);
      if(count % 2 == 0){
        fill(0);
      }else{
        fill(255);
      }
      ellipse(i * step, j * step, 20, 20);
      count++;
    }
  }
  
}


void draw() {
}
