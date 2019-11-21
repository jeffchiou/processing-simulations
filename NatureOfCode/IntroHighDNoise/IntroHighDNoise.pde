Basic2DNoise basic;
void setup() {
  size(1024,768);
  background(255);
  basic = new Basic2DNoise();

}
void draw() {
  basic.render();
}
