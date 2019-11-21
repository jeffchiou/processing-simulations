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
  
  void applyForceOriginal(PVector force) {
    PVector f = force.get();
    f.div(mass);
    acceleration.add(f);       
  }
  
  // Exercise 2.2 making applyForce static
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
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
