//your variable declarations here
SpaceShip usagi = new SpaceShip();
Star[] charloot;
public void setup() 
{
  size(512,512);
  charloot = new Star[200];
  for(int i=0;i<charloot.length;i++) {
    charloot[i] = new Star();
  }
}
public void draw() 
{
  background(0);
  usagi.show();
  usagi.move();
  stroke(255);
  for(int i=0;i<charloot.length;i++) {
    charloot[i].show();
  }
  stroke(0);
}
public void keyPressed() {
  if (key == 'w') {
    usagi.accelerate(0.1);
  } else if (key == 's') {
    usagi.accelerate(-0.1);
  }
  if (key == 'a') {
    usagi.rotate(-5);
  } else if (key == 'd') {
    usagi.rotate(5);
  }
  if (key == 'x'||(Math.abs(usagi.getDirectionX())>=30||Math.abs(usagi.getDirectionY())>=30)) {
    usagi.setX((int)(Math.random()*512));
    usagi.setY((int)(Math.random()*512));
    usagi.setPointDirection((int)(Math.random()*360));
    usagi.setDirectionX(0);
    usagi.setDirectionY(0);
  }
}
class SpaceShip extends Floater  
{   
  SpaceShip() {
    corners = 10;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] =8;
    yCorners[0] =0;
    xCorners[1] =3;
    yCorners[1] =3;
    xCorners[2] =5;
    yCorners[2] =4;
    xCorners[3] =0;
    yCorners[3] =4;
    xCorners[4] =-8;
    yCorners[4] =7;
    xCorners[5] =-8;
    yCorners[5] =-7;
    xCorners[6] =0;
    yCorners[6] =-4;
    xCorners[7] =5;
    yCorners[7] =-4;
    xCorners[8] =3;
    yCorners[8] =-3;
    xCorners[9] =8;
    yCorners[9] =0;
    myColor = 255;
    myCenterX = 256;
    myCenterY = 256;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void setX(int x){myCenterX=x;}
  public int getX(){return (int)myCenterX;}  
  public void setY(int y){myCenterY=y;}  
  public int getY(){return (int)myCenterY;}  
  public void setDirectionX(double x){myDirectionX=x;}  
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y){myDirectionY=y;}
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection=degrees;}
  public double getPointDirection(){return myPointDirection;}
}
class Star
{
  int myX, myY;
  Star() {
    myX=(int)(Math.random()*512);
    myY=(int)(Math.random()*512);
  }
  public void show() {
    point(myX,myY);
  }
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

