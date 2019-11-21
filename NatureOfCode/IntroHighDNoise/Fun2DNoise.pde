class Fun2DNoise {
  float xOff,yOff,xOld,yOld;
  
  Fun2DNoise() {
    xOff = 0.0;
    yOff = 0.0;
    xOld = 0.0;
    yOld = 0.0;
  }
  void render() {
    loadPixels();
    xOld += 0.01;
    xOff = xOld;
    for (int x = 0; x < width; x++) {
      yOff = yOld;
      for (int y = 0; y < height; y++) {
        float bright = map(noise(xOff,yOff),0,1,0,255);
        pixels[x+y*width] = color(bright);
        
        yOff += 0.1;
      }
      
      xOff += 0.01;
    }
    updatePixels();
  }
}
