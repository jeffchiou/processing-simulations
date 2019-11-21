class LevyWalker{
  float xOld;
  float yOld;
  float x;
  float y;
  int[] rgbColor;
  
  LevyWalker() {
    this(width/2, height/2, new int[] {0,150,150});
  }
  LevyWalker(float startX, float startY) {
    this(startX, startY, new int[] {0,150,150});
  }  
  LevyWalker(float startX, float startY, int[] strokeColor) {
    x = startX;
    y = startY;
    rgbColor = strokeColor;
  }
  
  void step() {    

    xOld = x;
    yOld = y;
    float xStep;
    float yStep;
    
    float r = random(1);
    //A 2% chance of taking a large step
    if (r < 0.02) {
      float stepsize = pickStepSize();
      xStep = random(-stepsize,stepsize);
      yStep = random(-stepsize,stepsize);
    } else {
      xStep = random(-2,2);
      yStep = random(-2,2);
    }

    x += xStep;
    y += yStep;
  }
  
  void render() {
    stroke(rgbColor[0],rgbColor[1],rgbColor[2]);
    line(xOld,yOld,x,y);
  }

  void stepAndRender() {
    step();
    render();
  }
  
  float pickStepSize() {
    
    //We do this “forever” until we find a qualifying step size
    while (true) {    
      
      float stepSize = random(0,100);
      float probability = sq(stepSize);
      float qualifier = random(0,100);   
      
      if (qualifier < probability) {
        return stepSize;
      }    
    }
    
  }
  
}
