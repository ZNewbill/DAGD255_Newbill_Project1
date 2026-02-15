class Turret extends Enemy{
  
    
  float angleToPlayer;
  boolean isDead = false;
  
  Turret() {
    radius = random(20, 40);
    
    
    position.x = random(width);
    position.y = -50;
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
    fill(255, 0, 0);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
  void calcAngleToPlayer() {
    float dx = player.position.x - position.x;
    float dy = player.position.y - position.y;
    angleToPlayer = atan2(dy, dx);
  }
  
  
  
}
