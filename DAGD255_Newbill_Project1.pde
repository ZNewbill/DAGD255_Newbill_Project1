// Copyright Zander Newbill 2026
// git commits vandalized by rylynn

float dt, prevTime = 0; //required to setup Delta Time function
boolean leftPressed, pLeftPressed; //required for left mouse button functionality
boolean rightPressed, pRightPressed; //required for right moue button functionality

Player player;
ArrayList<Sword> swords = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();
ArrayList<MagneticEnemy> magneticEnemies = new ArrayList();

ArrayList<Particle> particles = new ArrayList();

float magEnemySpawnDelay = 1;

void setup() {
  size(1280, 720);
  player = new Player();
}

void draw() {
  // Calculate Delta Time before anything else...
  calcDeltaTime();
  background(128);
  
  
  // Spawn objects under this line...
  
  magEnemySpawnDelay -= dt;
  if(magEnemySpawnDelay <= 0) {
    MagneticEnemy e = new MagneticEnemy();
    magneticEnemies.add(e);
    magEnemySpawnDelay = random(0.5, 1.5);
  } // This function converts the Enemy Spawn timer to Delta Time.
  
  
  // Update objects under this line...
  
  for(int i = 0; i < swords.size(); i++) {
    Sword s = swords.get(i);
    s.update();
    if(s.isDead) swords.remove(s);
  }
 
  
  for(int i = 0; i <= magneticEnemies.size()-1; i++) {
    MagneticEnemy e = magneticEnemies.get(i);
    
    
    if(e.checkCollision(player)) {
      player.radius--;
      if(player.radius < 10){
        player.isDead = true;
        if(player.isDead){
          
        }
      }
    }
    
    for(int o = 0; o <= bullets.size()-1; o++) {
       Bullet b = bullets.get(o);
     
     if (e.checkCollision(b)) {
       b.isDead = true;
       e.isDead = true;
       println("hit");
       }
    }
    
    for(int j = 0; j <= swords.size()-1; j++) {
      Sword s = swords.get(j);
      
      if(e.checkCollision(s)) {
       s.isDead = true;
       e.isDead = true;
      }
    }
    e.update();
    if(e.isDead) magneticEnemies.remove(e);
  }
  
  
  
    for(int i = 0; i <= bullets.size()-1; i++) {
     Bullet b = bullets.get(i);
     b.update();
     
     
     if(b.isDead) bullets.remove(b);
    }
  
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update();
    if(p.isDead) particles.remove(p);
  }
  
  player.update();
  
  
  // Draw objects under this line...
  
  for(int i = 0; i < swords.size(); i++) {
    Sword s = swords.get(i);
    s.draw();
  }
  
  for(int i = 0; i < enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.draw();
  }
  
  for(int i = 0; i < magneticEnemies.size(); i++) {
    MagneticEnemy e = magneticEnemies.get(i);
    e.draw();
  }
  
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.draw();
  }
  
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.draw();
  }
  
  player.draw();
  
  
  // Draw HUD under this line...
  
  
  
  // Prepare for next frame under this line...
  
  pLeftPressed = leftPressed;
  pRightPressed = rightPressed;
}

void mousePressed() {
  if(mouseButton == LEFT) leftPressed = true;
  if(mouseButton == RIGHT) rightPressed = true;
}

void mouseReleased() {
  if(mouseButton == LEFT) leftPressed = false;
  if(mouseButton == RIGHT) rightPressed = false;
}

void calcDeltaTime() { // Delta Time function
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}
