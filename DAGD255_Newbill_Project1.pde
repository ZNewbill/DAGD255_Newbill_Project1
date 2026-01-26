// Copyright Zander Newbill 2026

float dt, prevTime = 0;
boolean leftPressed, pLeftPressed;

Player player;
ArrayList<Sword> swords = new ArrayList();

void setup() {
  size(1920,1080);
  player = new Player();
}

void draw() {
  calcDeltaTime();
  background(128);
  
  for(int i = 0; i < swords.size(); i++){
    Sword s =swords.get(i);
    s.update();
    if(s.isDead) swords.remove(s);
  }
  
  player.update();
  
  for(int i = 0; i < swords.size(); i++){
   Sword s = swords.get(i);
   s.draw();
  }
  
  player.draw();
  
  pLeftPressed = leftPressed;
}

void update() {
  
}

void mousePressed() {
 if(mouseButton == LEFT) leftPressed = true;
}

void mouseReleased() {
 if(mouseButton == LEFT)leftPressed = false;
}

void calcDeltaTime() {
 float currTime =millis();
 dt = (currTime - prevTime) / 1000.0;
 prevTime = currTime;
}
