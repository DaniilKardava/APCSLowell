//your variable declarations here
Star[] starsArray = new Star[100];
Spaceship ship1 = new Spaceship(270,250);
Spaceship ship2 = new Spaceship(240,240);
Spaceship ship3 = new Spaceship(240,260);
Spaceship[] ships = {ship1, ship2, ship3};
ArrayList <Asteroid> asteroids = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();

// Breakout controls whether I try to show and move a bullet after collision
boolean breakOut = false;

public void setup() 
{
  background(0);
  size(500,500);
  for (int i =0; i < starsArray.length; i ++){
   starsArray[i] = new Star(); 
  }
  for (int i = 0; i < 8; i++){
   asteroids.add(new Asteroid()); 
  }
  
}

public void draw() 
{
  background(0);
  
  // Show stars
  for (int i =0; i < starsArray.length; i ++){
   starsArray[i].show(); 
  }
  for (int i = 0 ; i < 3; i++ ){
    ships[i].move();
    ships[i].show();
  }
  for ( int i = 0; i  < asteroids.size(); i++){
   asteroids.get(i).show(); 
   asteroids.get(i).move(); 
   // For each spaceship in the fleet, check for collision
   for ( int a = 0; a < 3; a++){
    if ((asteroids.get(i).getX() <= ships[a].getX() + 7 && asteroids.get(i).getX() >= ships[a].getX() - 7)&& (asteroids.get(i).getY() <= ships[a].getY() + 7 && asteroids.get(i).getY() >= ships[a].getY() - 7)){
     asteroids.remove(i); 
     break;
    }
   }
  }
  
  //Show bullets
  breakOut = false;
  for (int i = bullets.size() - 1; i >= 0; i-- ){
    // Check for asteroid collision
    for (int asteroid = asteroids.size() - 1; asteroid >= 0; asteroid --){
     if ((asteroids.get(asteroid).getX() <= bullets.get(i).getX() + 7 && asteroids.get(asteroid).getX() >= bullets.get(i).getX() - 7) && (asteroids.get(asteroid).getY() <= bullets.get(i).getY() + 7 && asteroids.get(asteroid).getY() >= bullets.get(i).getY() - 7)){
        asteroids.remove(asteroid);
        bullets.remove(i);
        breakOut = true;
     }
      
    }
    if (!breakOut){
    bullets.get(i).move();
    bullets.get(i).show();
  }
  }
}

public void keyPressed() {
 if (key == ' '){
   for (int ship = 0; ship < 3; ship++){
     bullets.add(new Bullet(ships[ship].getX(),ships[ship].getY(),ships[ship].getDirection(), ships[ship].getXSpeed(), ships[ship].getYSpeed()));
     bullets.get(bullets.size() - 1).accelerate(6);
   } 
   
 }
 if (key == 'h' || key == 'H'){
   ship1.hyperspace();
   ship2.setX(ship1.getX() -30);
   ship2.setY(ship1.getY() -10);
   ship2.setYSpeed(0);
   ship2.setXSpeed(0);
   ship2.setDirection(ship1.getDirection());
   ship3.setX(ship1.getX() -30);
   ship3.setY(ship1.getY() +10);
   ship3.setYSpeed(0);
   ship3.setXSpeed(0);
   ship3.setDirection(ship1.getDirection());
   
 }
 if (key == 'w' || key == 'W'){
   for (int i = 0 ; i < 3; i++ ){
    ships[i].accelerate(1);  
    } 
  
 }
 if (key == 'a' || key == 'A'){
  for (int i = 0 ; i < 3; i++ ){
    ships[i].turn(-10);  
    }  
 }
 if (key == 'd' || key == 'D'){
  for (int i = 0 ; i < 3; i++ ){
    ships[i].turn(10);  
    }  
 }
}
