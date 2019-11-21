Mover mover;
Balloon balloon;
float tx, ty;
        
void setup() {
  size(1024,768);
  mover = new Mover();
  balloon = new Balloon();
  tx = 0;
  ty = 100000;
}
void draw() {
  background(255);
  if (mousePressed) {        
      PVector wind = new PVector(noise(tx)/2,noise(ty)/2);
      mover.applyForce(wind);
      balloon.applyForce(wind);
      tx += 1;
      ty += 1;
  }
  balloon.render();
  mover.render();
}
