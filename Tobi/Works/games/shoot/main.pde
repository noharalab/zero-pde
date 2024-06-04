import java.util.Queue;
import java.util.LinkedList;
import java.util.Date;

gun guns[] = new gun[10];
int trigger = 0; // 0-off, 1-on,2-loading
int gun_num = 0;
int state = 0; //0-start ,1-play, 2-
int protect = 0;

player player = new player(100, 50, 10, 3);// blood, shield, charge_speed, aid

Queue<point> crater1 = new LinkedList<>();// save the bullet place in state1
Queue<Date> crater1_timer = new LinkedList<>();// save the timer of bullet place in state1

enemy en_list[] = new enemy[20];




void setup() {
  size(600, 600);
  background(255);

  //gun initial
  guns[0] = new gun(300, 300, 0, 40, 0.4, 50, 50);// x-coodinate, y-coordinate, type, reciol, speed, damage, bullet_full

  //enemy initial
  en_list[0] = new en_fly1(new point(300, 0), 100, 10, loadImage("en_fly1.png"), 80, new Date(), 2, color(255, 200, 0)); // loc, attack, damage, img, size, timer, attack_speed, color
}


void draw() {

  background(255); //refresh the screen
  if (state == 0) {
    showStart();
  } else if (state == 1) {


    loadPlayer();

    loadEnemy();

    play();
  }
}



int start_click = 0; //chang into game when releass the button but not when push the button
void showStart() {

  float x = mouseX;
  float y = mouseY;

  if ( x > 200 && x < 400 && y > 260 && y < 340) { //move to the start button
    noStroke();
    fill(200, 0, 200, 50);
    rect(200, 260, 200, 80);
  }

  if (mousePressed == true && x > 200 && x < 400 && y > 260 && y < 340) { //click the start button
    noStroke();
    fill(255, 0, 0, 50);
    rect(200, 260, 200, 80);
    start_click = 1;
  }
  if (start_click == 1 && mousePressed == false) {
    state = 1;
  }

  noFill();
  stroke(0);
  strokeWeight(3);
  rect(200, 260, 200, 80);
  textSize(70);
  fill(0);
  text("Start", 230, 325);
}



float time_shield = 0;
void loadPlayer() {
  player.show();
  if (time_shield > 2) {
    time_shield = 0;
  }
  time_shield += 0.1; // speed of refreshing the shield

  if ((int)time_shield == 2) {
    player.charge();
  }
}



float time_shoot = 0;
void play() {
  if (time_shoot > 1) {
    time_shoot = 0;
  }
  time_shoot = time_shoot + guns[gun_num].speed;


  float x = mouseX;
  float y = mouseY;

  gun gun = guns[gun_num];
  gun.setPoint(x, y);

  if (trigger == 0) {
    gun.showAim();
    gun.showMagazine();
  } else if (trigger == 1) { // pull the trgger


    if ((int)time_shoot == 1) { //shooting speed depend on the timer's speed

      if (!gun.loaded()) {  // no bullet
        trigger = 2;
      } else if (gun.loaded()) {
        point temp = gun.shoot(1);


        //player.shield_d(20); //test

        //add the crater into the map
        if (temp != null) {
          crater1.add(temp);
          crater1_timer.add(new Date());
        }
      }
    } else {
      gun.shoot(2);
      gun.showMagazine();
    }
    gun.showMagazine();
  } else if (trigger == 2) { // when loading

    gun.reload();
    gun.showMagazine();
    if (gun.full_loaded()) {
      if (mousePressed == true) {
        trigger = 1;
      } else {
        trigger = 0;
      }
    }
  }


  //show craters
  for (point p : crater1) {
    fill(255, 0, 0);
    noStroke();
    ellipse(p.x, p.y, 3, 3);
  }
  if (crater1_timer.peek() != null) {
    if ((new Date().getTime() - crater1_timer.peek().getTime())/ 1000 > 2) {
      crater1_timer.remove();
      crater1.remove();
    }
  }


  //pull the trigger
  if (mousePressed == true && mouseButton == LEFT) {
    if (trigger != 2) { //is loading or not
      trigger = 1;
    }
  }


  //releas the trigger
  if (mousePressed == false && mouseButton == LEFT) {
    if (trigger != 2) { // isloading or not
      trigger = 0;
    }
  }


  //reload by key-R
  if (keyPressed == true && keyCode == CONTROL && !gun.full_loaded()) {
    trigger = 2;
  }
}


float en_bullet_size = 10;
Date timer = new Date();
float en_bullet_reflesh = 2; //smaller faster
float en_bullet_reflesh_speed = 10; // bigger faster
float line = 450;// protection line

void loadEnemy() {

  for (int i=0; i<en_list.length; i++) {

    enemy en = en_list[i];

    if (en != null) {

      float time_diff1 = (new Date().getTime() - en.timer.getTime()) / 1000; // frequency of attack
      float time_diff2 = (new Date().getTime() - timer.getTime()) / 10; //when "/1000" get the second
      en.show();

      //show bullet
      for (point p : en.crater) {

        //draw each bullet
        noStroke();
        fill(en.cor);
        ellipse(p.x, p.y, en_bullet_size, en_bullet_size);

        //reflesh
        if (time_diff2 % en_bullet_reflesh >= 1) {
          p.y += en_bullet_reflesh_speed;
        }
      }

      //get injure
      if(en.crater.peek() != null){
        if (en.crater.peek().y > line) {
          en.crater.remove();
  
          if (protect == 0) { //with no protection, decrease blood
            player.blood_d(en.attack);
          } else if (protect == 1) { //when holing the shield
            player.shield_d(en.attack);
          }
        }
      }


      //attack
      if (time_diff1 >= en.attack_speed) {
        en.timer = new Date();
        en.attack();
      }
    }
  }
}



//test
//void mousePressed() {
//  if (mouseButton == RIGHT) {
//     player.useAid();
//  }
//}
