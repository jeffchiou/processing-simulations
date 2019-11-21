class Heart {

  PVector pos, velocity, acceleration;
  float amp, per, freq, theta, offset;
  float wd, ht;
  boolean willRender;
  
  Heart() {
    this(width/2,height/2,height/15,60, 450, 400);
  }
  
  Heart(float x, float y, float amplitude, float period, float width, float height) {
    pos = new PVector(x,y);
    amp = amplitude;
    per = period;
    freq = TWO_PI/per;
    offset = height/2;
    theta = 0;
    willRender = true;
    wd = width;
    ht = height;
  }

  void update() {
    ht = offset + amp*sin(theta);
    wd = offset + amp*sin(theta);
    theta += freq;
  }

  void display() {

    stroke(0);
    fill(255,75,75);
    
    beginShape();
    vertex(pos.x, pos.y+ht/2); //control point
    bezierVertex(pos.x+wd*0.93, pos.y-ht*0.3, pos.x+wd/3, pos.y-ht*0.8, pos.x, pos.y-ht*0.3);
    endShape();
    
    beginShape();
    vertex(pos.x, pos.y+ht/2); //control point
    bezierVertex(pos.x-wd*0.93, pos.y-ht*0.3, pos.x-wd/3, pos.y-ht*0.8, pos.x, pos.y-ht*0.3);
    endShape();
    
  }
  
  void render() {
    if (willRender) {
      update();
      display();
    }
  }
  
  void toggleRender() {
    if (willRender == false) {
      willRender = true;
    } else {
      willRender = false;
    }
  }
}

