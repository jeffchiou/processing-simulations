float amplitude, period, frequency, fps;
float theta;
float x, y;
Bob b;


void setup() {
  
  size(1280,720);
  amplitude = 200; // px
  fps = 60;
  period = fps*2; // frames  
  frequency = TWO_PI/period;
  
  y = height/2;
  frameRate(fps);
  
  b = new Bob();
}

void draw() {
  
  background(255);
  fill(175);
  strokeWeight(2);
  x = width/2 + amplitude*sin(theta);
  ellipse(x,y,50,50);
  line(width/2,y,x,y);
  theta += frequency;
  
  b.render();
  
  frame.setTitle(int(frameRate) + " fps");
  
}
