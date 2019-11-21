float angle = 0;
float aVelocity = 0;
float aAcceleration = 0.001;
float multFactor = 1;

void setup() {
  size(1024,768);
}

void draw() {
  background(255);
  strokeWeight(4);
  fill(175);
  
  rectMode(CENTER);
  translate(width/2,height/2);
  rotate(angle);
  
  line(0,100,0,-100);
  ellipse(0,100,30,30);
  ellipse(0,-100,30,30);
  
  if (aVelocity > 0.1) {
    multFactor = -1;
  } else if (aVelocity < -0.1) {
    multFactor = 1;
  }
  aVelocity += multFactor*aAcceleration;
  angle += aVelocity;
  
}
