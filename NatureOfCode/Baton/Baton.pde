float angle;
void setup() {
  size(1024,768);
  angle = 0;
}
void draw() {
  background(255);
  strokeWeight(4);
  fill(160);
  
  angle = angle+2;
  pushMatrix();
  float rads = radians(angle);
  translate(width/2, height/2);
  rotate(rads);
  
  line(0,100,0,-100);
  ellipse(0,100,30,30);
  ellipse(0,-100,30,30);
  popMatrix();
}
