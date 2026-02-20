class SwordPickup extends Pickup {
 
  SwordPickup(){
    position.x = width/2;
    position.y = height/2;
    radius = 25;
  }
  
  void update() {
    
  }
  void draw() {
        fill(#FA0ADA);
        ellipse(position.x, position.y, radius * 2, radius * 2);
    
    
  }
  
}
