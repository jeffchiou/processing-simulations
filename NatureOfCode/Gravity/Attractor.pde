class Attractor {
  float mass;
  PVector location;
  float G;
  
  Attractor() {
    this(random(1,5),random(width),random(height));
  }
  
  Attractor(float m, float x, float y) {
    location = new PVector(x,y);
    mass = m*10;
    G = 0.4;
    
  }

  void display() {
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,mass*2,mass*2);
  }
  
  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    
    return force;
  }
  
}
