class Seed {
  
  PVector location;
  float diameter;
  boolean willRender;
  
  Seed() {
    location = new PVector(width/2,height/2);
    diameter = 50.0;
    willRender = true;
  }
  
  void display() {
    noStroke();
    fill(255,255,255);
    ellipse(location.x,location.y,diameter,diameter);
  }  
  
  void render() {
    if (willRender) {
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