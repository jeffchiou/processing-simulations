class Mover {
  
  PVector location, velocity, acceleration;
  float diameter, topSpeed, mass;
  boolean willRender;  
  
  Mover() {
    this(random(1,5),random(width),random(height));
  }
  
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    willRender = true;
    diameter = mass*10;
    topSpeed = 20;
    
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  PVector repel(Mover m) {
    float G = 1;
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
 
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    force.mult(-1);
    return force;
  }
  
  void update() {    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  void display() {
    stroke(0);
    fill(155,155,255,127);
    ellipse(location.x,location.y,diameter,diameter);
  }
  
  void checkEdges() {
    if (location.x > width - diameter/2) {
      velocity.x *= -1;
      location.x = width - diameter/2;      
    } else if (location.x < diameter/2) {
      velocity.x *= -1;
      location.x = diameter/2;
    }
 
    if (location.y > height - diameter/2) {
      velocity.y *= -1;
      location.y = height - diameter/2;      
    } else if (location.y < diameter/2) {
      velocity.y *= -1;
      location.y = diameter/2;
    }
  }
  
  void render() {
    if (willRender) {
      update();
      checkEdges();
      display();
    }
  }
  
  void toggleRender() {
    if (willRender == false) {
      willRender = true;
    } else {
      willRender = false;
    }
  }
  
}
