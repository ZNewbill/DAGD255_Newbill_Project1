class Turret extends Enemy{
  
    
  float angleToPlayer;
  boolean isDead = false;
  
  Turret() {
    radius = random(45, 60);
    
    
    position.x = random(width);
    position.y = random(height);
  }
  
  void update() {
    calcAngleToPlayer();
    
    if(isDead == false) {
       Bullet b = new Bullet(position.x, position.y);
       bullets.add(b);
    }
    super.update();
  }
  
  void draw() {
    stroke(0);
    fill(#EA00F7);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void calcAngleToPlayer() {
    float dx = player.position.x - position.x;
    float dy = player.position.y - position.y;
    angleToPlayer = atan2(dy, dx);
  }
  
  
  
}
