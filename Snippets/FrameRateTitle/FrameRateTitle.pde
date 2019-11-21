float x, y, radius;
 
void setup() {
  size(500, 500);
  background(255);
  smooth();
  frameRate(200);
}
 
void draw() {
  x = random(width);
  y = random(height);
  radius = random(200);
  fill(random(255));
  ellipse(x, y, radius, radius);
  frame.setTitle(int(frameRate) + " fps");
}
