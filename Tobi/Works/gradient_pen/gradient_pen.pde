void setup(){
  size(600, 600);
  background(255, 255, 255);
}

//点击后拖动鼠标
void mouseDragged(){
  
  strokeWeight(2);
  stroke(mouseX,mouseY,0);
  // 少し前のカーソル位置から現在のカーソル位置まで線を引く
  line(pmouseX, pmouseY, mouseX, mouseY);
  
}

void draw(){
}
