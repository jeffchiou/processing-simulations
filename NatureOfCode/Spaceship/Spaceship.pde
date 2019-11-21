Ship ship;
boolean[] keyCodes = new boolean[256];
boolean[] keys = new boolean[4];

void keyPressed() {
  keyCodes[keyCode] = true;
  if (key == ',')  keys[0] = true;
  if (key == 'o')  keys[1] = true;
  if (key == 'a')  keys[2] = true;
  if (key == 'e')  keys[3] = true;
}

void keyReleased() {
  keyCodes[keyCode] = false;
  if (key == ',')  keys[0] = false;
  if (key == 'o')  keys[1] = false;
  if (key == 'a')  keys[2] = false;
  if (key == 'e')  keys[3] = false;
}

void setup() {
  size(1280,768);
  ship = new Ship();
}

void draw() {
  background(255);
  handleKeys();
  ship.render();
}

void handleKeys() {
  if (keys[0] || keyCodes[UP]) {
    ship.accelerate();        
  }
  
  if (keys[2] || keyCodes[LEFT]) {
    ship.left();
  } else if (keys[3] || keyCodes[RIGHT]) {
    ship.right();
  }
}
