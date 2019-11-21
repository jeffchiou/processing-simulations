class SimpleBall {
  float x;
  float y;
  float xspeed;
  float yspeed;
  boolean willRender;
  
  SimpleBall() {
    x = 100;
    y = 100;
    xspeed = random(4);
    yspeed = random(5);
    willRender = true;
  }
  
  void render() {
    if (willRender) {
      // Move the ball according to its speed.
      x = x + xspeed;
      y = y + yspeed;
     
      // Check for bouncing.
      if ((x > width) || (x < 0)) {
        xspeed = xspeed * -1;
      }
      if ((y > height) || (y < 0)) {
        yspeed = yspeed * -1;
      }
     
      stroke(0);
      fill(175);
      // Display the ball at the location (x,y).
      ellipse(x,y,40,40);
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
