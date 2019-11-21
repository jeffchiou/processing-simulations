class DownRightWalker extends Walker {

  DownRightWalker() {
    super(width/2, height/3, new int[] {0,255,0});
  }
  DownRightWalker(int startX, int startY) {
    super(startX, startY, new int[] {0,255,0});
  }
  
  DownRightWalker(int startX, int startY, int[] strokeColor) {
    super(startX, startY, strokeColor);
  }  
  
  void step() {
    
    int xChoice = int(random(3)) - 1 + int(random(2));
    int yChoice = int(random(3)) - 1 + int(random(2));
    
    x += xChoice;
    y += yChoice;
    
  }
}
