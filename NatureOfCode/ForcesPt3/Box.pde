class Box extends Mover {
  
  Box() {
    this(random(1,5),random(width),random(height));
  }
  
  Box(float m, float x, float y) {
    super(m,x,y);
    
  }
  void display() {
    stroke(0);
    fill(155,155,255,127);
    rect(location.x,location.y,diameter,diameter);
  }
  void drag(Liquid l) {
    float speed = velocity.mag();
    float rho = 1;
    // use mass in lieu of diameter (which is the side length for a box),
    // since mass works better on this arbitrary scale.
    float dragMagnitude = 0.5 * rho * speed * speed * mass * mass * l.c;
    
    PVector drag = velocity.get();
    drag.mult(-1);
    drag.normalize();
    drag.mult(dragMagnitude);
    applyForce(drag);
    
    // Prevent bouncing problem by simulating a timestep forward, 
    // and setting velocity to 0 if bouncing will occur.
    PVector simVel = PVector.add(velocity,acceleration);
    
    // dot product <= 0 means that the 2 vecs are orthogonal or obtuse
    // won't work in every situation, but works for this simulation.
    if (simVel.dot(velocity) <= 0) {
      
      // make it so that velocity will be 0 when acceleration is added.
      velocity = PVector.mult(acceleration,-1);
      
    }
    
  }
}
