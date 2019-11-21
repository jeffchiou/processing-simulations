import java.lang.Math;

class InvisForceMover extends Mover {

  PVector leftWall, rightWall, bottomWall;
  float lambda;
  
  InvisForceMover() {
    this(random(1, 5), random(width), random(height));
  }

  InvisForceMover(float m, float x, float y) {
    super(m, x, y);
    leftWall = new PVector(0, 0);
    rightWall = new PVector(0, 0);
    bottomWall = new PVector(0, 0);
    lambda = 1; 
  }

  float scaledExpPDF(float scale, float x) {
    // scaled exponential distribution PDF
    return scale*lambda*exp(-lambda*x);
  }
  void updateWalls() {
    leftWall.x = scaledExpPDF(3,location.x);
    rightWall.x = -1*scaledExpPDF(3,width-location.x);    
    bottomWall.y = -1*scaledExpPDF(3,height-location.y);

    applyForce(leftWall);
    applyForce(rightWall);
    applyForce(bottomWall);
  }

  void update() {
    updateWalls();
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(155, 255, 155, 127);
    ellipse(location.x, location.y, diameter, diameter);
  }

  void checkEdges() {
  }
}

