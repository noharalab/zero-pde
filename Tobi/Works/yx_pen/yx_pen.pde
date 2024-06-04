void setup(){
  size(600, 600);
  background(255, 255, 255);
}

//点击后拖动鼠标
void mouseDragged(){
  
  strokeWeight(3);
  stroke(255,200,255);
  // 少し前のカーソル位置から現在のカーソル位置まで線を引く
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  stroke(200,255,255);
  // Y軸方向に少しずらして、薄い線（影）を引く
  line(pmouseY, pmouseX, mouseY, mouseX);
}

void draw(){
}
