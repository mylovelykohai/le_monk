/**
tracks the jump
**/
void jump()
{
  hasJumped = true;
  if (velocityy==0||velocityy==1)
  {
    jumpsound.play();
    velocityy+=jumpspeed;
  }
}
/**
duh
**/
void gravity() 
{
   velocityy=velocityy+1;
}

/**
Velocity of monkey every frame
**/
void monkeyVelocity()
{
  monkeyx=(monkeyx + velocityx);
  monkeyy=(monkeyy + velocityy);
}

void collision()
{
   for (int i = 0; i < coords.length; i++)
   {
     if(parseInt(coords[i][0])!=0 && parseInt(coords[i][1]) !=0)
     {
        if(monkeyx+50 > parseInt(coords[i][0]) && monkeyx+50 < parseInt(coords[i][0]) + parseInt(coords[i][2]))
        {
           if(monkeyy > parseInt(coords[i][1])-75)
           {
                if(velocityy>1 && parseInt(coords[i][1])>monkeyy)
                {
                  monkeyy = parseInt(coords[i][1])-75;
                  velocityy = 0;
                }
           }
        }
     }
   }
}
