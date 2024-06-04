void setup() {
  size(1000, 1000);
  background(255);

  //Koch(2);
  drawIFS(1, 500, 100000);
}


void draw() {
}



class point {
  float x;
  float y;

  public point() {
  }

  public point(float a, float b) {
    x = a;
    y = b;
  }
}


public void Koch(int i) {
  point x = new point(100, 160);
  point y = new point(400, 160);
  point z = new point(250, 420);
  drawKoch(y, x, i);
  drawKoch(x, z, i);
  drawKoch(z, y, i);
}

public void drawKoch(point a, point b, int i) {
  point c = new point();
  point d = new point();
  point e = new point();

  c.x = a.x + (b.x - a.x) / 3;
  c.y = a.y + (b.y - a.y) / 3;
  d.x = a.x + (b.x - a.x) * 2 / 3;
  d.y = a.y + (b.y - a.y) * 2 / 3;


  e.x = (float)((a.x + b.x) / 2 + Math.sin(PI / 3) * (a.y - b.y) / 3);
  e.y = (float)((a.y + b.y) / 2 + Math.sin(PI / 3) * (b.x - a.x) / 3);


  //the last turn, draw the lines
  if (i <= 0) {
    stroke(0);
    //println(e.x, e.y);
    line(a.x, a.y, c.x, c.y);
    line(c.x, c.y, e.x, e.y);
    line(e.x, e.y, d.x, d.y);
    line(d.x, d.y, b.x, b.y);
  } else { //recursion再帰
    drawKoch(a, c, i-1);
    drawKoch(c, e, i-1);
    drawKoch(e, d, i-1);
    drawKoch(d, b, i-1);
  }
}

double[][][] set = new double[][][]{
  {//100-200
    { 0.1400, 0.4300, 0.4500, 0.4900},
    { 0.0100, 0.5200, -0.4900, 0.0000},
    { 0.0000, -0.4500, 0.4700, 0.0000},
    { 0.5100, 0.5000, 0.4700, 0.5100},
    {-0.0800, 1.4900, -1.6200, 0.0200},
    {-1.3100, -0.7500, -0.7400, 1.6200}
  },
  {//500-550
    { 0.0000, 0.7248, 0.1583, 0.3386 },
    { 0.2439, 0.0337, -0.1297, 0.3694 },
    { 0.0000, -0.0253, 0.3550, 0.2227 },
    { 0.3053, 0.7426, 0.3676, -0.0756 },
    { 0.0000, 0.2060, 0.1383, 0.0679 },
    { 0.0000, 0.2538, 0.1750, 0.0826 }
  },
  {//500-600
    { 0.2020, 0.1380 },
    { -0.8050, 0.6650 },
    { -0.6890, -0.5020 },
    { -0.3420, -0.2220 },
    { -0.3730, 0.6600 },
    { -0.6530, -0.2770 }
  },
  {//500
    {  0.0500,  -0.0500,  0.0300,  -0.0300,  0.5600,  0.1900,  -0.3300},
    {  0.0000,  0.0000,  -0.1400,  0.1400,  0.4400,  0.0700,  -0.3400},
    {  0.0000,  0.0000,  0.0000,  0.0000,  -0.3700,  -0.1000,  -0.3300},
    {  0.4000,  -0.4000,  0.2600,  -0.2600,  0.5100,  0.1500,  0.3400},
    {  -0.0600,  -0.0600,  -0.1600,  -0.1600,  0.3000,  -0.2000,  -0.5400},
    {  -0.4700,  -0.4700,  -0.0100,  -0.0100,  0.1500,  0.2800,  0.3900}
  }

};


public void drawIFS(int s, int size, int t) {

  double  [] a= set[s][0];
  double  [] b= set[s][1];
  double  [] c= set[s][2];
  double  [] d= set[s][3];
  double  [] e= set[s][4];
  double  [] f= set[s][5];
  double x=500, y=500;

  for (int i = 0; i < t; i++) {
    int r = a.length;
    int j = (int)random(r);
    double tempX = a[j]*x + b[j]*y + e[j];
    double tempY = c[j]*x + d[j]*y + f[j];
    int px = (int) (tempX * size + 500);
    int py = (int) (tempY * size + 500);
    line(px, py, px, py);
    x = tempX;
    y = tempY;
  }
}
