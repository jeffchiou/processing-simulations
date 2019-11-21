class VecOps {
  PVector mousePos;
  PVector center;
  float multiplier;
  boolean normalize;
  
  VecOps() {
    mousePos  = new PVector(width/2,height/2);
    center = new PVector(width/2,height/2);
    multiplier = 1.0;
    normalize = false;
  }
   
  void render() {
    // Two PVectors, one for the mousePos location and one for the center of the window
    mousePos.x = mouseX;
    mousePos.y = mouseY;
    
    // PVector subtraction and multiplication
    mousePos.sub(center);
    mousePos.mult(multiplier);
    
    if (normalize) {
      mousePos.normalize();
      mousePos.mult(50);
    }
    
    float m = mousePos.mag();
    fill(0);
    rect(0,0,m,18);
    float maxMag = multiplier*sqrt(width*width + height*height)/2;
    noFill();
    rect(0,0,maxMag,18);
    text(m,maxMag+10,16);
    
    // Draw a line to represent the vector.
    translate(width/2,height/2);
    line(0,0,mousePos.x,mousePos.y);
  }
  
  void bigger() {
    multiplier *= 1.25;
  }
  
  void smaller() {
    multiplier *= 0.8;
  }
  
  void toggleNormalization() {
    if (normalize == false) {
      normalize = true;
    } else {
      normalize = false;
    }
  }
  
}
