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
ArrayList<Turret> turrets = new ArrayList();
ArrayList<Particle> particles = new ArrayList();
ArrayList<RangedEnemy> rangedEnemies = new ArrayList();
ArrayList<Pickup> pickups = new ArrayList();
ArrayList<SwordPickup> swordPickups = new ArrayList();

float magEnemySpawnDelay = 1;
float turretSpawnDelay = 1;
float rangeSpawnDelay = 1;
float pickupSpawnDelay = 5;
float swordPickupSpawnDelay = 10;
//float enemyMoveDelay = 0;
float damageDelay = 0; //delays the enemy from damaging the player for x amount of time

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
  
  turretSpawnDelay -= dt;
  if(turretSpawnDelay <= 0) {
    Turret t = new Turret();
    turrets.add(t);
    turretSpawnDelay = random(1.0, 5.0);
  }
  
  rangeSpawnDelay -= dt;
  if(rangeSpawnDelay <= 0) {
    RangedEnemy r = new RangedEnemy();
    rangedEnemies.add(r);
    rangeSpawnDelay = random(1.0, 2.5);
  }
  
  pickupSpawnDelay -= dt;
  if(pickupSpawnDelay <= 0) {
     Pickup x = new Pickup();
     pickups.add(x);
     pickupSpawnDelay = random(1.5, 5.0);
  }
  swordPickupSpawnDelay -= dt;
  if(swordPickupSpawnDelay <= 0) {
     SwordPickup y = new SwordPickup();
     swordPickups.add(y);
     swordPickupSpawnDelay = random(1.5, 5.0);
  }
  
  damageDelay -= dt;
  if(damageDelay > 0) {
     player.radius -= 0;
     damageDelay--;
    }
    
  
  
  
  // Update objects under this line...
  
  for(int i = 0; i < swords.size(); i++) {
    Sword s = swords.get(i);
    s.update();
    if(s.isDead) swords.remove(s);
  }
 
  
  for(int i = 0; i < magneticEnemies.size(); i++) {
    MagneticEnemy e = magneticEnemies.get(i);
    
    
    if(e.checkCollision(player) && damageDelay <= 0) {
      player.radius-= 5;
      damageDelay = 50;
      if(player.radius < 10){
        player.isDead = true;
        if(player.isDead){
          
        }
      }
    }
    
    for(int o = 0; o < bullets.size(); o++) {
       Bullet b = bullets.get(o);
     
     if (e.checkCollision(b)) {
       b.isDead = true;
       e.isDead = true;
       }
    }
    
    for(int j = 0; j < swords.size(); j++) {
      Sword s = swords.get(j);
      
      if(e.checkCollision(s)) {
       e.isDead = true;
      }
    }
    e.update();
    if(e.isDead) magneticEnemies.remove(e);
  }
  
   for(int i = 0; i < turrets.size(); i++){
   Turret t = turrets.get(i);
       
    for(int j = 0; j < swords.size(); j++){
      Sword s = swords.get(j);
      
      if(t.checkCollision(player)){
       player.radius -= 10;
       damageDelay = 50;
      }
         
       if(t.checkCollision(s)){
        t.isDead = true;
        if(t.isDead) turrets.remove(t);
       }
   
    }
    for(int o = 0; o < bullets.size(); o++) {
       Bullet b = bullets.get(o);
       
         if(t.checkCollision(b)){
          t.isDead = true;
          b.isDead = true;
          t.isDead = true;
        if(t.isDead) turrets.remove(t);
         }
    }
   
  }
  
  for(int i = 0; i < rangedEnemies.size(); i++){
   RangedEnemy r = rangedEnemies.get(i);
       
    for(int j = 0; j < swords.size(); j++){
      Sword s = swords.get(j);
         
       if(r.checkCollision(s)){
        r.isDead = true;
        if(r.isDead) rangedEnemies.remove(r);
       }
   
    }
    for(int o = 0; o < bullets.size(); o++) {
       Bullet b = bullets.get(o);
       
         if(r.checkCollision(b)){
          r.isDead = true;
          b.isDead = true;
           r.isDead = true;
        if(r.isDead) rangedEnemies.remove(r);
         }
    }
   
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
  
  
  for(int i = 0; i < pickups.size(); i++) {
     Pickup x = pickups.get(i);
     x.update();
       if(x.checkCollision(player)){
        x.isDead = true;
        player.weaponType = 2;
        player.radius += 10;
          if(x.isDead) {
           pickups.remove(x); 
          }
       }
  }
  
  for(int i = 0; i < swordPickups.size(); i++) {
     SwordPickup y = swordPickups.get(i);
     y.update();
       if(y.checkCollision(player)){
        y.isDead = true;
        player.weaponType = 1;
        player.radius += 10;
          if(y.isDead) {
           swordPickups.remove(y); 
          }
       }
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
  
  for(int i = 0; i < turrets.size(); i++) {
     Turret t = turrets.get(i);
     t.draw();
  }
  
  for(int i = 0; i < rangedEnemies.size(); i++) {
     RangedEnemy r = rangedEnemies.get(i);
     r.draw();
  }
  
  for(int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.draw();
  }
  
  for(int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i);
    b.draw();
  }
  
  
  for(int i = 0; i < pickups.size(); i++) {
   Pickup x = pickups.get(i);
   x.draw();
  }
  
  for(int i = 0; i < swordPickups.size(); i++) {
   SwordPickup y = swordPickups.get(i);
   y.draw();
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
