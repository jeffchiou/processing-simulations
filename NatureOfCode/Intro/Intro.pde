/*
Walker w;
Walker2 w2;
DownRightWalker drw;
DownRightWalker2 drw2;
MouseWalker mw;
*/

GaussianSplatterer gs;
GaussianWalker gw;
LevyWalker lw;
PerlinWalker pw;


void setup() {
  
  size(1024,768);
  background(255);
  //gs = new GaussianSplatterer();
  //gw = new GaussianWalker();
  //lw = new LevyWalker();
  pw = new PerlinWalker();
  
  /*
  w = new Walker();
  w2 = new Walker2();
  drw = new DownRightWalker();
  drw2 = new DownRightWalker2();
  mw = new MouseWalker(900,700,new int[] {0,200,150});
  */
}
void draw() {
  //gs.render();
  //gw.stepAndRender();
  //lw.stepAndRender();
  pw.stepAndRender();

  /*
  w.stepAndRender();  
  w2.stepAndRender();
  drw.stepAndRender();
  drw2.stepAndRender();
  mw.stepAndRender();
  */
}
