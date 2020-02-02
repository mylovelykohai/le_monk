import processing.sound.*;
Sound s;
void setup()
{
  size(1280,720);
  file = new SoundFile(this, "Sample.wav");
  file.amp(100);
  jumpsound = new SoundFile(this, "jump.wav"); 
  jumpsound.amp(0.25);
  slurp = new SoundFile(this, "slurp.wav");
  slurp.amp(0.5);
  
  img = loadImage("Le-Monk.png");
  img2 = loadImage("Le-Monk2.png");
  imgF = loadImage("Flipped-Monk.png");
  imgF2 = loadImage("Flipped-Monk2.png");
  powerup = loadImage("up-button-power.png");
  goal = loadImage("Goal.png");
  theDown = loadImage("theDown.png");
  theDown2 = loadImage("theDown2.png");
  theUp = loadImage("theUp.png");
  theUp2 = loadImage("theUp2.png");
  theRight = loadImage("theRight.png");
  theRight2 = loadImage("theRight2.png");
  theLeft = loadImage("theLeft.png");
  theLeft2 = loadImage("theLeft2.png");
  BoomerJuice = loadImage("zoomie-juice.png");
  leCrouch = loadImage("Le-Crouch.png");
  LeftCola = loadImage("LeftiCola.png");
  Enemy = loadImage("Le-Evil-Monk.png");
  BBQ = loadImage("Le-Right.png");
  BBQ.resize(50,100);
  powerup.resize(50,100);
  hs1 = new HScrollbar(0, height/2-8, width, 16, 16);
  hs2 = new HScrollbar(0, height/2+8, width, 16, 16);
  goal.resize(100,150);
  img.resize(100,75);
  img2.resize(100,75);
  Bullet = loadImage("Bullet.gif");
  Bullet.resize(75,75);
  textSize(48);
  ellipseMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  BoomerJuice.resize(100,100);
  file.loop();
}
PImage BoomerJuice, powerup, img, img2, goal, theDown, theDown2, theUp, theUp2, theLeft, theLeft2, theRight, theRight2, Enemy, leCrouch, LeftCola, Bullet, BBQ, imgF, imgF2;
/** **/
boolean collected = false;
boolean jumpTrue = false;
SoundFile file;
SoundFile jumpsound;
SoundFile slurp;

boolean leftTrue = false;
boolean rightTrue = false;
boolean downTrue = false;
boolean setStuff = false;
boolean EnemyPathFaceL = false;
/** LE MONK position **/
int monkeyx = 200;
String audioName = "Sample.mp3";
String path;
float volumeVar = 0.1;
int monkeyy = 200;
int speed = 3;
/** Mobile End Object **/
int goalfloatx = 1000;
int goalfloaty = 200;
  int evilMonkX;
int goalstorey = 200;
boolean isLeft = false;
boolean iscrouched = false;
/** LE MONK Speed**/
int velocityx = 0;
int velocityy = 0;
int jumpspeed = -20;
/** How long text is on screen for**/
int countdown = 0;
int x = 200;
int y = 500;
String text="";
int theTimer=0;
boolean levelStart = true;
boolean hasJumped = false;
/**Game level**/
int gamestate = 0;
int currentLevel = 0;
String[][] coords = new String[20][4];
boolean inLevel = false;


/**
The baseline for inputting rectangles on levels
**/
void levelRect(float levXCoord, float levYCoord, float levX, float levY) 
{
  fill(#C0C0C0);
  rect(levXCoord, levYCoord, levX, levY);
}

/**
Allowing the text to input to the screen
**/

void talk(String Input, int Countdown)
{
  if (Countdown>0)
  {
    text(Input,200,200);
    countdown=countdown-1;
  }
  if(Countdown==0)
  {
    Input="";
  }
}

/**
Calling other functions every frame
**/

void draw()
{
  
  background(25,30,35);
  file.amp(volumeVar);
  jumpsound.amp(volumeVar);
  slurp.amp(0.3+volumeVar);
  
  if (monkeyy>1500){
    gamestate=-10;
  }
  level();//drawing the level
  if(inLevel)
  {
    drawMonkey();
    monkeyVelocity();
    gravity();
    collision();
  }
  talk(text,countdown);
  
 }

/**
Monkey is complicated, give him his own section for drawing
**/
void drawMonkey(){
  if(velocityx==0){
    if (isLeft==true){
      image(imgF, monkeyx,monkeyy);
    }
    else{
  image(img2, monkeyx,monkeyy);
  }}
  else{
    if (theTimer<20){
      if (isLeft==true){
      image(imgF, monkeyx,monkeyy);
    }else{
      image(img, monkeyx,monkeyy);
    }
      theTimer=theTimer+1;
    }
    else if (theTimer==22){
      theTimer=0;
    }
    else if (theTimer==20){
      theTimer=40;
    }
    else if(theTimer>=10){
      if (isLeft==true){
      image(imgF2, monkeyx,monkeyy);
      theTimer=theTimer-1;
    }else{
       image(img2, monkeyx,monkeyy);
       theTimer=theTimer-1;
    }}
  }
}
