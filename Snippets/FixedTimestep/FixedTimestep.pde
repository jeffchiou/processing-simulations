float t = 0.0;
float dt = 0.01;

float currentTime = millis();
float accumulator = 0.0;
float x, y, radius;

void setup() {
  size(1024,768);
  background(255);
}

void draw() {
  float newTime = millis();
  float frameTime = newTime - currentTime;
  if ( frameTime > 250) {
    frameTime = 250;
  }
  accumulator += frameTime;
  while (accumulator >= dt) {
    previousState = currentState;
    integrate( currentState, t, dt);
    t += dt;
    accumulator -= dt;    
  }
  float alpha = accumulator / dt;
  
  renderState();
  
  x = random(width);
  y = random(height);
  radius = random(200);
  fill(random(255));
  ellipse(x, y, radius, radius);
  frame.setTitle("Fixed Timestep " + int(frameRate) + " fps");
}
