
class dot{
  private float x;//x-coordinate 
  private float y;//y-coordinate
  
  dot(float a, float b){
    x = a;
    y = b;
  }
}

int num = 5; //the num of nodes at begining
int count = 0; //index of all nodes
float space = 20; //space between each node
float size = 10; //the size of each node
dot dots[] = new dot[100]; //nodes list
int flag = 0; //started or not
dot target; // target coordination
int score = 0; 
int time = 0; //the time at beging, used to calculate the differ of time
int timer = 60;
float speed = 4; // moving speed of each node , smaller value cloud be faster


void setup(){
  size(600, 600);
  background(255);
  
  target = new dot(random(600), random(600));
  time = second();
}



void mousePressed(){

  float x = mouseX;
  float y = mouseY;
  if(flag == 0){
    for(int i=0;i<num;i++){
      dots[i] = new dot(x + i * space, y + i * space);
      ellipse(dots[i].x, dots[i].y, size, size);
      count++;
    }
    flag = 1;
  }
}

void draw(){
  background(255);
  
  //draw the score
  fill(0);
  textSize(50);
  text(score, 10, 40);
  
  
  
  //draw the target
  drawDot(target, 10, 0);
  
  if(flag == 1){
    
    //draw the timer
    
    fill(0);
    textSize(50);
    text(timer, 500, 40);
    int temp = second();
    if(temp != time){
      timer--;
      time = temp;
    }
    if(timer == 0){
      flag = 2;
    }
    
    
    fill(0,0,0);
    dot d = new dot(mouseX, mouseY);
    drawDot(d, size, 0);
    dots[0] = d;
    for(int i=1;i<count;i++){
       if(dis(dots[i-1],dots[i]) > space){
         float dir_x = (dots[i-1].x - dots[i].x)  / speed;
         float dir_y = (dots[i-1].y - dots[i].y) / speed;
         dots[i].x = dots[i].x + dir_x;
         dots[i].y = dots[i].y + dir_y; 
       }
       
       drawDot(dots[i], size, 0);
    }
    
    //touch the target
    if(Math.abs(d.x - target.x) < 9 && Math.abs(d.y - target.y) < 9){
      target = new dot(random(10,590), random(50,590));
      drawDot(target, size, 0);
      float x = 2 * dots[count-1].x - dots[count-2].x ;
      float y = 2 * dots[count-1].y - dots[count-2].y ;
      dots[count] = new dot(x, y);
      drawDot(dots[count], size, 0);
      count++;
      score++;
    }
    
    //game over
    for(int i=1;i<count;i++){
      if(Math.abs(d.x - dots[i].x) < 3 && Math.abs(d.y - dots[i].y) < 2){
        flag = 2;
        break;
      }
      
      if(d.x < 5 || d.x > 595 || d.y < 5 || d.y > 595){
        flag = 2;
        break;
      }
    }
    
    
  }
  
  //gmae over
  if(flag == 2){
    background(0);
    for(int i=0;i<count;i++){
      drawDot(dots[i], size, 255);
    }
    fill(255);
    textSize(50);
    text("Game Over", 10, 40);
    text("Your Score is: ", 10,100);
    text(score, 300, 100);
    
    drawDot(target, size, 255);
  }
  
  
  
}



public void drawDot(dot d, float size, int cor){
  fill(cor);
  ellipse(d.x, d.y, size, size);
}

float dis(dot d1, dot d2){
  return (float)Math.hypot(d2.x-d1.x,d2.y-d1.y);
}
