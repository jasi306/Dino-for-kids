PImage BG;
PImage Dino;

float x;
float h;
float vh;

boolean naZiemi;

float g;

PImage kaktus;

float Cx;
float Cvx;
float Ch;

boolean przegrana;
void setup(){ 
  size(1600,800);
  x=width*1/8;
  h=height *3/8  ;
  g = 0.5;
  
  vh=0;
  Dino = loadImage("dino.png");
  BG = loadImage("BG.jpg");
  kaktus = loadImage("kaktus.png");
  
  Cx=0;
  Cvx=4;
  Ch=height *3/8-130;
  
  przegrana = false;
}

void draw(){
  rysuj();
  if(przegrana == false){
    logika();
  }
}

void rysuj(){
  background(BG);
  image(kaktus, Cx, Ch);
  image(Dino, x, h,60,60);
  
  fill(0);
  text("punkty " + (int)((Cvx-4)*100),width-100,100);  
  
  if(przegrana){
    fill(0);
    textSize(20);
    text("Przegrałeś\nr aby zresetować",width/2,height/2);
  }
}
void logika(){

  //skoki
  if(h <= height *3/8 || vh > 0){
    h = h - vh;
  }
  else {
    naZiemi = true; 
  }

  //zmiany predkosci
  vh = vh - g;
     
  //ruch kaktusa.
  if (Cx <= -1600){
    Cx+=1600;
  }
  Cvx +=0.01;
  Cx = Cx - Cvx;
  
  //kolizje.
  if( abs(x - (Cx+1550)  )<10 ){  //szerokosc
    if( h > Ch+130 ){  //wysokosc
      przegrana = true;
    }
  }

}

void keyPressed(){
  //podskok
  if( naZiemi ){  
    if(key == ' '){
      vh = 10;
      naZiemi = false;
    }
  }
  //reset
  if(key=='r'){
    setup(); 
  }
}
