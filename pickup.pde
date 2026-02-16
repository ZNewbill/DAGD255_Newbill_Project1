class Pickup extends RadialObject {
 
  float pickupType = random(1,3);
  
  Pickup(){
    position.x = width/2;
    position.y = height/2;
    radius = 25;
  }
  
  void update() {
    
  }
  void draw() {
    if(pickupType == 1) {
        fill(#0AF2F0);
        ellipse(position.x, position.y, radius * 2, radius * 2);
    }
    
  }
}
