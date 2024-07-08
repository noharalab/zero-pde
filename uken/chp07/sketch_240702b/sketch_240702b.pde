// count
int agentCount = 100;

// postion
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

boolean exploded = false;
int explosionTime = 0;
int explosionInterval = 200; // time slot

void setup() {
  size(600, 600);
  noStroke();
  fill(255, 100);
  background(0);

  xs = new float[agentCount];
  ys = new float[agentCount];
  vxs = new float[agentCount];
  vys = new float[agentCount];
  axs = new float[agentCount];
  ays = new float[agentCount];
  colors = new color[agentCount];

  resetFireworks();
}

void draw() {
  fill(0, 25); // let background black
  rect(0, 0, width, height);

  if (exploded) {
    for (int i = 0; i < agentCount; i++) {
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

    explosionTime++;

    if (explosionTime > explosionInterval) {
      exploded = false;
      resetFireworks();
    }
  } else {
    for (int i = 0; i < agentCount; i++) {
      // rise up
      ys[i] -= 2;

      // riseing shape and color
      fill(255);
      ellipse(xs[i], ys[i], 4, 4);
    }

    // bloom on certain highet
    if (ys[0] < height / 2) {
      exploded = true;
      explosionTime = 0;
      initializeExplosion();
    }
  }
}

void resetFireworks() {
  for (int i = 0; i < agentCount; i++) {
    // first position
    xs[i] = width / 2;
    ys[i] = height;

    // first speed
    vxs[i] = 0;
    vys[i] = 0;

    // first acculate
    axs[i] = 0;
    ays[i] = 0;

    // random color
    colors[i] = color(random(255), random(255), random(255));
  }
}

void initializeExplosion() {
  for (int i = 0; i < agentCount; i++) {
    // first speed when bloom
    vxs[i] = random(-2, 2);
    vys[i] = random(-2, 2);

    // first acculate when bloom
    axs[i] = random(-0.05, 0.05);
    ays[i] = random(-0.05, 0.05);
  }
}
