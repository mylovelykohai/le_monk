/**
Data for each individual level
**/

void loadlevel(int levelno)
{
  String[] lines = loadStrings("level"+levelno+".monk");
  for (int i = 0 ; i < lines.length; i++) 
  {
    coords[i] = lines[i].split(",");
    rect(parseInt(coords[i][0]),parseInt(coords[i][1]),parseInt(coords[i][2]),parseInt(coords[i][3]));
  }
}


void level()
{
  if(gamestate!=4)
  {
    if(monkeyx==goalfloatx)
      {
        gamestate = -1;
        setStuff=true;
      }
  }
  else
  {
    if(monkeyx < goalfloatx + 50 && monkeyx > goalfloatx - 50 && monkeyy > goalfloaty + 50 && monkeyy < goalfloaty - 50)
    {
      gamestate = -1;
      setStuff=true; 
    }
  }
    
  /**
  
  **/
  if (gamestate == -10){
    background(#C0C0C0);
    trippyFill();
    monkeyy=-100;
    velocityy=0;
    textSize(64);
    textAlign(CENTER);
    text("LE MONK", width/2, height/2-50); 
    text("IS DEAD", width/2, height/2);
    
    textSize(32);
    text("TRY", width/2, height/2+130); 
    text("AGAIN?", width/2, height/2+160);
  }
  if(gamestate == -2){
      textAlign(CENTER);
      background(255);
      text("Le Volume:", width/2, height/2-50); 
  hs1.update();
  hs1.display();
  
  stroke(0);
  line(0, height/2, width, height/2);
      text("PLAY", width/2, height/2+130);
    }

  
  if(gamestate == -1){
    background(#C0C0C0);
    velocityy=0;
    textSize(64);
    textAlign(CENTER);
    fill(mouseX, mouseX, mouseX);
    setStuff = true;
    monkeyx = 200;
    monkeyy = 200;
    text(("You have beaten level " + currentLevel), width/2, height/2-50); 
    textSize(32);
    text("Next Level", width/2, height/2+130); 
  }
   /**
  Level 0
  **/
  
  if (gamestate > 0)
  { 
     loadlevel(gamestate);
  }
  if (gamestate == 0){
    textSize(64);
    textAlign(CENTER);
    fill(mouseY/2, mouseX/2, mouseX/3);
    text("LE MONK", width/2, height/2-50); 
    text("HAS", width/2, height/2);
    text("ARRIVED", width/2, height/2+50);

    textSize(32);
    text("PLAY", width/2, height/2+130); 
    text("SETTINGS", width/2, height/2+160);
    text("LEVEL", width/2, height/2+190); 

  }//level 0 MENU
  
  /**
  Level 1
  **/
  if (gamestate == 1) {
    currentLevel = 1;
    speed =2;
    inLevel = true;
    controller();
    goalFloat();
    trippyFill();
    leftTrue = true;
    rightTrue = true;
    if(jumpTrue==false){
     image(powerup, 500,475);
     if(monkeyx==420){
          jumpTrue=true;
          slurp.play();
          text="Jump powerup gained!";
          countdown=100;
      }
    }
    
  }//level 1
  
  if(gamestate == 2){
     currentLevel = 2;
     if( setStuff == true){
     monkeyx= 300;
     monkeyy=0;
     downTrue = false;
     jumpTrue = true;
     leftTrue = false;
     rightTrue = true;
     goalfloatx = 50;
     goalfloaty = 500;
     speed = 2;
     goalstorey = 500;
     evilMonkX = 700;
     setStuff = false;
     }
     trippyFill();
     goalFloat();
     controller();//
      enemyMovement();
      if(leftTrue==false)
      {
      image(LeftCola, 1000,350);
      if(monkeyx==1000){
        leftTrue=true;
        slurp.play();
      }
      }
  }
  if(gamestate==3){
    currentLevel = 3;
     if( setStuff == true){
     monkeyx= 300;
     monkeyy=0;
     downTrue = true;
     jumpTrue = false;
     leftTrue = false;
     rightTrue = false;
     goalfloatx = 700;
     speed = 4;
     goalfloaty = 500;
     goalstorey = 500;
     evilMonkX = 700;
     setStuff = false;
     }
     trippyFill();
     controller();
     ShootBullet();
     goalFloat();
  }
  if(gamestate==4){
    currentLevel = 4;
    if( setStuff == true){
     monkeyx=300;
     monkeyy=0;
     downTrue = false;
     jumpTrue = true;
     leftTrue = true;
     rightTrue = true;
     goalfloatx = 1200;
     goalfloaty = 600; 
     speed = 1;
     goalfloaty = 500;
     goalstorey = 500;
     evilMonkX = 100;
     setStuff = false;
     }
     trippyFill();
     controller();
     JuiceBoomer();
     goalFloat();
  
  }
  if(gamestate==5){
    monkeyx=100;
    monkeyy=100;
    velocityy=0;
    textSize(200);
    text("winner",200,200);
  }
  }

void goalFloat(){
  image(goal, goalfloatx,goalfloaty);
  if (goalfloaty<goalstorey+50){
    goalfloaty=goalfloaty+1;
    
  }
  else{
    goalfloaty = goalstorey-50;
  }
}
