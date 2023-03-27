class Tendril
{
  public final static double SEG_LENGTH = 3; //length of each segment in the tendril
  private int myNumSegments, myX, myY;
  private double myAngle;
  
  /**
   Class constructor
   segments is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int segments, double theta, int x, int y)
  {
    myX = x;
    myY = y;
    myAngle = theta;
    myNumSegments = segments;
  }
  public void show()
  {
    
    // Set stroke color
    if (myNumSegments >= 100) {
      stroke(0, 255, 0);
    } else if (myNumSegments > 50) {
      stroke(159, 0, 80);
    }else if (myNumSegments > 25) {
      stroke(0, 79, 10);
    }else if (myNumSegments > 12) {
      stroke(90, 50, 0);
    }else if (myNumSegments > 6) {
      stroke(100,19, 200);
    } else {
      stroke(255,0, 0);
    }
    
    for (int i = 0; i < myNumSegments; i++) {
      int endX = (int)(myX + (Math.cos(myAngle) + Math.random() * 1.5 - .75)  * SEG_LENGTH);
      int endY = (int)(myY + Math.sin(myAngle + Math.random() * 1.5 - .75) * SEG_LENGTH);
      line(myX, myY, endX, endY);
      myX = endX;
      myY = endY;
    }
    if (myNumSegments > 10) {
      double randAngle = Math.random() * 2 * 3.1415;
      Cluster newCluster = new Cluster((int)(myNumSegments / 3), myX, myY); 
    }
      
    
  }
}
