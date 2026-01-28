class MagneticEnemy extends Enemy {
  
  float angleToPlayer;
  
  MagneticEnemy() {
    radius = random(20, 40);
    speed = random(100, 200);
    
    position.x = random(width);
    position.y = -50;
  }
  
  void update() {
    calcAngleToPlayer();
    
    position.x += speed * cos(angleToPlayer) * dt;
    position.y += speed * sin(angleToPlayer) * dt;
    
  }
  
  void draw() {
    stroke(0);
    fill(255, 0, 0);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void calcAngleToPlayer() {
    float dx = player.position.x - position.x;
    float dy = player.position.y - position.y;
    angleToPlayer = atan2(dy, dx);
  }
  
}
