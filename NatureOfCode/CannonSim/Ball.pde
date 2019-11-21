class Ball {
  int tailLength = 1;
  PVector[] oldLocations = new PVector[tailLength];
  PVector location, velocity, acceleration, cannon;
  float diameter, topSpeed, mass, angle, aVel;
  boolean willRender;
  
  Ball() {
    this(random(1,5),random(width),random(height));
  }
  
  Ball(float m, float x, float y) {
    willRender = true;
    cannon = new PVector(x,y);
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);    
    
    mass = m;
    diameter = mass*10;
    topSpeed = 30;
    angle = 0;
    aVel = 0;
    
    for (int i = 0; i < oldLocations.length; i++) {
      oldLocations[i] = cannon.get();
    }
    

  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void reset() {
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    for (int i = 0; i < oldLocations.length; i++) {
      oldLocations[i] = cannon.get();      
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

  void update() {    
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);    
    
    aVel = velocity.x/40.0;
    aVel = constrain(aVel,-0.3,0.3);
    angle += aVel;
    
    acceleration.mult(0); 
    
    // move old locations to back, add most recent location
    oldLocations[0] = location.get();
    for (int i = oldLocations.length-1; i > 0; i--) {
      oldLocations[i] = oldLocations[i-1].get();
    }
  }
  
  void display() {
    stroke(0);
    fill(0,150);
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle); 
    fill(255,100,100);
    arc(0,0,diameter,diameter,angle,angle+HALF_PI);
    fill(100,255,100);
    arc(0,0,diameter,diameter,angle+HALF_PI,angle+PI);
    fill(255);
    arc(0,0,diameter,diameter,angle+PI,angle+PI*1.5);
    fill(100,100,255);
    arc(0,0,diameter,diameter,angle+PI*1.5,angle+TWO_PI);
    popMatrix();

    for (int i = 0; i < oldLocations.length-1; i++) {
      line( oldLocations[i].x, oldLocations[i].y, oldLocations[i+1].x, oldLocations[i+1].y );
    }
    
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
