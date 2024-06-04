void setup(){
size(600,600);
background(0,0,0);
}

void mouseDragged(){
stroke(mouseY,mouseX,0);//the color will change by the location of console 
line(300,300,pmouseX,pmouseY);
stroke(mouseX,mouseY,0);
line(300,300,pmouseY,pmouseX);
}

void draw(){
}
