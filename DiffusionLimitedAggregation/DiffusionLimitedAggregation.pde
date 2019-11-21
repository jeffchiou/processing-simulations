int numParticles = 2000;
Seed seed;
Mover[] movers = new Mover[numParticles];
boolean[] frozen = new boolean[numParticles];
PFont f;
int numStarted;
int numActive;

void setup() {
  background(255);
  colorMode(HSB);
  size(1024,768);
  f = createFont("Arial",16,true);
  textFont(f);
  
  seed = new Seed();
  
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover();
    //frozen is the same length as movers
    frozen[i] = false;
  }

  numStarted = 1;
  println(movers.length);
  delay(5000);
  
}
 
void draw() {
  background(255);
  fill(0);

  for (int i = 0; i < movers.length; i++) {

    if (movers[i].active) {
      // colliding with the seed
      float seedDist = dist(movers[i].location.x, movers[i].location.y, 
          seed.location.x, seed.location.y);
      float minSeedDist = (movers[i].diameter + seed.diameter) / 2.0;
      if (seedDist <= minSeedDist) {
          movers[i].freeze();
          frozen[i] = true;
      }
      
      // colliding with frozen movers
      for (int j = 0; j < movers.length; j++) {
        if (frozen[j]) {
          float distance = dist(movers[i].location.x, movers[i].location.y, 
            movers[j].location.x, movers[j].location.y);
          float minDistance = (movers[i].diameter + movers[j].diameter) / 2.0;
          if(distance <= minDistance) {
            movers[i].freeze();
            frozen[i] = true;
          }
        }
      }
    }
    movers[i].render();
  }
  
  seed.render();
  //frame.setTitle("DLA " + int(frameRate) + " fps");
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e > 0) {
  } else {
  }
}

void mouseClicked() {

}

void keyPressed() {
  if (key == '1') {
    seed.toggleRender();
  } else if (key == '2') {
      for (int i = 0; i < movers.length; i++) {
        movers[i].toggleRender();
      }
  }
}