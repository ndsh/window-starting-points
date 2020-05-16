class Window {
  // The Window consists of strings
  
  // Window has 4 MotorPairs
  // Each MotorPair has 2 Motors
  // Each MotorPair is connected to two sensors / Sensor End-Stops
  
  PGraphics pg;
  color neon = color(207, 255, 4);
  
  Window() {
    construct();
  }
  
  
  void update(){
  }
  
  void display() {
    image(pg, 0, 0);
  }
  
  void construct() {
    int margin = width-20-40/4;
    pg = createGraphics(width, height);
    pg.beginDraw();
    pg.noFill();
    pg.strokeWeight(2.5);
    pg.stroke(neon);
    pg.rect(20, 20, width-40, height-40);
    pg.endDraw();
  }
}
