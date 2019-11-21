class MouseMover extends Mover{
  // Exercise 1.8 - variable acceleration depending on distance.
  MouseMover() {
    super();
  }
  
  void update() {
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location);
    float multiplier = dir.mag();
    multiplier = map(multiplier,0,1280,0,5);
    dir.normalize();
    dir.mult(multiplier);
    acceleration = dir;
    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
  }
  
  void display() {
    stroke(0);
    fill(100,250,200);
    ellipse(location.x,location.y,diameter,diameter);
  }

}
