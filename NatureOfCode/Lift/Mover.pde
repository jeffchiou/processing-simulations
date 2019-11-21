class Mover {
  
  PVector location, velocity, acceleration;
  float wingSpan, topSpeed, mass, thickness;
  boolean willRender;  
  
  Mover() {
    this(random(1,5),0,height/2);
  }
  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
    willRender = true;
    wingSpan = mass*10;
    thickness = 5;
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
    ellipse(location.x,location.y,wingSpan,thickness);
  }
  
  void checkEdges() {
    if (location.x > width - wingSpan/2) {
      velocity.x *= -1;
      location.x = width - wingSpan/2;      
    } else if (location.x < wingSpan/2) {
      velocity.x *= -1;
      location.x = wingSpan/2;
    }
 
    if (location.y > height - thickness/2) {
      velocity.y *= -1;
      location.y = height - thickness/2;      
    }
  }
  
  boolean isInside(Air a) {
    if (location.x > a.x && location.x < a.x+a.w
      && location.y > a.y && location.y < a.y+a.h) {
        return true;
      } else {
        return false;
      }      
  }
  
  void drag(Air a) {
    float speed = velocity.mag();
    float dragMagnitude = a.c * speed * speed;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    
    applyForce(drag);
    
  }
  
  void lift(Air a) {
    float speed = velocity.x;
    float rho = 1;
    
    // use mass in lieu of wingspan (which is the side length for a box),
    // since mass works better on this arbitrary scale.
    float liftMagnitude = 0.5 * rho * speed * speed * mass * mass * a.cl;
    
    PVector lift = new PVector(0,-1);
    lift.mult(liftMagnitude);
    
    applyForce(lift);
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
