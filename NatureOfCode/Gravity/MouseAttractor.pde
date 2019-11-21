class MouseAttractor extends Attractor{

  MouseAttractor() {
    this(random(1,5));
  }
  
  MouseAttractor(float m) {
    location = new PVector(mouseX,mouseY);
    mass = m*10;
    G = 0.4;
    
  }
  
  void increaseForce() {
    G = 5;
  }
  
  void decreaseForce() {
    G = 0.4;
  }
    
  void update() {
    location.x = mouseX;
    location.y = mouseY;
  }
  
  void display() {
    stroke(0);
    fill(175,200);
    ellipse(location.x,location.y,5,5);
  }

  void render() {
      update();
      display();
  }
  
}
