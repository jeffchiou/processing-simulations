Mover[] movers = new Mover[1];

 
Air air;
 
void setup() {
  size(1024, 768);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }

  air = new Air(0, 0, width, height, 0.1, 0.08);
}
 
void draw() {
  background(255);
 
  air.display();
 
  for (int i = 0; i < movers.length; i++) {
 
    if (movers[i].isInside(air)) {
      movers[i].drag(air);
      movers[i].lift(air);
    }
 
    float m = 0.1*movers[i].mass;
    float t = 0.1*movers[i].mass;
    PVector gravity = new PVector(0, m);
    PVector thrust = new PVector(t, 0);
    movers[i].applyForce(thrust);
    movers[i].applyForce(gravity);    
    
    movers[i].render();
  }
  
}
