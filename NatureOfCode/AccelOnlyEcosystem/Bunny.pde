class Bunny extends Creature {
  
  int frameTracker; 
  float hopDuration; // hop duration in frames
  PVector accel;
  boolean startHopping;
  boolean isHopping;
  
  Bunny() {
    super();
    topSpeed = 100;
    hopDuration = 10;
  }
  
  void update() {
    float prob = random(1);
    if (prob < 0.02) {
      startHopping = true;
      isHopping = false;
    } else {
      startHopping = false;
    }
    if (startHopping && !isHopping) {      
      frameTracker = 0;
      isHopping = hopSequence(frameTracker);      
      frameTracker += 1;
    } else if (isHopping) {
      isHopping = hopSequence(frameTracker);
      frameTracker += 1;
    }
  }
  
  boolean hopSequence(int framesPassed) {
    // starts with acceleration at 0, then burst of acceleration, then equivalent burst of negative acceleration, until velocity is 0.
    if (framesPassed == 0) {      
      accel = chooseAcceleration();
      hopStart(accel);
    } else if (framesPassed == hopDuration) {
      velocity.mult(0);
      accel.mult(0);
      return false;
    } else if (framesPassed < hopDuration/2) {
      hopStart(accel);
    } else {
      hopEnd(accel);
    }
    return true;
  }
  
  PVector chooseAcceleration() {
    acceleration = PVector.random2D();   
    acceleration.mult(random(3,4));
    return acceleration;
  }
  
  void hopStart(PVector acceleration) {          
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topSpeed);      
  }
  
  void hopEnd(PVector acceleration) {
    acceleration.mult(-1);
    location.add(velocity);
    velocity.add(acceleration);
  }
  
  void display() {
    stroke(0);
    fill(250,200,200);
    ellipse(location.x,location.y,diameter,diameter);
  }
  
}
