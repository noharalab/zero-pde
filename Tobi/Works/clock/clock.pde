void setup(){
  size(600, 600);
  
  
}


void draw(){
  background(255, 255, 255);
  
  int minute = (int)minute();
  int second = (int)second();
  
  textSize(100);
  fill(0,0,0);
  
  String minute_str = "";
  if(minute<10){
    minute_str = "  " + String.valueOf(minute);
  }else{
     minute_str = String.valueOf(minute);
  }
  
  String second_str = "";
  if(second<10){
    second_str = '0' + String.valueOf(second);
  }else{
     second_str = String.valueOf(second);
  }
  
  text(minute_str, 150, 325);
  text(second_str, 350, 325);
  
  if(second%2 == 0){
    fill(0,0,0);
  }else{
    fill(255,255,255);
  }
  
  strokeWeight(0);
  ellipse(300, 290, 10, 10);
  ellipse(300, 310, 10, 10);
  
}
