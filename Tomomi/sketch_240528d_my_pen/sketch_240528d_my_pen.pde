//gradient_pen
//色を変えるfill()やstroke()にも、カーソル位置mouseX,mouseYを指定することができる
//工夫してきれいな色が出せないか？

//x軸方向の位置を色に反映
//カーソル位置が色にはねい荒れてグラデーションになるペン

void setup() {
  size(600, 600);
  background(255, 255, 255);

  noStroke();
}

void mouseDragged() {
  //カーソル位置を塗り色に反映する
  //fill(赤、緑、青);
  fill(mouseY, mouseX-mouseY,mouseX);

  //カーソル位置に図形を描く
  //ellpise(中心Ｘ，中心Ｙ、幅、高さ);
  ellipse(mouseX, mouseY, 20, 20);
}

void draw() {
}
