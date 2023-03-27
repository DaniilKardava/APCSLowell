class Star //note that this class does NOT extend Floater
{
  private int starX, starY;
  private int starRed;
  private int starBlue;
  private int starGreen;
  public Star () {
      starX = (int)(Math.random() * 500);
      starY = (int)(Math.random() * 500);
      starRed = (int)(Math.random() * 206) + 50;
      starBlue = (int)(Math.random() * 206)+ 50;
      starGreen = (int)(Math.random() * 206)+ 50;
  }
  public void show() {
   fill(starRed,starBlue, starGreen);
   stroke(starRed,starBlue, starGreen);
   ellipse(starX, starY, 10,10);
  }
  
}
