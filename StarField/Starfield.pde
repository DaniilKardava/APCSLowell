class Particle {
  int angle;
  double x;
  double y;
  double speed;
  
  Particle(){
    angle = (int)(Math.random() * 361);
    x = 500;
    y = 500;
    speed = Math.random() * 10 + .5;
  }
  
  void show(int red, int green, int blue) {
    fill(red, green, blue);
    ellipse((float)x,(float)y,25,25);
  }
  
  void move(){
    x += Math.cos(angle * 3.1415 / 180) * speed;
    y += Math.sin(angle * 3.1415 / 180) * speed;
  }
  
  void moveBack(){
    x -= Math.cos(angle * 3.1415 / 180) * speed * 30;
    y -= Math.sin(angle * 3.1415 / 180) * speed * 70;
  }
  
}


class Oddball extends Particle {
  
  Oddball(){
    super();
  }
  void move() {
    x += Math.random() * 2 - 1;
    y += Math.random() * 2 - 1;
    
  }
  
}


Particle[] bobs = new Particle[1000];
int frame = 0;
int flashNumber = 0;

void setup(){
  size(1000,1000);
  for (int i = 0 ; i < 100; i ++){
    bobs[i] = new Oddball(); 
  }
  for (int i = 100 ; i < bobs.length; i ++){
    bobs[i] = new Particle(); 
  }
}

void draw(){
  frame += 1;
  background(0);
  if (frame % 50 != 0 && flashNumber < 5){
    for (int i = 0; i < bobs.length; i ++){
       bobs[i].move();
       if (flashNumber == 0) {
         if (i < 100) {
           bobs[i].show(0,100,0);
         } else {
           bobs[i].show(255,255,255);
         }
       } else {
         if (i < 100) {
           bobs[i].show(0,100,0);
         } else {
           bobs[i].show(0,0,0);
         }
       }
    }
  } else if (flashNumber < 5){
    for (int i = 0; i < bobs.length; i ++){
       bobs[i].show(255,0,0);
    }
    flashNumber += 1;
  } else if (frame < 400){
    for (int i = 0; i < bobs.length; i ++){
       bobs[i].show(0,0,0);
    }
  } else {
    for (int i = 0; i < bobs.length; i ++){
       bobs[i].moveBack();
       bobs[i].show(0,0,255);
    }
    
  }
  
}
