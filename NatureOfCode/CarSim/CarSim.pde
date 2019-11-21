Car car;
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
  size(1280,720);
  car = new Car();
}

void draw() {
  background(240,250,255);
  if (keys[0] || keyCodes[UP]) {
    car.forward();        
  } else if (keys[1] || keyCodes[DOWN]) {
    car.backward();
  }
      
  if (keys[2] || keyCodes[LEFT]) {
    car.left();
  } else if (keys[3] || keyCodes[RIGHT]) {
    car.right();
  }
  car.render();
}

