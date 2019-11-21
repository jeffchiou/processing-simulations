class SimpleVecBall {
  PVector location;
  PVector velocity;
  boolean willRender;  
  
  SimpleVecBall() {
    location = new PVector(random(0,width),random(0,height));
    velocity = new PVector(random(2,7),random(2,7));
    willRender = true;
  }
  
  void render() {
    if (willRender) {
      // Move the ball according to its speed.
      location.x = location.x + velocity.x;
      location.y = location.y + velocity.y;
     
      // Check for bouncing.
      if ((location.x > width) || (location.x < 0)) {
        velocity.x = velocity.x * -1;
      }
      if ((location.y > height) || (location.y < 0)) {
        velocity.y = velocity.y * -1;
      }
     
      stroke(0);
      fill(155,255,155);
      // Display the ball at the location (x,y).
      ellipse(location.x,location.y,40,40);
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
