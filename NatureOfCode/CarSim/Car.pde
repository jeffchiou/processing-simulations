class Car {
  // This is a front wheel drive car
  PVector pos, vel, acc;
  float turnAngle, turnVel, bodyAngle;
  float power, topSpeed, topAcc, topTurnAngle, turnTo0Vel;
  float bodyLength, bodyWidth, wheelLength, wheelWidth, wheelXMag, wheelYMag;
  float numericalBuffer;
  
  Car() {
    pos = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    bodyAngle = 0;
    turnAngle = 0;
    power = 0.2;
    topSpeed = 20;
    topAcc = 2;
    turnVel = PI/16;
    topTurnAngle = PI/4;
    turnTo0Vel = PI/64;
    numericalBuffer = 0.001;
    
    // for drawing the car
    bodyLength = 150;
    bodyWidth = 50;
    wheelLength = bodyLength/4; 
    wheelWidth = wheelLength/3;
    wheelXMag = 2*bodyLength/7; 
    wheelYMag = bodyWidth/2;
  }

  void forward() {
    // accelerate in turn direction
    float accAngle = turnAngle;
    PVector accToAdd = PVector.fromAngle(accAngle); 
    accToAdd.mult(power);
    acc.add(accToAdd);
    acc.limit(topAcc);
  }

  void backward() {
    // accelerate in reverse turn direction
    float accAngle = turnAngle;
    PVector accToSubtract = PVector.fromAngle(accAngle); 
    accToSubtract.mult(power);
    acc.sub(accToSubtract);
    acc.limit(topAcc);   
  }

  void left () {
    // turn wheel direction left (CCW), until maximum
    turnAngle -= turnVel;
    println(turnAngle);
  }

  void right() {
    // turn wheel direction right (CW), until maximum
    turnAngle += turnVel;    
    println(turnAngle);
  }
  
  void limitTurnAngle() {
    if (turnAngle > topTurnAngle) {
      turnAngle = topTurnAngle;
    } else if (turnAngle < -topTurnAngle) {
      turnAngle = -topTurnAngle;
    }
  }
  
  void returnToZero() {
    if (turnAngle > 0+numericalBuffer) {
      turnAngle -= turnTo0Vel;
    } else if (turnAngle < 0-numericalBuffer) {
      turnAngle += turnTo0Vel;
    } else {
      turnAngle = 0;
    }
  }
  
  void applyFriction() {
    // apply friction simulated as simple deceleration proportional to velocity
    PVector friction = vel.get();    
    friction.mult(-1);
    friction.mult(0.01);    
    acc.add(friction);
  }

  void update() {

    
    bodyAngle = vel.heading();
    applyFriction();
    
    // turn angle will continually be reset towards 0 degrees   
    limitTurnAngle();
    returnToZero();
    vel.rotate(turnAngle*0.1);
    
    vel.add(acc);    
    vel.limit(topSpeed);
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
    rectMode(CENTER);

    pushMatrix();
      translate(pos.x, pos.y);
      rotate(bodyAngle);    
      rect(0,0,bodyLength,bodyWidth,5);
      
      // back wheels
      fill(50);
      rect(-wheelXMag, wheelYMag, wheelLength, wheelWidth, 5);
      rect(-wheelXMag, -wheelYMag, wheelLength, wheelWidth, 5);
      
      fill(50,50,200);
      // nested pushMatrix for left front wheel
      pushMatrix();        
        translate(wheelXMag, wheelYMag);
        rotate(turnAngle);  
        rect(0, 0, wheelLength, wheelWidth, 5);
      popMatrix();
      
      // nested pushMatrix for right front wheel
      pushMatrix();
        translate(wheelXMag, -wheelYMag);
        rotate(turnAngle);
        rect(0, 0, wheelLength, wheelWidth, 5);
      popMatrix();
    
    popMatrix();
  }

  void render() {
    update();
    checkEdges();
    display();
  }
}

