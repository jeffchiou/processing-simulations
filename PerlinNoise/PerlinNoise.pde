float t = 0;
int x;
float y;
int xOld;
float yOld;
void setup(){
  size(1024,768);
  x = 0;
  y = 768.0;
}
void draw() {
  float n = noise(t);
  xOld = x;
  yOld = y;
  x += 1;
  y = 768-768*n;
  line(xOld,yOld,x,y);
  t += 0.01;
}
