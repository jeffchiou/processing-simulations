class FrictionPocket {
  float mu;
  float x,y,w,h;
  boolean willRender;  
  
  // Constructors
  FrictionPocket() {
    this(0.03);  
  }
  FrictionPocket(float mu) {
    this(mu,width/3,height/3,width/3,height/3);
  }
  FrictionPocket(float x, float y, float w, float h) {
    this(0.03,x,y,w,h);
  }
  FrictionPocket(float mu, float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.mu = mu;
    willRender = true;
  }
  
  PVector returnForce(PVector velocity) {
    PVector friction = velocity.get();
    friction.mult(-1);
    friction.normalize();
    friction.mult(mu);
    return friction;
  }
  
  boolean checkEdges(float checkX, float checkY) {
    if (checkX > x && checkX < x+w
      && checkY > y && checkY < y+h) {
        return true;
    }
    return false;
  }
  
  void render() {
    if (willRender) {
      fill(230);
      rect(x,y,w,h);
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
