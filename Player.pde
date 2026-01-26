class Player extends RadialObject {
  Player() {
    position.x = width/2;
    position.y = height/2;
    radius = 50;
    
  }
  
  void update() {
    
    
    if(leftPressed && !pLeftPressed) {
     Sword s = new Sword(position.x, position.y);
     swords.add(s);
    }
    
    position.x = mouseX;
    position.y = mouseY;

  }
  
  void draw() {
    fill(255,255,0);
    ellipse(position.x, position.y, radius*2, radius*2);
  
  }

}
