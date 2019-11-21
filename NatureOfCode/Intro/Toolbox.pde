class Toolbox {
  float atan360(float x, float y) {
    if (x==0 && y==0) return 0;
    float angle = atan(y/x);
    if (x < 0) return angle+PI;
    if (y < 0) return angle+2*PI;
    return angle;    
  }
  int signum(int n) {
    if (n > 0) return 1;
    if (n < 0) return -1;
    return 0;
  }
}
