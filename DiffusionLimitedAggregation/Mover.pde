class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float diameter;
  float topSpeed;
  float currentColor;
  boolean willRender;
  boolean active;
  
  Mover() {    
    int side = int(random(4));
    float radius = diameter/2.0;
    
    if (side == 1) { // top
      location = new PVector(random(width-diameter)+radius, radius);
    } else if (side == 2) { // bottom
      location = new PVector(random(width-diameter)+radius, height-radius);
    } else if (side == 3) { // left
      location = new PVector(radius, random(height-diameter)+radius);
    } else { // right
      location = new PVector(width+radius, random(height-diameter)+radius);  
    }

    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
    diameter = 12.0;
    willRender = true;
    topSpeed = 10;
    active = true;
    currentColor = 0;    
  }
  
  void activate() {
    active = true;
  }
  
  void freeze() {
    active = false;
  }
  
  void toggleActive() {
    if (active == false) {
      active = true;
    } else {
      active = false;
    }
  }
  
  void update() {
    if (active) {
      acceleration = PVector.random2D();
      acceleration.mult(random(2));
      location.add(velocity);
      velocity.add(acceleration);
      velocity.limit(topSpeed);
      if (currentColor < 255) {
        currentColor += 0.25;
      } else {
        currentColor = 0;
      }
    } else {
      acceleration.set(0,0);
      velocity.set(0,0);
    }
  }
  
  void display() {
    noStroke();
    fill(currentColor,255,255);
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