class MouseWalker extends Walker{

  MouseWalker() {
    super(width/2, 2*height/3, new int[] {200,0,0});
  }
  MouseWalker(int startX, int startY) {
    super(startX, startY, new int[] {200,0,200});
  }
  
  MouseWalker(int startX, int startY, int[] strokeColor) {
    super(startX, startY, strokeColor);
  }  
  
  void step() {
    //50% chance of moving in direction of mouse
    float r = random(1);
    if (r < 0.5) {
      int xStep = int(random(3))-1;
      int yStep = int(random(3))-1;
      x += xStep;
      y += yStep;
    } else {
      float xDiff = mouseX-x;
      float yDiff = mouseY-y;
      float angle = atan2(yDiff,xDiff);
      int xStep = round(cos(angle));
      int yStep = round(sin(angle));
      x += xStep;
      y += yStep;
    } 
    
  }

}
