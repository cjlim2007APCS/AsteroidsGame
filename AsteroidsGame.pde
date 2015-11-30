//your variable declarations here
SpaceShip usagi = new SpaceShip();
Rockets vroom = new Rockets();
boolean w = false;
boolean s = false;
boolean a = false;
boolean d = false;
//Asteroid[] petRock;
ArrayList<Asteroid> petRock = new ArrayList<Asteroid>();
Star[] charloot;
public void setup() 
{
  size(512,512);
  petRock = new ArrayList <Asteroid>();
  charloot = new Star[200];
  //petRock = new Asteroid[4];
  for(int i=0;i<charloot.length;i++) {
    charloot[i] = new Star();
  }
  for(int i=0;i<5;i++) {
    petRock.add(new Asteroid());
  }
}
public void draw() 
{
  background(0);
  noFill();
  usagi.move();
  vroom.move();
  usagi.show();

  stroke(255);
  for(int i=0;i<charloot.length;i++) {
    charloot[i].show();
  }
  stroke(0);
  for(int i=0;i<petRock.size();i++)   {
    petRock.get(i).show();
    petRock.get(i).move();
    if(dist(petRock.get(i).getX(),petRock.get(i).getY(),usagi.getX(),usagi.getY()) < 20) {
      petRock.remove(i);
      System.out.println(petRock.size());
    }
  }
}
public void keyPressed() {
  if (w==true && a==true) {
    usagi.accelerate(0.1);
    usagi.rotate(-5);
    vroom.show();
  }
  if (w==true && d==true) {
    usagi.accelerate(0.1);
    usagi.rotate(5);
    vroom.show();
  }
  if (key == 'w') {
    w=true;
    usagi.accelerate(0.1);
    vroom.show();
  } else if (key == 's') {
    s=true;
    usagi.accelerate(-0.08);
  }
  if (key == 'a') {
    a=true;
    usagi.rotate(-5);
  } else if (key == 'd') {
    d=true;
    usagi.rotate(5);
  }
  if (key == 'x'||(Math.abs(usagi.getDirectionX())>=30||Math.abs(usagi.getDirectionY())>=30)) {
    usagi.setX((int)(Math.random()*512));
    usagi.setY((int)(Math.random()*512));
    usagi.setPointDirection((int)(Math.random()*360));
    usagi.setDirectionX(0);
    usagi.setDirectionY(0);
    vroom.setX(usagi.getX());
    vroom.setY(usagi.getY());
    vroom.setPointDirection((int)usagi.getPointDirection());
    vroom.setDirectionX(0);
    vroom.setDirectionY(0);
    for(int i=0;i<charloot.length;i++) {
    charloot[i] = new Star();
    }
  }
}
public void keyReleased() {
  if (key == 'w') {
    w=false;
  } else if (key == 's') {
    s=false;
  }
  if (key == 'a') {
    a=false;
  } else if (key == 'd') {
    d=false;
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
    xCorners[3] =-2;
    yCorners[3] =4;
    xCorners[4] =-8;
    yCorners[4] =9;
    xCorners[5] =-8;
    yCorners[5] =-9;
    xCorners[6] =-2;
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
class Rockets extends SpaceShip
{
  Rockets() {
    corners=10;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0]=-8;
    yCorners[0]=7+1;
    xCorners[1]=-13;
    yCorners[1]=7+1;
    xCorners[2]=-11;
    yCorners[2]=4+1;
    xCorners[3]=-13;
    yCorners[3]=1+1;
    xCorners[4]=-8;
    yCorners[4]=1+1;
    xCorners[5]=-8;
    yCorners[5]=-1-1;
    xCorners[6]=-13;
    yCorners[6]=-1-1;
    xCorners[7]=-11;
    yCorners[7]=-4-1;
    xCorners[8]=-13;
    yCorners[8]=-7-1;
    xCorners[9]=-8;
    yCorners[9]=-7-1;
    myColor = 255;
    myCenterX = 256;
    myCenterY = 256;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
  }
  public void move() {
    myCenterX=usagi.getX();
    myCenterY=usagi.getY();
    myPointDirection=usagi.getPointDirection();
  }
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
class Asteroid extends Floater
{
  int rotSpeed;
  Asteroid() {
  corners = 6;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = (int)(Math.random()*5-13);
  yCorners[0] = (int)(Math.random()*5-10);
  xCorners[1] = (int)(Math.random()*5+5);
  yCorners[1] = (int)(Math.random()*5-10);
  xCorners[2] = (int)(Math.random()*5+11);
  yCorners[2] = (int)(Math.random()*5-2);
  xCorners[3] = (int)(Math.random()*5+4);
  yCorners[3] = (int)(Math.random()*5+8);
  xCorners[4] = (int)(Math.random()*5-11);
  yCorners[4] = (int)(Math.random()*5+6);
  xCorners[5] = (int)(Math.random()*5-12);
  yCorners[5] = (int)(Math.random()*5-2);
  myColor = 255;
  myCenterX = Math.random()*512;
  myCenterY = Math.random()*512;
  myDirectionX = Math.random()*3-1.5;
  myDirectionY = Math.random()*3-1.5;
  myPointDirection = Math.random()*2*PI;
  rotSpeed = (int)(Math.random()*10);
  }
  public void move() {
    rotate(rotSpeed);
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
    //fill(myColor);   
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

