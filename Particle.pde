class Particle {
  
  float x, y;
  float speed;
  float moveAngle;
  float lifetime;
  float alpha;
  float radius;
  boolean isDead = false;
  float frictionFactor = 1;
  
  Particle() {    
  }
  
  void update() {   
  }
  
  void draw() {    
  }  
}

class PlayerParticle extends Particle {
  PlayerParticle(float xPos, float yPos) {
    x = xPos;
    y = yPos;
    radius = random(6, 12);
    speed = random(300, 400);
    moveAngle = radians(random(360));
    lifetime = random(1, 2);
    alpha = random(128, 255);
    frictionFactor = random(0.91, 0.93);
  }
  
  void update() {
    
    x += speed * cos(moveAngle) * dt;
    y += speed * sin(moveAngle) * dt;
    
    speed *= frictionFactor;
    
    lifetime -= dt;
    alpha -= 255 * dt;
    radius -= 6 * dt;
    
    if(lifetime <= 0 || alpha <= 0) isDead = true;
  }
  
  void draw() {
    noStroke();
    fill(#FF8D12, alpha);
    ellipse(x, y, radius*2, radius*2);
  }
}
