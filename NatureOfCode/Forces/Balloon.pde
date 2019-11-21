class Balloon extends Mover {
  PVector lift, normalForce, wind;

  Balloon() {
    super();
    lift = new PVector(0,-0.1);
    diameter = 30;  
    normalForce = new PVector(0,0); 

  }
  void update() {
     if (location.y < 0+diameter/2 && velocity.y < -0.1) { 
      location.y = 0+diameter/2;      
      normalForce.y = -acceleration.y;
      velocity.y *= -0.4;
      applyForce(normalForce);
    } else if (location.y < 0+diameter/2 && velocity.y >= -0.1) {
      velocity.y = 0;
      location.y = 0+diameter/2;
      applyForce(PVector.mult(lift,-1));
    }
    applyForce(lift);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);    
    acceleration.mult(0);

  }
  
  void display() {
    stroke(0);
    fill(255,100,115);
    ellipse(location.x,location.y,diameter,diameter);
  }  
  
  void checkEdges() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    if (location.y > height) {
      location.y = 0;
    }
  }
  
  int signum(float f) {
    if (f > 0) return 1;
    if (f < 0) return -1;
    return 0;
  }
  
}
