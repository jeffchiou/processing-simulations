

Oscillator[] osc = new Oscillator[0];
OscAnt ant;
void setup() {
  size(1024,768);
  for(int i = 0; i < osc.length; i++) {
    osc[i] = new Oscillator();
  }
  ant = new OscAnt();
}
 
void draw() {
  background(255);
  for(int i = 0; i < osc.length; i++) {
    osc[i].render();
  }
  ant.render();
}


