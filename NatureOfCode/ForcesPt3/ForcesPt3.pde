Mover[] movers = new Mover[1];
Box[] boxes = new Box[10];
 
Liquid liquid;
 
void setup() {
  size(1024, 768);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  for (int i = 0; i < boxes.length; i++) {
    boxes[i] = new Box(random(0.1,5),random(0,width-50),random(0,50));
  }
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}
 
void draw() {
  background(255);
 
  liquid.display();
 
  for (int i = 0; i < movers.length; i++) {
 
    if (movers[i].isInside(liquid)) {
      movers[i].drag(liquid);
    }
 
    float m = 0.1*movers[i].mass;

    PVector gravity = new PVector(0, m);
    movers[i].applyForce(gravity);
 
    movers[i].render();
  }
  
  for (int i = 0; i < boxes.length; i++) {
 
    if (boxes[i].isInside(liquid)) {
      boxes[i].drag(liquid);
    }
 
    float m = 0.1*boxes[i].mass;

    PVector gravity = new PVector(0, m);
    boxes[i].applyForce(gravity);
 
    boxes[i].render();
  }
}
