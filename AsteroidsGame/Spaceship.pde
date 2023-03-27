class Spaceship extends Floater  
{   
    public Spaceship(int x, int y) {
      corners = 3;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8; 
      xCorners[1] = 16;
      yCorners[1] = 0; 
      xCorners[2] = -8;
      yCorners[2] = 8; 
      myXspeed = 0;
      myYspeed = 0;
      myPointDirection = 0; 
      myCenterX = x;
      myCenterY = y;
      myColor = 255;
    }
    
    public void hyperspace() {
      myCenterX = (int)(Math.random() * 500);
      myCenterY = (int)(Math.random() * 500);
      myXspeed = 0; 
      myYspeed = 0;
      myPointDirection = (Math.random() * 360);
    }
    
    public double getX(){
     return myCenterX; 
      
    }
     public double getY(){
     return myCenterY; 
      
    }
    
    public void setX(double x){
     myCenterX = x; 
      
    }
     public void setY(double y){
     myCenterY = y; 
      
    }
    
    public void setXSpeed(double x){
     myXspeed = x; 
      
    }
     public void setYSpeed(double y){
     myYspeed = y; 
      
    }
    
    public double getXSpeed(){
     return myXspeed;
      
    }
     public double getYSpeed(){
     return myYspeed;
      
    }
    
    
    public double getDirection(){
     return myPointDirection;
    }
    
    public void setDirection(double n){
     myPointDirection = n;
    }
}
