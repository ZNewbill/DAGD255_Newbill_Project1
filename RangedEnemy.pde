class RangedEnemy extends Enemy {
 
   float angleToPlayer;
   boolean isDead = false;
  
  RangedEnemy() {
    radius = random(20, 40);
    speed = random(100, 200);

    position.x = random(width);
    position.y = random(height);
  }
  
  void update() {
    calcAngleToPlayer();
    
    position.x += speed * cos(angleToPlayer) * dt;
    position.y += speed * sin(angleToPlayer) * dt;
    super.update();
    
    if(isDead == false) {
     calcAngleToPlayer();
     Bullet b = new Bullet(position.x, position.y);
     bullets.add(b);
    }
  }
  
  void draw() {
    stroke(0);
    fill(#05FF03);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void calcAngleToPlayer() {
    float dx = player.position.x - position.x;
    float dy = player.position.y - position.y;
    angleToPlayer = atan2(dy, dx);
  }
  
  
}
