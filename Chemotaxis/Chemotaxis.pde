class Bacteria {
  float x, y;
  float angle;
  int redColor;
  int greenColor;
  int blueColor;
  
  Bacteria(float xInput, float yInput, int red, int green, int blue) {
    x = xInput;
    y = yInput;
    angle= -1000;
    redColor = red;
    greenColor = green;
    blueColor = blue;
    
  }
  void move(float targetX, float targetY, boolean unbiasedWalk) {
    if (unbiasedWalk) { // walk away from previous point
      while (x == targetX) {
        x += Math.random() * 6 - 3;
      }
      while (y == targetY) {
        y += Math.random() * 6 - 3;
      }

      float xDifference = x - targetX;
      float yDifference = y - targetY;
      
      // use first random position to determine angle of travel from origin
      if (angle == -1000) {
        angle = (float)(Math.atan(yDifference / xDifference)) * 180 / 3.1415;
        if (angle < 0) {
          if (xDifference < 0) { // quadrant 2
            angle += 180;
          } else { // quadrant 4
          }
        } else if (angle > 0){
          if (xDifference < 0){ // quadrant 3
            angle -= 180;
          }
        }
      }

      float xRandom = ((float)(Math.random() * 5) * (float)Math.cos(angle + Math.random()*10 -5)); 
      float yRandom = ((float)(Math.random() * 5) * (float)Math.sin(angle + Math.random()*10 -5)); 
      x += xRandom;
      y += yRandom;
      
    } else {
      
      float xDifference = targetX - x;
      float yDifference = targetY - y;
      
      if (xDifference <= 0){
        x -= Math.random() * 5;
      } else {
        x+= Math.random() * 5;
      }
      
      if (yDifference <= 0) {
        y -= Math.random() * 5;
      } else {
        y += Math.random() * 5;
      }
      
    }
  }
  void show(boolean beRed) {
    if (beRed) {
      fill(255,0,0);
    }else{
    fill(redColor, greenColor, blueColor);
    }
    ellipse(x, y, 10, 10);
  }
}



Bacteria [] myBacteria;
int[] xCoordinates = new int[100];
int[] yCoordinates = new int[100];
int clickCounter = 0;
boolean noFood = true; 
float lastX = 250;
float lastY = 250;
boolean [] reachedFood; 

void setup() {
  background(0);
  size(500, 500);
  myBacteria = new Bacteria[100];
  reachedFood = new boolean[myBacteria.length];
  for (int i = 0; i < myBacteria.length; i++) {
    myBacteria[i] = new Bacteria(250, 250, (int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
  }
  for (int i = 0; i < xCoordinates.length; i++) {
    xCoordinates[i] = 1000000;
    yCoordinates[i] = 1000000;

  }
}

void draw() {
  background(0);
  for (int i = 0; i < myBacteria.length; i++) {

    
    if (noFood) { // keep looking for food, random walk away from last point. 
     myBacteria[i].move(lastX,lastY,true);
     for (int n = 0; n < xCoordinates.length; n++){
       if ((myBacteria[i].x > xCoordinates[n] -5  && myBacteria[i].x < xCoordinates[n] + 5) && (myBacteria[i].y > yCoordinates[n] -5  && myBacteria[i].y < yCoordinates[n] + 5)) {
         xCoordinates[n] = 1000000;
         yCoordinates[n]=1000000;
         noFood = false;
         lastX = myBacteria[i].x;
         lastY = myBacteria[i].y;
         break;
       }
     }
    } else { // if food found, move toward the food. 
     myBacteria[i].move(lastX,lastY,false);
     if ((myBacteria[i].x > lastX -5  && myBacteria[i].x < lastX + 5) && (myBacteria[i].y > lastY -5  && myBacteria[i].y < lastY + 5)) {
         reachedFood[i] = true;
     }
    }
     
    if (noFood){
      myBacteria[i].show(false);
    } else{
      myBacteria[i].show(true);
    }
  }
  int bacteriaEating = 0;
  for (int i = 0; i < reachedFood.length; i++){
    if (reachedFood[i]){
      bacteriaEating += 1;
    }
  }
  if (bacteriaEating == reachedFood.length){
    noFood = true;
    reachedFood = new boolean[reachedFood.length];
  }
}

void mousePressed() {
  xCoordinates[clickCounter] = mouseX;
  yCoordinates[clickCounter] = mouseY;
  clickCounter += 1;
}
