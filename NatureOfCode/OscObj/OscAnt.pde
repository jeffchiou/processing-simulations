class OscAnt {
  Oscillator[] legs = new Oscillator[6];
  float VEL;
  OscAnt() {
    float x = width/2;
    float y = height/2;
    VEL = 0.05;
    float yAmp = 20;
    float xAmp = 1;
    float xVel = 1;
    // back legs
    legs[0] = new Oscillator(x+100,y+100,xVel,VEL,xAmp,yAmp);
    legs[1] = new Oscillator(x-100,y+100,xVel,-VEL,xAmp,yAmp);
    // middle legs
    legs[2] = new Oscillator(x+100,y,xVel,-VEL,xAmp,yAmp);
    legs[3] = new Oscillator(x-100,y,xVel,VEL,xAmp,yAmp);
    // front legs
    legs[4] = new Oscillator(x+100,y-100,xVel,VEL,xAmp,yAmp);
    legs[5] = new Oscillator(x-100,y-100,xVel,-VEL,xAmp,yAmp);
  }
  
  
  void update() {
  }
  void display() {

  }
  void render() {
    for(int i = 0; i < legs.length; i++) {
      legs[i].render();
    }
  }
}
