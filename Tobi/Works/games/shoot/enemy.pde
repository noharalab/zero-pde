import java.util.Queue;
import java.util.LinkedList;
import java.util.Date;

class enemy {
  point loc;
  String type;
  float blood;
  float attack;
  PImage img;
  float size;
  Date timer;
  float attack_speed;
  Queue<point> crater;// save the bullet place in state1
  color cor;


  enemy(point p, String type, float b, float a, PImage i, float s, Date t, float as, color c) {
    this.loc = p;
    this.type = type;
    this.blood = b;
    this.attack = a;
    this.img = i;
    this.size = s;
    this.timer = t;
    crater = new LinkedList<>();
    attack_speed = as;
    this.cor = c;
  }

  void moveTo(point p) {
    loc = p;
  }

  void show() {
    image(img, loc.x, loc.y, size, size);
  }
  
  void attack(){}
}



class en_fly1 extends enemy {


  en_fly1(point p, float b, float a, PImage i, float s, Date t, float as, color c) {
    super(p, "en_fly1", b, a, i, s, t, as, c);
  }


  float space = 20; //space between bullets
  void attack() {
    crater.add(new point(loc.x + size / 2, loc.y + size));  //make bullet at the middle bottom of the enemy
    crater.add(new point(loc.x + size / 2, loc.y + size + space));
    crater.add(new point(loc.x + size / 2, loc.y + size + 2 * space));
  }
}
