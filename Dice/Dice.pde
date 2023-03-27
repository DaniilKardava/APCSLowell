// I wanted to have the user draw a shape using their mouse and save the locations 
// using an array. Then I would use those points to create high rolls and give the 
//darker shades. 

void setup()
  {
      size(1000,1000);
      noLoop();
      background(255);
      rectMode(CENTER);
  }

int[] xCoordinates = new int[50000];
int[] yCoordinates = new int[50000];
int position = 0;
boolean rollDice;
int lengthNumber = 100;
int widthNumber = 100;
boolean makeDark = false;
int sumOfDots = 0;


void draw()
{
  if (rollDice){
    sumOfDots = 0;
    for (int i = 0; i < widthNumber; i++){
      for (int j = 0; j < lengthNumber; j++){
        boolean makeDark = false;
        for (int z = 0; z < xCoordinates.length; z++){
          if ((xCoordinates[z] < j * (1000 / lengthNumber) + 5 && xCoordinates[z] > j * (1000 / lengthNumber) - 5) && (yCoordinates[z] < i * (1000 / widthNumber) + 5 && yCoordinates[z] > i * (1000 / widthNumber) - 5)){
            makeDark = true;
            break;
          }
        }   
        Die bob = new Die(j * (1000 / lengthNumber), i * (1000 / widthNumber),makeDark,10);
        bob.roll();
        sumOfDots += bob.dots;
        bob.show(); 
      }
    }
    fill(0);
    textSize(60);
    text("Number of Dots: " + sumOfDots, 150,950);
    fill(255);
    rollDice = false;
  } else {
    background(255);
    for (int i = 0; i < xCoordinates.length; i++){
      if (xCoordinates[i] != 0){
        point(xCoordinates[i], yCoordinates[i]);
      }
    }
  }
}

void mouseDragged() 
{
  strokeWeight(5);
  xCoordinates[position] = pmouseX;
  yCoordinates[position] = pmouseY;
  xCoordinates[position + 1] = mouseX;
  yCoordinates[position + 1] = mouseY;
  position += 2;
}

void mouseReleased(){
  redraw();
}


void keyPressed() {
  if (key == ENTER){
    xCoordinates = new int[100000];
    yCoordinates = new int[100000];
    position = 0;
    redraw();
  } else if(key=='r'){
    rollDice = true;
    redraw();
  }
}

class Die //models one single dice cube
{
    int myX;
    int myY;
    boolean dark;
    int dots;
    int sideLength;
    
    Die(int x, int y, boolean userDrawn, int _length) //constructor
    {
        myX = x;
        myY = y;
        dark = userDrawn;
        sideLength = _length;
    }
    void roll()
    {
        if (dark) {
          dots = (int)(Math.random() * 2) + 5;
        } else {
          dots = (int)(Math.random() * 3) + 1;
        }
    }
    void show()
    {
        strokeWeight(1);
        int ellipseDiameter  = sideLength / 6;
        rect(myX,myY, sideLength, sideLength);
        fill(0);
        if (dots == 1){
          ellipse(myX,myY, ellipseDiameter, ellipseDiameter);
        } else if(dots == 2){
          ellipse(myX - sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY - sideLength / 4, ellipseDiameter, ellipseDiameter);
        } else if (dots == 3){
          ellipse(myX - sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY - sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX,myY, ellipseDiameter, ellipseDiameter);
        } else if(dots == 4){
          ellipse(myX - sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY - sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX - sideLength / 4, myY - sideLength / 4,ellipseDiameter,ellipseDiameter);
        } else if (dots == 5){
          ellipse(myX - sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY - sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX - sideLength / 4, myY - sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX,myY, ellipseDiameter, ellipseDiameter);
        } else if (dots == 6){
          ellipse(myX - sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY - sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX + sideLength / 4, myY + sideLength / 4, ellipseDiameter, ellipseDiameter);
          ellipse(myX - sideLength / 4, myY - sideLength / 4, ellipseDiameter , ellipseDiameter);
          ellipse(myX + sideLength / 4, myY, ellipseDiameter, ellipseDiameter);
          ellipse(myX - sideLength / 4, myY, ellipseDiameter, ellipseDiameter);
        }
        
        fill(255);
    }
}
