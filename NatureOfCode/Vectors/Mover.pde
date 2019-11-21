class Mover {
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float diameter;
  float topSpeed;
  boolean willRender;
  
  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(-0.001,0.01);
    diameter = 30.0;
    willRender = true;
    topSpeed = 10;
  }
  
  void update() {
    acceleration = PVector.random2D();
    acceleration.mult(random(2));
    location.add(velocity);
    velocity.add(acceleration);
    velocity.limit(topSpeed);
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
