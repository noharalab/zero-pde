//演習：自分のアイコンを描いてみよう

void setup() {
  size(600, 600);
}

void draw() {
  background(#8DDCFA);

  strokeWeight(8);

  stroke(0, 0, 0);
  fill(#FFFCAD);
  //ellipse(中心のX座標,中心のY座標,幅,高さ);
  ellipse(300, 300, 400, 400);

  noStroke();
  fill(0, 0, 0);
  //ellipse(中心のX座標,中心のY座標,幅,高さ);
  ellipse(240, 230, 38, 38);

  noStroke();
  fill(0, 0, 0);
  //ellipse(中心のX座標,中心のY座標,幅,高さ);
  ellipse(360, 230, 38, 38);

  fill(#F75F71);
  stroke(0, 0, 0);
  strokeWeight(5);
  //rect(X座標,Y座標,幅,高さ);
  rect(200, 300, 200, 120, 30, 30, 30, 30);
  //line(始点X座標,始点Y座標,終点X座標,終点Y座標);
  line(200, 360, 400, 360);
}
