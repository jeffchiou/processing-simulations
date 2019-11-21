class Ship {
  PVector pos, vel, acc;
  float angle, turnVel, thrustPower, maxVel;
  float bodyBase, bodyHeight, x1, y1, x2, y2, x3, y3;
  
  Ship() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    angle = 0;
    maxVel = 20;
    thrustPower = 0.2;
    turnVel = PI/32;
    
    // for drawing the ship
    bodyBase = 40;
    bodyHeight = 50;
    x1 = bodyHeight/2;
    x2 = -x1;
    x3 = x2;
    y1 = 0;
    y2 = bodyBase/2;
    y3 = -y2;
  }

  void accelerate() {
    // accelerate in current direction
    PVector accToAdd = PVector.fromAngle(angle); 
    accToAdd.mult(thrustPower);
    acc.add(accToAdd);
  }

  void left () {
    angle -= turnVel;
  }

  void right() {
    angle += turnVel;    
  }
  
  void applyFriction() {
    // apply friction simulated as simple deceleration proportional to velocity
    PVector friction = vel.get();    
    friction.mult(-1);
    friction.mult(0.01);    
    acc.add(friction);
  }

  void update() {
    applyFriction();    
    vel.add(acc);    
    vel.limit(maxVel);
    pos.add(vel);
    acc.mult(0);    
  }
  
  void checkEdges() {
    if (pos.x > width) {
      pos.x = 0;
    } else if (pos.x < 0) {
      pos.x = width;
    }
    
    if (pos.y > height) {
      pos.y = 0;
    } else if (pos.y < 0) {
      pos.y = height;
    }
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(175);

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);    
    triangle(x1,y1,x2,y2,x3,y3);    
    popMatrix();
  }

  void render() {
    update();
    checkEdges();
    display();
  }
}
