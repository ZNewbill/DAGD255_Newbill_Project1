class Bullet extends RadialObject {
 
  float speed = 1000;
  
  Bullet(float x, float y) {
   position.x = x;
   position.y = y;
   radius = 10;
   
  }
  
  void update() {
    
    position.x -= speed * dt;
    position.y -= speed * dt; //multiplies speed by Delta Time
    
    if(position.y < -radius) isDead = true;
    super.update();
  }
  
  void draw() {
   fill(#A824F0);
   ellipse(position.x, position.y, radius * 2, radius * 2);
  }
  
}
