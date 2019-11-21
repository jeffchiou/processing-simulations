class Bob {
  float amp, per, freq, theta, offset;
  PVector pos;
  Bob() {
    this(height/3,60,width/2,height/4);
  }
  Bob(float amplitude, float period, float x, float y) {
    pos = new PVector(x,y);
    amp = amplitude;
    per = period;
    freq = TWO_PI/per;
    offset = height/2;
    theta = 0;
  }
    
  void update() {
    pos.y = offset + amp*sin(theta);
    theta += freq;
  }
  void display() {
    float springWidth = map(pos.y,height,0,1,15);
    fill(160,180,210);
    strokeWeight(springWidth);
    line(pos.x,0,pos.x,pos.y);
    strokeWeight(2);
    ellipse(pos.x,pos.y,50,50);
    
  }
  void render() {
    update();
    display();      
  }
}
