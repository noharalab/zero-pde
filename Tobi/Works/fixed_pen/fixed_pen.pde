void setup(){
  size(600, 600);
  background(0,0,0);
}

//点击后拖动鼠标
void mouseDragged(){
  
  strokeWeight(0.3);
  stroke(255,255,255);
  // 少し前のカーソル位置から現在のカーソル位置まで線を引く
  line(pmouseX, pmouseY, 300, 300);
  
}

void draw(){
}
