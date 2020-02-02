/**
Keeps track on what directions the users are allowed to press
**/
void controller(){
  if(downTrue==false){
    image(theDown, 1000,600);
  }
   else{
     image(theDown2, 1000,600);
   }
  if(leftTrue==false){
    image(theLeft, 900,600);
  }
  else{
    image(theLeft2, 900,600);
  }
  if(rightTrue==false){
    image(theRight, 1100,600);
  }
  else{
    image(theRight2, 1100,600);
  }
  if(jumpTrue==false){
    image(theUp, 1000,500);
  }
  else{
    image(theUp2, 1000,500);
  }
}

/**
Keeps track of what key is actually pressed
yells at user if they press an illegal button
**/

void keyPressed(){
   if (key == 'w' || key == 'W'){
      if(jumpTrue==true)
      {
      if(hasJumped==false)
      jump();
      }
      else{
        text="you can't jump!";
        countdown=100;
      }
    }
    if (key == 'a' || key == 'A') {
    if(leftTrue == true){
    velocityx = -speed; 
    isLeft=true;
    }
    else{
      text="you can't go left!";
      countdown=100;
    }
    }
     else if (key == 'd' || key == 'D') {
       if(rightTrue == true){
      velocityx = speed;
       }
       else{
      text="you can't go right!";
      countdown=100;
    }
    }
    else if (key == 's' || key == 'S') {
       if(downTrue == true){
          img.resize(100,38);
          img2.resize(100,38);
          if(iscrouched == false){
          monkeyy+=38;
          }
          iscrouched=true;
       }
       else{
      text="you can't go down!";
      countdown=100;
    }
    }
    
}

/**
KeyReleased Listener
**/
void keyReleased(){
  if(keyCode=='a'|| keyCode== 'A'){
    velocityx = 0;
        isLeft=false;

  }
  else if(keyCode=='d'|| keyCode== 'D'){
    velocityx = 0;
  }
  else if(keyCode=='w'|| keyCode== 'W'){
    hasJumped = false;
  }
  else if(keyCode== 's' || keyCode == 'S'){
   img.resize(100,75);
   img2.resize(100,75);
   monkeyy-=38;
   iscrouched=false;
  }

  else if(keyCode==';')
  {
   monkeyy = 0;
   monkeyx = 300;
   velocityy=0;
   velocityx=0;
  }
}
void mouseClicked() {
  if(gamestate==0||gamestate==-1){
  if(mouseX>600 && mouseY<490 && mouseX<680 && mouseY>470){
    gamestate = currentLevel+1;
  }}
  if(gamestate==0){
    if(mouseX>600 && mouseX<700 && mouseY>495&&mouseY<520){
      gamestate = -2;
    }
  }
  if(gamestate==-2){
    if(mouseX>600 && mouseY<490 && mouseX<680 && mouseY>470){
    gamestate = 0;
  }}
  if(gamestate == -10){
    if(mouseX<700 && mouseY<510 && mouseX>550 && mouseY>460){
    gamestate = -1;
    currentLevel -=1;
  }}
}
