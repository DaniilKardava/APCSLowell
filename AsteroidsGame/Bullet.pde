class Bullet extends Floater {
  // Pass position of ship to spawn bullet
  public Bullet(double x, double y, double direction, double xSpeed, double ySpeed){
    myPointDirection = direction; 
    myCenterX = x;
    myCenterY = y;
    myColor = 255;
    myXspeed = xSpeed;
    myYspeed =ySpeed;
  }
  
  public void show(){
    ellipse((float)myCenterX,(float)myCenterY,5, 5);
  }
  
  public void move(){
    
    myCenterX += myXspeed;    
    myCenterY += myYspeed;
  }
  
  public double getX(){
    return myCenterX;
  }
  
  public double getY(){
    return myCenterY;
  }
  
  
}
