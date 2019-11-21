class MassMover {
  
  PVector location, velocity, acceleration;
  float diameter, topSpeed, mass;
  boolean willRender;  
  
  MassMover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
    willRender = true;
    topSpeed = 10;
    mass = 10.0;
  }
  
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(mass);
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
    fill(255,155,155);
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
    } else if (location.y < 0) {
      location.y = height;
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
