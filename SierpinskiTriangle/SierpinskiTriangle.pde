int untilLength = 5;
HashMap<String, Integer> triangles = new HashMap<String, Integer>();


float probability = .5;
void sierpinski(float x, float y, float len) {
  if (len < untilLength) {
    triangle(x,y,x+len,y,x+len/2,y- (float)(len/2 * Math.sqrt(3)));
    triangles.put(nf(x, 4, 2) + nf(y, 4, 2),1);
  } else {
    if (Math.random() < probability) {
      sierpinski(x,y,len/2);
    }
    if (Math.random() < probability) {
    sierpinski(x + len/2,y,len/2);
    }
    if (Math.random() < probability) {
    sierpinski(x + len/4 ,y - (float)(Math.sqrt(3) / 4 * len),len/2);
    }
  }
}

long previousTime = millis();
int frame_count = 0;
int secondsPassed = 0;

void setup() {
  size(1000,1000);
  background(0,0,0);
  frameRate(30);
}

int triLength = 900;
int iterations = (int)(log(triLength/untilLength) / log(2) + 1);
float totalTriangles = pow(3,iterations);

// Calculate expected runs to fill 99% of grid.
float expectedRuns; 

void draw() {
  sierpinski(50,900,triLength); 
  
  // measure actual frame rate
  frame_count += 1;
  if (millis() - previousTime > 1000) {
    frameRate = frame_count;
    frame_count = 0;
    previousTime = millis();
    secondsPassed += 1;
  }
  
  fill(0);
  rect(0, 0, 250, 40);
  fill(255);
  textSize(20);
  text("FPS: " + (int)frameRate, 10, 20);
  textSize(15);
  text("Sierpinski Probability: " + probability, 10, 40);
  text("w/s to change probability",10,60);
  text("r to change reset",10,80);
  
  textSize(20);
  fill(0);
  rect(250, 0, 400, 60);
  fill(255);
  text("Expecting " + totalTriangles + " triangles.", 250, 20);
  text("Triangles Drawn: " + triangles.size(), 250, 40);
  text("Percent Filled: " + triangles.size() / totalTriangles, 250, 60);
  
  // Deduct number of expected runs for current ratio from expected runs for target ratio of 99%.
  expectedRuns = log(.01) / log(1 - pow(probability,iterations)) - log(1 - triangles.size() / totalTriangles) / log(1 - pow(probability,iterations));
  int timeRemaining = (int)(expectedRuns / 30);
  if (timeRemaining < 0) {
    timeRemaining = 0;
  }
  fill(0);
  rect(600, 0, 700, 20);
  fill(255);
  text("At 30 FPS, Expect 99% fill in: " + timeRemaining + " seconds", 600, 20);
}

void keyPressed(){
  if (key == 'r' || key == 'R') {
      background(0);
      triangles = new HashMap<String, Integer>();
      secondsPassed = 0;
  }
  if (key == 'w' || key == 'W') {
      if (probability < .95) {
        probability += .05;
        probability = (float)(int)(probability * 100) /100;
      
      }
  } 
  if (key == 's' || key == 'S') {
    if (probability > .05){
      
      probability -= .05;
      probability = (float)(int)(probability * 100) /100;
      
    }
  }
  
}
