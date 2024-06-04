// 画像用の変数
PImage img;

void setup() {
  size(600, 600);
  background(255);
  noStroke();

  // 画像を読み込む
  img = loadImage("monalisa.jpg");
}

void mouseDragged() {
  // 画像のカーソル位置の色を取得してcolor型の変数に入れる
  color col = img.get(mouseX, mouseY);
  // 採取した色を塗りに設定
  fill(col);

  // カーソル位置に円を描く
  ellipse(mouseX, mouseY, 10, 10);
}

void draw() {
  int count = 0;
  while(count < 1000){
    int x = (int)random(600);
    int y = (int)random(600);
    
    color col = img.get(x, y);
    fill(col);
    ellipse(x, y, 10, 10);
    count++;
  }
}
