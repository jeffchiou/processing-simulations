class Walker {
  int x;
  int y;
  int[] rgbColor;
  
  // Constructors
  Walker() {
    this(width/2,height/2);
  }
  
  Walker(int startX, int startY) {
    this(startX,startY,new int[] {0,0,0});
  }
  
  Walker(int startX, int startY, int[] strokeColor ) {
    x = startX;
    y = startY;
    rgbColor = strokeColor;
  }
  
  // Other Methods
  void render() {
    stroke(rgbColor[0],rgbColor[1],rgbColor[2]);
    point(x,y);
  }
  
  void step() {
    int choice = int(random(4));
    if (choice == 0) {
      x++;
    } else if (choice == 1) {
      x--;
    } else if (choice == 2) {
      y++;
    } else if (choice == 3) {
      y--;
    } 
  }
  
  void stepAndRender() {
    step();
    render();
  }
  
}
