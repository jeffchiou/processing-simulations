import java.util.*;

class GaussianWalker extends Walker {
  Random generator;
  int xOld;
  int yOld;
  
  GaussianWalker() {
    this(2*width/3, 2*height/3, new int[] {0,150,150});
  }
  GaussianWalker(int startX, int startY) {
    this(startX, startY, new int[] {0,150,150});
  }  
  GaussianWalker(int startX, int startY, int[] strokeColor) {
    super(startX, startY, strokeColor);
    generator = new Random();
  }
  
  void step() {    
    int xChoice = int(random(3))-1;
    int yChoice = int(random(3))-1;
    float prob = (float) generator.nextGaussian();
    int stepSize = round(prob*2 + 5);
    xOld = x;
    yOld = y;
    x += xChoice*stepSize;
    y += yChoice*stepSize;    
  }
  
  void render() {
    stroke(rgbColor[0],rgbColor[1],rgbColor[2]);
    line(xOld,yOld,x,y);
  }
  
}
