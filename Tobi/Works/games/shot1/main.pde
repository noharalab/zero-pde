import java.util.Queue;
import java.util.LinkedList;
import java.util.Date;

gun guns[] = new gun[10];
int trigger = 0; // 0-off, 1-on,2-loading
int gun_num = 0;
int state = 0; //0-start ,1-play, 2-

player player = new player(100, 50, 10, 3);// blood, shield, charge_speed, aid

Queue<point> crater1 = new LinkedList<>();// save the bullet place in state1
Queue<Date> crater1_timer = new LinkedList<>();// save the timer of bullet place in state1


void setup() {
  size(600, 600);
  background(255);
  guns[0] = new gun(300, 300, 0, 40, 0.4, 50, 50);// x-coodinate, y-coordinate, type, reciol, speed, damage, bullet_full
}


void draw() {

  background(255); //refresh the screen
  if (state == 0) {
    showStart();
  } else if (state == 1) {
    loadPlayer();
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
void loadPlayer(){
   player.show();
   if (time_shield > 2) {
    time_shield = 0;
  }
  time_shield += 0.1; // speed of refreshing the shield
  
  if((int)time_shield == 2){
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
  
  
}

//test
//void mousePressed() {
//  if (mouseButton == RIGHT) {
//     player.useAid();
//  }
//}
