class Bullet extends RadialObject {
 
  float speed = 1000;
  
  Bullet(float x, float y) {
   this.x = x;
   this.y = y;
   radius = 4;
   
  }
  
  void update() {
    
    y -= speed * dt;
    
    if(y < -radius) isDead = true;
  }
  
  void draw() {
   fill(#A824F0);
   ellipse(x, y, radius * 2, radius * 2);
  }
  
}
