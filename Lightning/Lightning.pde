

void setup(){
 size(500,500); 
 background(255);
}

int numberOfLightnings = 100;
int[] randomEndx = new int[numberOfLightnings];
int[] randomEndy = new int[numberOfLightnings];
int centerX =250;
int centerY = 250;
boolean drawSomething = false; 

void draw(){
  if (!drawSomething) {
    return;
  }
  for (int i = 0; i < numberOfLightnings; i++) {
    stroke((int)(Math.random() * 255),(int)(Math.random() * 255),(int)(Math.random() * 255));
    int desiredSteps = 20;
    int distancePerStepX = (randomEndx[i] - centerX) /desiredSteps;
    int distancePerStepY = (randomEndy[i] - centerY) / desiredSteps;
    int previousPointX = centerX;
    int previousPointY = centerY;
    for (int a = 0; a < desiredSteps; a ++){
      
      int shiftX = (int)(Math.random() * Math.abs(distancePerStepX));
      if (distancePerStepX < 0) {
        shiftX = shiftX * - 1;
      } 
      int shiftY = (int)(Math.random() * Math.abs(11));
      if (distancePerStepY < 0){
        shiftY = shiftY * -1;
      }
      line(previousPointX, previousPointY, centerX + distancePerStepX * a + shiftX, centerY + distancePerStepY * a + shiftY);
      previousPointX = centerX + distancePerStepX * a + shiftX;
      previousPointY = centerY + distancePerStepY * a + shiftY;
    }
    drawSomething = false;
  }
  
  
}  

void mouseClicked(){
  background(255);
  drawSomething = true;
  centerX = mouseX;
  centerY = mouseY;
  for (int i = 0; i < numberOfLightnings; i++){
    randomEndx[i] = (int)(Math.random() * 500);
    randomEndy[i] = (int)(Math.random() * 500);
  }
}
