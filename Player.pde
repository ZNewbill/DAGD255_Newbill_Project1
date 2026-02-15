class Player extends RadialObject {
  
  float easingFactor = 10;
  int weaponType = 1;
  
  Player() {
    position.x = width/2;
    position.y = height/2;
    radius = 50;
    
  }
  
  void update() {
    
    
    
     if(weaponType == 1 && leftPressed && !pLeftPressed){
       Sword s = new Sword(position.x, position.y);
     swords.add(s);
     }
    
    if(weaponType == 2 && leftPressed && !pLeftPressed) {
       Bullet b = new Bullet(position.x, position.y);
       bullets.add(b);
    }
    
    float dx = mouseX - position.x;
    float dy = mouseY - position.y;
    
    position.x += dx * easingFactor * dt;
    position.y += dy * easingFactor * dt;
    
    PlayerParticle p = new PlayerParticle(position.x, position.y);
    particles.add(p);
  }
  
  void draw() {
    fill(255,255,0);
    ellipse(position.x, position.y, radius*2, radius*2);
  
  }

}



//This will be wherever you spawn a bullet, most likely in the Player class's update tab

//if(leftPressed && !pLeftPressed) {
  
//  for (int i = 0; i < 2; i++){
//    Bullet b = new Bullets(x, y, radians(45) * i);
//    bullets.add(b);
//  }
  
//}
