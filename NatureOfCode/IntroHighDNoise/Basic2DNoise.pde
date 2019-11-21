class Basic2DNoise {
  float xoff,yoff,xOld,yOld;
  Basic2DNoise() {
    xoff = 0.0;
    yoff = 0.0;
    xOld = 0.0;
    yOld = 0.0;
  }
  void render() {
    loadPixels();
    xOld += 0.1;
    yOld += 0.1;
    xoff = xOld;
    
    for (int x = 0; x < width; x++) {
      yoff = yOld;
      for (int y = 0; y < height; y++) {
        float bright = map(noise(xoff,yoff),0,1,0,255);
        pixels[x+y*width] = color(bright);
        
        yoff += 0.01;
      }
      
      xoff += 0.01;
    }
    updatePixels();
  }
}
