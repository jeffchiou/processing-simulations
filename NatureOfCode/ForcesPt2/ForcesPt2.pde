
Mover[] movers = new Mover[20];
InvisForceMover[] ifMovers = new InvisForceMover[1];
FrictionPocket slowdown, speedup;
PVector wind, gravity;       
void setup() {
  size(1024,768);
  wind = new PVector(0.04,0);
  gravity = new PVector(0,0.4);    
  slowdown = new FrictionPocket(0.1,0,height/2,width/2,height/2);
  speedup = new FrictionPocket(-.1,width/2,height/2,width/2,height/2);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),0,0);
  }
  
  for (int i = 0; i < ifMovers.length; i++) {
    ifMovers[i] = new InvisForceMover(random(0.1,5),0,0);
  }
}

void draw() {
  background(255);
  slowdown.render();
  speedup.render();
  for (int i = 0; i < movers.length; i++) {
    float m = movers[i].mass;
    gravity = new PVector(0,0.4*m);
    
    if ( slowdown.checkEdges( movers[i].location.x,movers[i].location.y ) ) {
      PVector friction = slowdown.returnForce(movers[i].velocity);
      movers[i].applyForce(friction);
    }
    if ( speedup.checkEdges( movers[i].location.x,movers[i].location.y ) ) {
      PVector slick = speedup.returnForce(movers[i].velocity);
      movers[i].applyForce(slick);
    }
    
    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);
    movers[i].render();
  }
  for (int i = 0; i < ifMovers.length; i++) {
    ifMovers[i].applyForce(wind);
    ifMovers[i].applyForce(gravity);
    ifMovers[i].render();
  }
  frame.setTitle("ForcesPt2 " + int(frameRate) + " fps");
}
