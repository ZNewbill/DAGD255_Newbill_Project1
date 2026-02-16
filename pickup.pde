class Pickup extends RadialObject {
 

  
  Pickup(){
    position.x = width/2;
    position.y = height/2;
    radius = 25;
  }
  
  void update() {
    
  }
  void draw() {
        fill(#0AF2F0);
        ellipse(position.x, position.y, radius * 2, radius * 2);
    
    /*
    if(pickupType == 2) {
       fill(#F7A348);
       ellipse(position.x, position.y, radius * 2, radius * 2);
    }
    
    
     fill(#21EAE9);
      ellipse(position.x, position.y, radius * 2, radius * 2);
    */
    
  }
}
