
FloatList xs;
FloatList ys;
FloatList vx;
FloatList vy;

void setup() {
  size(600, 600);
  noStroke();
  fill(0);
  vx=new FloatList();
  vy=new FloatList();
  xs= new FloatList();
  ys= new FloatList();

  // エージェントの初期位置を設定
  for (int i = 0; i < 100; i++) {
    xs.append(width / 2);
    ys.append(height / 2);
    vx.append(random(-5, 5));
    vy.append(random(-5, 5));
  }
}

void draw() {
  background(255);



  for (int i = 0; i < xs.size(); i++) {
    // i番目のエージェントの位置をずらす

    //xs.set(i, random(-5, 5));
    //ys.set(i, random(-5, 5));

    vy.add(i, 0.1);
    xs.add(i, vx.get(i));
    ys.add(i, vy.get(i));
    // i番目のエージェントを描く
    ellipse(xs.get(i), ys.get(i), 10, 10);
    if (ys.get(i)>height-5) {
      vy.mult(i, -0.5);
      ys.set(i, height-5);
    }
    if (xs.get(i)>width-5) {
      vx.mult(i, -0.1);
      xs.set(i, width-5);
    }
    if (xs.get(i)<5) {
      vx.mult(i, -0.1);
      xs.set(i, 5);
    }
  }
}

void mousePressed() {

  xs.append(mouseX);
  ys.append(mouseY);
  vx.append(random(-5, 5));
  vy.append(random(-5, 5));
}
