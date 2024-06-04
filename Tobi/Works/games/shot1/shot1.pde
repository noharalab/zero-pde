class point{
   float x;
   float y;
   
   point(float a, float b){
      this.x = a;
      this.y = b;
   }
   
   void show(){
      fill(255, 0, 0);
      ellipse(x, y , 3, 3);
   }
  
}

class gun{
   point point; // position of aimer
   int type; // gun type
   float recoil;
   float speed; // bigger faster
   float damage;
   float bullet_full; //total amount of bullet
   float bullet; // real-time amount of bullet
   
   gun(float x, float y, int t, float r, float s, float d, float b){
      this.point = new point(x, y);
      this.type = t;
      this. recoil = r;
      this.speed = s;
      this.damage = d;
      this.bullet_full = b;
      this.bullet = b;
   }
   
   gun(point p, int t, float r, float s, float d, float b){
       this.point = p;
       this.type = t;
       this.recoil = r;
       this.speed = s;
       this.damage = d;
       this.bullet_full = b;
       this.bullet = b;
   }
   
  public void showAim(){
       float x = point.x;
       float y = point.y;
       
       if(type == 0){
          strokeWeight(3);
          float iner = 3;
          float outer = 10;
          stroke(0, 0 ,0);
          line(x+iner, y, x+outer, y);
          line(x-iner, y, x-outer, y);
          line(x, y+iner, x, y+outer);
          line(x, y-iner, x, y-outer);
       }
   }
   
   public void showMagazine(){
     
      strokeWeight(3);
      fill(255, 255, 0, 80);
      stroke(255, 255, 0);
      rect(550, 500, 30, 80);
      fill(255, 255, 255); // use white to cover
      rect(550,500, 30, 80 - bullet / bullet_full * 80);
      
      fill(0);
      strokeWeight(1);
      textSize(20);
      text((int)bullet + "/" + (int)bullet_full, 550, 490);
   }
   
   public void setPoint(float a, float b){
      point.x = a;
      point.y = b;
   }
   
   public point shoot(int flag){ //flag == 1 fire, flag == 2 fill FPS
      float x = point.x;
      float y = point.y;
     
      if(type == 0){
          float iner = 3;
          float outer = 10;
          float r= random(recoil);
          strokeWeight(3);
          stroke(0);
          line(x + iner + recoil + r, y, x + outer + recoil + r, y);
          line(x - iner - recoil - r, y, x - outer - recoil - r, y);
          line(x, y + iner + recoil + r, x, y + outer + recoil + r);
          line(x, y - iner - recoil - r, x, y - outer - recoil - r);
      }
      
      if(flag == 1){
         bullet--;
         point p = new point(point.x + random(-recoil, recoil), point.y + random(-recoil, recoil));
         return p;
      }else{
         return null;
      }
   }
   
   public boolean loaded(){
      if(bullet != 0){
         return true;
      }else{
         return false;
      }
   }
   
   public void reload(){
      strokeWeight(0);
      fill(200,200,200);
      arc(point.x, point.y, 30, 30, -HALF_PI, 2 * PI * bullet / bullet_full - HALF_PI, PIE);
      bullet++;
      
   }
   
   public boolean full_loaded(){
      if(bullet == bullet_full){
         return true;
      }else{
         return false;
      }
   }
}
