class Oscillator {
  
  PVector angle, vel, amp, offset, acc;
  
  Oscillator() {
    this(width/2, height/2, random(-0.05,0.05),random(-0.05,0.05),random(width/2),random(height/2));
  }
  
  Oscillator(float x, float y, float xVel, float yVel, float xAmp, float yAmp) {
    angle = new PVector();
    vel = new PVector(xVel,yVel);
    amp = new PVector(xAmp,yAmp);
    offset = new PVector(x,y);
    acc = new PVector(0,0);
  }
  
  void oscillate() {
    vel.add(acc);
    angle.add(vel);
  }
  
  void display() {
    float x = offset.x + sin(angle.x)*amp.x;
    float y = offset.y + sin(angle.y)*amp.y;
   
    stroke(0);
    fill(175);
    line(width/2,height/2,x,y);
    ellipse(x,y,16,16);
  }
  
  void update() {
    oscillate();
  }
  
  void render() {
    update();
    display();
  }
}
