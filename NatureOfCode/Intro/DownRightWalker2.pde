class DownRightWalker2 extends Walker {
  
  DownRightWalker2() {
    super(width/3, height/2, new int[] {0,0,200});
  }
  DownRightWalker2(int startX, int startY) {
    super(startX, startY, new int[] {0,0,200});
  }
  
  DownRightWalker2(int startX, int startY, int[] strokeColor) {
    super(startX, startY, strokeColor);
  }  
  
  void step() {
    // Up Left 20%, Down Right 30%
    float r = random(1);
    if (r < 0.2) {
      x--;
    } else if (r < 0.4) {
     y--;
    } else if (r < .7) {
     x++;
    } else {
     y++;
    } 
    
  }
}
