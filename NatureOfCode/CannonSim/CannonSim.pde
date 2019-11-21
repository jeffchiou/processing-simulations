Cannon cannon;
Ball ball;
PVector gravity;
Air air;

void setup() {
  size(1280,720);
  
  cannon = new Cannon();
  ball = new Ball(10,cannon.center.x,cannon.center.y);
  ball.toggleRender();
  
  gravity = new PVector(0,1);
  air = new Air(0, 0, width, height, 0.001, 0.008);
}

void draw() {
  background(255);
  cannon.render();
  ball.applyForce(gravity);
  ball.drag(air);
  ball.render();
}

void mouseClicked() {
  cannon.fire(ball);
}
