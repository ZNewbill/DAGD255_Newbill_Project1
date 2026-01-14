// Copyright Zander Newbill 2026
Player player;

void setup() {
  size(1920,1080);
  player = new Player();
}

void draw() {
  background(128);
  
  player.update();
  player.draw();
}

void update() {
  
}
