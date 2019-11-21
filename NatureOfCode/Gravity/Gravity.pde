Mover[] movers = new Mover[5];
Attractor[] attractors = new Attractor[1];
MouseAttractor ma;
 
void setup() {
  
  size(1024, 768);
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
  }
  
  for (int i = 0; i < attractors.length; i++) {
    attractors[i] = new Attractor();
  }
  
  ma = new MouseAttractor();
  
}
 
void draw() {
  
//  background(255);
  
  for (int i = 0; i < movers.length; i++) {
    
    for (int j = 0; j < attractors.length; j++) {
      PVector f = attractors[j].attract(movers[i]);
      movers[i].applyForce(f);
    }
    
//    for (int j = 0; j < movers.length; j++) {
//      if (i != j) {
//        PVector f = movers[j].repel(movers[i]);
//        movers[i].applyForce(f);
//      }
//    }
    
    PVector f = ma.attract(movers[i]);
    movers[i].applyForce(f);
    
    movers[i].render();
  }
  
  for (int i = 0; i < attractors.length; i++) {
    attractors[i].display();
  }
  
  ma.render();
  
}

void mousePressed() {
  ma.increaseForce();
}

void mouseReleased() {
  ma.decreaseForce();
}
