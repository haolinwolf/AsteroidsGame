
Asteroid[] enemy;
Star[] minions;
SpaceShip haolin;//your variable declarations here
public void setup() 
{
  size(400,400);
  haolin = new SpaceShip();
  minions = new Star[100];
  for (int i = 0; i < minions.length; i++)
  {
    minions[i] = new Star();
    minions[i].show();
  }
  enemy = new Asteroid[5];
  for (int i=0; i<enemy.length; i++)
  {
     enemy[i] = new Asteroid();
  }
}
 
public void draw() 
{
  background(0);

  for (int i = 0; i < minions.length; i++)
  {
    minions[i].show();
  }
  for(int i=0; i<enemy.length; i++)
  {
     enemy[i].show();
     enemy[i].move();
  }
 
  haolin.show();
  haolin.move();//your code here
}

public void keyPressed()
{
  if (keyCode == 32)
  {
    haolin.setX((int)(Math.random()*width));
    haolin.setY((int)(Math.random()*height));
    haolin.setDirectionX(0);
    haolin.setDirectionY(0);
    haolin.setPointDirection((int)(Math.random()*360));
  }  
  else if (keyCode == UP)
  {
    haolin.accelerate(0.5);
  }
  else if (keyCode == DOWN)
  {
    haolin.accelerate(0.5);
  }
  else if (keyCode == LEFT)
  {
    haolin.rotate(-20);
  }
  else if (keyCode == RIGHT)
  {
    haolin.rotate(20);
  }
} 
class Star
{
  private int myX;
  private int myY;
  public Star()
  {
    myX = (int)(Math.random()*400);
    myY = (int)(Math.random()*400);
  }
  public void show()
  {
    ellipse(myX,myY,(int)(Math.random()*5),(int)(Math.random()*5));
  }
}

class Asteroid extends Floater
{ 
  private int rotSpeed;
  public Asteroid()
  {
    rotSpeed = (int)(Math.random()*2)+1;
    corners = 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -30;
    yCorners[0] = -15;
    xCorners[1] = -15;
    yCorners[1] = -30;
    xCorners[2] = 15;
    yCorners[2] = -30;
    xCorners[3] = 30;
    yCorners[3] = -15;
    xCorners[4] = 30;
    yCorners[4] = 15;
    xCorners[5] = 15;
    yCorners[5] = 30;
    xCorners[6] = -15;
    yCorners[6] = 30;
  
    
    myColor = color(255);
    myCenterX = (int)(Math.random()*800);
    myCenterY = (int)(Math.random()*400);
    myDirectionX = (int)(Math.random()*3)-1;
    myDirectionY = (int)(Math.random()*3)-1;
  }

    public void move()
    {
      rotate(rotSpeed);
      super.move();
    }

    public void setX(int x){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
}

class SpaceShip extends Floater  
{   
    public SpaceShip()
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = 16;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = -2;
      yCorners[3] = 0;
      myCenterX = 250;
      myCenterY = 250;
      myDirectionX = 0;
      myDirectionY = 0;
      myPointDirection = 0;
      myColor = color (255);
    }
    public void setX(int x ){myCenterX = x;}
    public int getX(){return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }  

} 

