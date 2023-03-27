class Asteroid extends Floater {
  private double rotationSpeed;
  public Asteroid(){
    rotationSpeed = Math.random() * 10 - 5;
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -6;
    yCorners[0] = -8; 
    xCorners[1] = -1;
    yCorners[1] = -10; 
    xCorners[2] =5;
    yCorners[2] = -6; 
    xCorners[3] = 9;
    yCorners[3] = 0; 
    xCorners[4] = 2;
    yCorners[4] = 4; 
    xCorners[5] = -9;
    yCorners[5] = -1; 
    myXspeed = Math.random() * 6 - 3;
    myYspeed =Math.random() * 6 - 3;
    myPointDirection = Math.random() * 360; 
    myCenterX = Math.random() * 500;
    myCenterY = Math.random() * 500;
    myColor = 255;
    
  }
  public void move(){
   turn(rotationSpeed);
   super.move();
    
  }
  
  public double getX(){
    return myCenterX;
  }
  
  public double getY(){
    return myCenterY;
  }
  
  
}
