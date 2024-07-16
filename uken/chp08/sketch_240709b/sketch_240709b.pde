class Particle {
  float x;
  float y;
  float vx;
  float vy;
  float life;
  float sz;
  color c;
}

ArrayList<Particle> ps;
float centerX;
float centerY;
float centerSpeedY;

void setup() {
  size(600, 600);
  noStroke();
  ps = new ArrayList<Particle>();

  centerX = width / 2;
  centerY = height;
  centerSpeedY = -1; 
}

void draw() {
  background(0);

  centerY += centerSpeedY;

  if (centerY < 0) {
    centerY = height;
  }

  Particle p = new Particle();
  p.x = centerX;
  p.y = centerY;
  p.vx = random(-1, 1);
  p.vy = random(-1, 1);
  p.life = random(0.5, 1.5);
  p.sz = random(2, 5);
  p.c = color(random(150, 255), random(100, 200), 0); 
  ps.add(p);

  for (int i = 0; i < ps.size(); i++) {
    Particle pi = ps.get(i);

    pi.x += pi.vx;
    pi.y += pi.vy;
    pi.vx += random(-0.05, 0.05);
    pi.vy += random(-0.05, 0.05);

    pi.life -= 0.01;

    float al = map(pi.life, 0, 1, 0, 255);
    fill(red(pi.c), green(pi.c), blue(pi.c), al);

    ellipse(pi.x, pi.y, pi.sz, pi.sz);
  }

  for (int i = ps.size() - 1; i >= 0; i--) {
    if (ps.get(i).life <= 0) {
      ps.remove(i);
    }
  }
}
