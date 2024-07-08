// position
float[] xs;
float[] ys;
// speed
float[] vxs;
float[] vys;
// acculate
float[] axs;
float[] ays;
// color
color[] colors;

void setup() {
  size(600, 600);
  noStroke();
  fill(255, 100);
  background(0);
  
  xs = new float[100];
  ys = new float[100];
  vxs = new float[100];
  vys = new float[100];
  axs = new float[100];
  ays = new float[100];
  colors = new color[100];

  for (int i = 0; i < 100; i++) {
    // first position
    xs[i] = width / 2;
    ys[i] = height / 2;

    // first speed
    vxs[i] = random(-2, 2);
    vys[i] = random(-2, 2);

    // first acculate
    axs[i] = random(-0.05, 0.05);
    ays[i] = random(-0.05, 0.05);

    // random color
    colors[i] = color(random(255), random(255), random(255));
  }
}

void draw() {
  fill(0, 25); // let backgroung black
  rect(0, 0, width, height);

  for (int i = 0; i < 100; i++) {
    // speed affected by acculate
    vxs[i] += axs[i];
    vys[i] += ays[i];
    
    // postion affect by spped
    xs[i] += vxs[i];
    ys[i] += vys[i];
    
    // effect to simulate the speed affectted by air 
    vxs[i] *= 0.99;
    vys[i] *= 0.99;

    // draw color
    fill(colors[i]);
    ellipse(xs[i], ys[i], 4, 4); // shape
  }
}
