
FloatList xs;
FloatList ys;

FloatList vxs;
FloatList vys;

FloatList lifes;

void setup() {
  size(600, 600);
  noStroke();
  fill(0);

  // 可変長配列を初期化
  xs = new FloatList();
  ys = new FloatList();
  vxs = new FloatList();
  vys = new FloatList();
  lifes=new FloatList();
  
  // エージェントの初期位置を設定
  for (int i = 0; i < 200; i++) {
  
    
  //  xs.append(width / 2);
  //  ys.append(height / 2);

  //  // 速度もランダムに設定
  //  vxs.append(random(-5, 5));
  //  vys.append(random(-5, 5));
  }
}

void draw() {
  background(0);

  // 新たなエージェントを追加
  if (mousePressed) {
    xs.append(mouseX);
    ys.append(mouseY);
    // 速度もランダムに設定
    vxs.append(random(-3, 3));
    vys.append(random(-3, 3));
    lifes.append(1);
   
    for (int i = 0; i < xs.size(); i++) {
      lifes.sub(i,0.05);
      // i番目のエージェントに重力を加える
      vys.add(i, 0.01);
      
      xs.add(i, vxs.get(i));
      ys.add(i, vys.get(i));
      if(xs.get(i)>width/2&&ys.get(i)<height/2){
      fill(255,100,100);
      }
      if(xs.get(i)<width/2&&ys.get(i)>height/2){
      fill(50,255,50);
      }
      if(xs.get(i)<width/2&&ys.get(i)<height/2){
      fill(0,0,255);
      }
      if(xs.get(i)>width/2&&ys.get(i)>height/2){
      fill(255,255,50);
      }
      if(lifes.get(i)>0){ 
        ellipse(xs.get(i), ys.get(i), 10, 10);
    
  }
    }
  }
}
