void setup() {
   size(512,512);
   background(0);
   noStroke();
}

void draw(){
  int i,j;
   for(j=0; j<256 ; j++){
     for(i=0; i<256 ; i++){ 
       v_pixel(2, i, j, (i*j)/255+255-i,j, i);  
   } 
  }
}

 //v_pixel(2, i, j, 255-i,i*j/255, 255-j);
       //v_pixel(2, i, j, ((j-(255-i)*i))/255+255-j,0, 0);
// 以下の部分は、変更・削除しないこと
// 


void keyPressed(){
  if( key== 's' ) {
    saveFrame("Result.jpg");  // Save File Name
  }
}
//
void v_pixel(int n, int x, int y, int r,int g, int b)
  {
   if(n==1)
    {
      stroke(color(r,g,b));
      point(x,y);}
     else
     {
       fill(r,g,b);
       rect(x*n,y*n,n,n);
     }
  }
