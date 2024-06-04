class player{
   private float blood_full; //full value of blood
   private float blood; //real-time value of blood
   private float shield_full; // full value of shield
   private float shield; //real-time value of sheild
   private float charge_speed; //automaticly charge speed of shield
   private int aid; //the amount of aid
   
   player(float b, float s, float c, int a){
      this.blood_full = b;
      this.blood = b;
      this.shield_full = s;
      this.shield = s;
      this.charge_speed = c;
      this.aid = a;
   }
   
   void setBlood(float b){
      blood = b;
   }
   
   void show(){
     
     //show blood
      strokeWeight(3);
      fill(255, 0, 0, 80);
      stroke(255, 0, 0);
      rect(20, 600 - blood_full - 20, 30, blood_full);
      fill(255, 255, 255); // use wite to cover the lost
      rect(20,600 - blood_full - 20, 30, blood_full - blood);
      
      //show blood
      strokeWeight(3);
      fill(0, 0, 255, 80);
      stroke(0, 0, 255);
      rect(50, 600 - shield_full - 20, 30, shield_full);
      fill(255, 255, 255);
      rect(50,600 - shield_full - 20, 30, shield_full - shield);
      
      //show aid
      for(int i=0;i<aid;i++){
        strokeWeight(5);
        stroke(255, 0, 0);
         line(515, 570 - i * 27, 535, 570 - i * 27);
         line(525, 560 - i * 27, 525, 580 - i * 27);
      }
      
   }
   
   //blood increase
   void blood_i(float x){
      if(blood < blood_full){
         blood = blood + x;
         if(blood > blood_full){blood = blood_full;} // blood can be more than total
      }
   }
   
   //shield increase
   void charge(){
      if(shield < shield_full){
         shield = shield + charge_speed;
         if(shield > shield_full){shield = shield_full;} // shield can be more than total
      }
   }
   
   //blood decrease
   void blood_d(float d){
      blood -= d;
      if(blood < 0){blood = 0;}
   }
   
   //shiel decrease
   void shield_d(float d){
      shield -= d;
      if(shield < 0){
         blood_d(-shield); // if shield is not enough then put the damage on blood
         shield = 0;
      }
   }
   
   //death or not
   boolean die(){
      if(blood > 0){
         return false;
      }else{
         return true;
      }
   }
   
   
   //use aid
   float aid_blood = 30; //how much blood could each aid provide
   void useAid(){
     if(aid > 0){
        blood_i(aid_blood);
        aid--;
     }
   }
   
   
}
