
// This implementation allows for a spiral with equidistant points
float radius = 10;
float theta = 0;
float step = 5;
float chord = 3;

void setup() {
  size(640,360);
  background(255);
}
 
void draw() {
 
  float x = radius * cos(theta);
  float y = radius * sin(theta); 
  noStroke();
  fill(0);
  ellipse(x+width/2, y+height/2, 16, 16);  
  
  // for increased accuracy, use Heun's method
  float nextTheta = chord/radius;
  float nextRadius = radius+step*nextTheta;
  float avgRadius = (radius+nextRadius)/2;
  radius = nextRadius; 
  theta += chord/avgRadius;

}


