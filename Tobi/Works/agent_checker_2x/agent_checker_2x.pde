int num = 11;


void setup() {
  size(600, 600);
  background(200);
  noStroke();
  
  for(int i=0;i<num;i++){
    for(int j=0;j<num;j++){
      float step = 600 / (num - 1);
      if(i % 4 == 0 || i % 4 == 1){
        if(j % 4 == 0 || j % 4 == 1){
          fill(0);
        }else{
          fill(255);
        }
      }else{
        if(j % 4 == 0 || j % 4 == 1){
          fill(255);
        }else{
          fill(0);
        }
      }
      ellipse(i * step, j * step, 20, 20);
    }
  }
  
}


void draw() {
}
