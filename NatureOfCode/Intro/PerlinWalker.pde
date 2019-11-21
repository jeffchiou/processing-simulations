// Exercise 1.7
class PerlinWalker {
  float x,y,xOld,yOld;
  int[] rgbColor;
  int maxStep;
  float t;
  
  PerlinWalker() {
    this(width/2, height/2, new int[] {0,150,150});
  }
  PerlinWalker(float startX, float startY) {
    this(startX, startY, new int[] {0,150,150});
  }  
  PerlinWalker(float startX, float startY, int[] strokeColor) {
    x = startX;
    y = startY;
    t = 0;
    maxStep = 20;
    rgbColor = strokeColor;
  }
  
  void step() {  
    xOld = x;
    yOld = y;
    
    float stepSize = map(noise(t), 0, 1, 0, maxStep);
    float angle = random(0,2*PI);
      
    x += cos(angle)*stepSize;
    y += sin(angle)*stepSize;  
    
    t += 0.01;
  }
  
  void render() {
    stroke(rgbColor[0],rgbColor[1],rgbColor[2]);
    line(xOld,yOld,x,y);
  }

  void stepAndRender() {
    step();
    render();
  }
  
  
}
