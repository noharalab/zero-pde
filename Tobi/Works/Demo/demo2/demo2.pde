void setup() {
  size(600, 600);
  noStroke();
  fill(0, 0, 0);
}

void draw() {
  // 背景を塗りつぶす
  background(255, 255, 255);

  // 円の位置を、キャンバス中央からランダムに少しだけずらす
  ellipse(
    300 + random(-10, +10),
    300 + random(-10, +10),
    100, 100
  );
}
