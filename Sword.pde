class Sword extends RadialObject {
  
  float rotationAngle = 0;
  float rotateSpeed = 360 * 4;
  
  float swordLength = 100;
  
  Sword(float xPos, float yPos) {
    position.x = xPos + swordLength * cos(radians(rotationAngle));
    position.y = yPos + swordLength * sin(radians(rotationAngle));
    radius = 25;
  }
  
  void update() {
    
    rotationAngle += rotateSpeed * dt;
    
    position.x = player.position.x + swordLength * cos(radians(rotationAngle));
    position.y = player.position.y + swordLength * sin(radians(rotationAngle));
    
    if(rotationAngle > 720) isDead = true;
    
  }
  
  void draw() {
    fill(0);
    ellipse(position.x, position.y, radius*2, radius*2);
  }
  
}
