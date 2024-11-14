import g4p_controls.*;

color red = color(255,0,0);       //Angry customer
color yellow = color(255,255,0);  //Normal customer
color blue = color(0,0,255);      //Normal cashier
color purple = color(255,0,255);  //Sleeping cashier

void setup(){
  size(800,700);
  background(255,255,255);
  rect(50,550, 700,50);    //Counter
  createGUI();
}

void draw(){
  background(255,255,255);
  rect(50,550, 700,50);
}
