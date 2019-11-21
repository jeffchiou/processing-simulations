class Walker2 extends Walker {
  
  Walker2() {
    super(width/3, height/3, new int[] {255,0,0});
  }
  
  Walker2(int startX, int startY) {
    super(startX, startY, new int[] {255,0,0});
  }
  
  Walker2(int startX, int startY, int[] strokeColor) {
    super(startX, startY, strokeColor);
  }  
  
  void step() {    
    int xChoice = int(random(3))-1;
    int yChoice = int(random(3))-1;    
    x += xChoice;
    y += yChoice;    
  }
  
}
