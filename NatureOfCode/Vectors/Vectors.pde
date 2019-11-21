SimpleBall sb;
SimpleVecBall svb;
VecBall3D vb3d;
VecOps vo;
Mover mover;
MouseMover[] movers = new MouseMover[5];
PFont f;

void setup() {
  size(1024,768);
  background(255);
  f = createFont("Arial",16,true);
  textFont(f);
  
  sb = new SimpleBall();
  svb = new SimpleVecBall();
  vb3d = new VecBall3D();
  vo = new VecOps();
  mover = new Mover();
  for (int i = 0; i < movers.length; i++) {
   movers[i] = new MouseMover();
  }
  
  println("Exercise 1.7:");
  PVector v = new PVector(1,5);  
  PVector u = PVector.mult(v,2);
  println("v*2: u.x: "+u.x+", u.y: "+u.y);
  PVector w = PVector.sub(v,u);
  println("v-u: w.x: "+w.x+", w.y: "+w.y);
  w.div(3);
  println("w/3: w.x: "+w.x+", w.y: "+w.y);
}
 
void draw() {
  background(255);
  text("Scroll to change vector size. Click to normalize.",10,40);
  text("[1] Simple Ball. [2] Simple Vector Ball. [3] 3D Vector Ball. "
   +"[4] Mover. [5] MouseMover",10,60);
  sb.render();
  svb.render();
  vb3d.render();
  mover.render();  
  for (int i = 0; i < movers.length; i++) {
    movers[i].render();
  }
  vo.render();
  frame.setTitle("Vectors " + int(frameRate) + " fps");
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e > 0) {
    vo.smaller();
  } else {
    vo.bigger();
  }
}

void mouseClicked() {
  vo.toggleNormalization();
}

void keyPressed() {
  if (key == '1') {
    sb.toggleRender();
  } else if (key == '2') {
    svb.toggleRender();
  } else if (key == '3') {
    vb3d.toggleRender();
  } else if (key == '4') {
    mover.toggleRender();
  } else if (key == '5') {
      for (int i = 0; i < movers.length; i++) {
        movers[i].toggleRender();
      }
  }
}
