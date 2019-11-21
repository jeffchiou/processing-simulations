class Cannon {
  /* @pjs preload="MuzzleFlash.png"; */ 
  PVector center;
  float angle;
  PImage muzzleFlash;
  boolean showFlash,firstFire;
  
  Cannon() {
    angle = 0;
    center = new PVector(50,height-50);
    muzzleFlash = loadImage("MuzzleFlash.png");
    showFlash = false;
    firstFire = true;
  }
  
  void fire(Ball ball) {
    ball.reset();
    ball.location = new PVector(center.x,center.y);
    PVector newVel = new PVector(mouseX-center.x,mouseY-center.y);
    newVel.normalize();
    newVel.mult(30);
    ball.velocity = newVel;
    if (firstFire) {
      ball.toggleRender();
      firstFire = false;
    }
    
    showFlash = true;    
  }
  
  void display() {
    fill(0);

    pushMatrix();  
    rectMode(CENTER);  
    translate(center.x,center.y);
    rotate(angle);
    rect(15,0,60,25,5);
    ellipse(-15,0,25,25);
    if (showFlash) {
      image(muzzleFlash, 40, -35, muzzleFlash.width/2, muzzleFlash.height/2);
      showFlash = false;
    }
    popMatrix();
    
    fill(150,150);
    ellipse(center.x,center.y+10,35,35);
  }
  
  void update() {
    angle = atan2(mouseY-center.y,mouseX-center.x);
  }
  void render() {
    update();
    display();
  }
}
