// Copyright Zander Newbill 2026

float dt, prevTime = 0;
boolean leftPressed, pLeftPressed;
boolean rightPressed, pRightPressed;

Player player;
ArrayList<Sword> swords = new ArrayList();
ArrayList<Enemy> enemies = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();

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
    enemies.add(e);
    magEnemySpawnDelay = random(0.5, 1.5);
  }
  
  
  // Update objects under this line...
  
  for(int i = 0; i < swords.size(); i++) {
    Sword s = swords.get(i);
    s.update();
    if(s.isDead) swords.remove(s);
  }
  
  for(int i = 0; i < enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.update();
    
    if(e.checkCollision(player)) {
      player.radius--;
    }
    
    for(int j = 0; j < bullets.size(); j++) {
     Bullet b = bullets.get(j);
     
     if (b.checkCollision(e)) {
       b.isDead = true;
       e.isDead = true;
       
     }
    }
    
    if(e.isDead) enemies.remove(e);
  }
    for(int i = 0; i < bullets.size(); i++) {
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

void calcDeltaTime() {
  float currTime = millis();
  dt = (currTime - prevTime) / 1000.0;
  prevTime = currTime;
}
