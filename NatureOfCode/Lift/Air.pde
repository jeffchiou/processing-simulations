class Air {
  float x,y,w,h;
  float c, cl;  
  // cl = coefficient of lift
  
  Air(float x_, float y_, float w_, float h_, float c_, float cl_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    cl = cl_;
  }
  void display() {
    noStroke();
    fill(175);
    rect(x,y,w,h);
  }
}
