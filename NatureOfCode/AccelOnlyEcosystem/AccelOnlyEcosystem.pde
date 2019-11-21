// Only acceleration 
Bunny[] bunnies = new Bunny[2];
PFont f;

void setup() {
  size(1024,768);
  background(255);
  f = createFont("Arial",16,true);
  textFont(f);

  for (int i = 0; i < bunnies.length; i++) {
   bunnies[i] = new Bunny();
  }
}
 
void draw() {
  background(255);
  text("[1] Bunnies.",10,10); 
  for (int i = 0; i < bunnies.length; i++) {
    bunnies[i].render();
  }  
}

void keyPressed() {
  if (key == '1') {
    for (int i = 0; i < bunnies.length; i++) {
        bunnies[i].toggleRender();
    }
  }
}
