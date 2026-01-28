class RadialObject {
 
  PVector position = new PVector();
  float radius;
  boolean isDead = false;
  
 RadialObject() {
   
 }
 void update() {
   
 }
 
 boolean checkCollision(RadialObject other) {
    float dx = other.position.x - position.x;
    float dy = other.position.y - position.y;
    return sqrt(dx * dx + dy * dy) <= radius + other.radius;
  }
  
}
