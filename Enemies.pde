/**
bullet velocity for level 3
**/
void ShootBullet(){
  textSize(25);
  text("Crouching makes you immune to propaganda", 650,150);
  evilMonkX=evilMonkX-5;
  image(Bullet, evilMonkX,550);
  if(evilMonkX>monkeyx){
    image(BBQ, evilMonkX+100,450);
  }
  else{
    if(rightTrue == false)
    {
       slurp.play(); 
       rightTrue=true;
    }
  }
  if(evilMonkX<monkeyx+50&&evilMonkX>monkeyx-50&&iscrouched==false){
    evilMonkX=1000;
  }
  
}
void JuiceBoomer(){
  if(monkeyx==evilMonkX){
    collected=true;
    slurp.play();
  }
  if(collected==false){
    image(BoomerJuice, evilMonkX, 50);
  }
  else{
    speed=10;
  }
}
/**
Baseline path for enemies, evilmonkx is starting x value
**/
void enemyMovement(){
  if (EnemyPathFaceL == false){
        if (evilMonkX>600)
        {
        evilMonkX = evilMonkX-3;
        }
        else
        {
          EnemyPathFaceL = true;
        }
      }
      else{
        if (evilMonkX<1000)
        {
        evilMonkX = evilMonkX+3;
        }
        else
        {
          EnemyPathFaceL = false;
        }
      }
      
      if(monkeyx>evilMonkX&&monkeyx<evilMonkX+75&&monkeyy>340&&monkeyy<440){
        setStuff=true;
      }
      
      image(Enemy, evilMonkX,340);
}
