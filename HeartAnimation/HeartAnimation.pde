Heart heart;
float amplitude, period, frequency, fps;
float theta;
float x, y;

void setup() {
  
  size(1280,720);
  background(255);
  
  amplitude = 200; // px
  fps = 60;
  period = fps*2; // frames  
  frequency = TWO_PI/period;
  
  y = height/2;
  frameRate(fps);
  
  heart = new Heart();
  
}
 
void draw() {
  background(255);
  
  heart.render();
  
  frame.setTitle("Heart Animation");
}
