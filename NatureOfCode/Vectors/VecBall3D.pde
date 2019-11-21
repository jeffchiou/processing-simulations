class VecBall3D {
  PVector location;
  PVector velocity;
  int zLow = 0;
  int zHigh = 200;
  float diameter;
  boolean willRender;
  
  VecBall3D() {
    location = new PVector(random(0,width),random(0,height),random(zLow,zHigh));
    velocity = new PVector(random(2,7),random(2,7),random(1,5));
    willRender = true;
  }
  
  void render() {
    if (willRender) {
      // Move the ball according to its speed.
      location.add(velocity);
      
      // Check for bouncing.
      if ((location.x > width) || (location.x < 0)) {
        velocity.x = velocity.x * -1;
      }
      if ((location.y > height) || (location.y < 0)) {
        velocity.y = velocity.y * -1;
      }
      if ((location.z > zHigh) || (location.z < zLow)) {
        velocity.z = velocity.z * -1;
      }
     
      stroke(0);
      fill(155,155,255);
      // Display the ball at the location (x,y).
      diameter = map(location.z,zLow,zHigh,10,100);
      ellipse(location.x,location.y,diameter,diameter);
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
