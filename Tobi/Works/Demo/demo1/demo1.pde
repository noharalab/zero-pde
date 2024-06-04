void setup(){
  size(600, 600);
  background(255, 200, 255);
}

//void mousePressed(){
//  ellipse(mouseX, mouseY, 200, 200);
//}

//void mouseMoved(){
//  ellipse(mouseX, mouseY, 200, 200);
//}

//点击后拖动鼠标
void mouseDragged(){
  
  stroke(0,0,0);
  // 少し前のカーソル位置から現在のカーソル位置まで線を引く
  line(pmouseX, pmouseY, mouseX, mouseY);
  
  stroke(0,0,0,20);
  // Y軸方向に少しずらして、薄い線（影）を引く
  line(pmouseX, pmouseY + 10, mouseX, mouseY + 10);
}

void draw(){
}
