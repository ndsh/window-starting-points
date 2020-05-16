Serial[] myPorts = new Serial[2];
int[] dataIn = new int[2];

Window window;

void setup() {
    size(600, 600);
    
  println("windowController");
  println("/ / / / / / / /");
  println();
  println("Available ports:");
  for(int i = 0; i<Serial.list().length; i++) println("> " + Serial.list()[i]);
  
  window = new Window(); 
  
//  myPort = new Serial(this, portName, 9600);
}

void draw() {
  background(0);
  window.display();
}
