int[] spades = new int[500];


void setup(){
  size(500,500);
  for (int i = 0; i < spades.length; i++) {
    spades[i] = (int)(Math.random() * 600);
  }
}

 
int position = 0; 
boolean heartDrawn = true; 
void draw(){
  position = 0;
  for (int y = 0; y <= 500; y += 25){
    for (int x = 0; x <= 500; x +=25) {
      heartDrawn = false;
      for (int n = 0; n < spades.length; n++){
        if (spades[n] == position) {
          scaleHeart(x, y);
          heartDrawn = true;
          break;
        }
      }
      if (heartDrawn == false) {
        scaleSpade(x,y);
      }
      position += 1;
    }
  } 
  
}

void mouseClicked(){
  for (int i = 0; i < spades.length; i++) {
    spades[i] = (int)(Math.random() * 600);
  }
}

void scaleHeart(int x, int y){
  stroke(0,0,0);
  fill(255,0,0, 150);
  beginShape();
  vertex(x, y); 
  bezierVertex(x, y+20, x + 40, y+10, x, y - 25); 
  endShape();
  beginShape();
  vertex(x, y); 
  bezierVertex(x, y+20, x - 40, y+10, x, y - 25); 
  endShape();
}

void scaleSpade(int x, int y){
  beginShape();
  stroke(255,0,0,150);
  strokeWeight(2);
  fill(0,0,0);
  vertex(x,y-7);
  vertex(x+9,y-18);
  vertex(x-9,y-18);
  vertex(x,y-7);
  endShape();
  vertex(x, y); 
  beginShape();
  vertex(x,y);
  bezierVertex(x, y-20, x + 45, y-10, x, y + 25); 
  endShape();
  beginShape();
  vertex(x, y); 
  bezierVertex(x, y-20, x - 45, y-10, x, y + 25); 
  endShape();
  
}
