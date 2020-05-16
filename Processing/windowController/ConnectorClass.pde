import processing.serial.*;

class Connector {
  Serial myPort;  // Create object from Serial class
  int val;        // Data received from the serial port
  PApplet pa;
  String out;
  
  Connector(PApplet _pa, String port, int baud) {
    //String portName = Serial.list()[0];
    myPort = new Serial(_pa, port, baud);
  }
  
  void update() {
  }
  
  void write(String s) {
    myPort.write(s);
  }
  
  void write(char c) {
    myPort.write(c);
  }
  
  void read() {
    if ( myPort.available() > 0) {  // If data is available,
      val = myPort.read();         // read it and store it in val
    }
  }
  
}

void serialEvent(Serial thisPort) {
  // variable to hold the number of the port:
  int portNumber = -1;
  
  // iterate over the list of ports opened, and match the 
  // one that generated this event:
  for (int p = 0; p < myPorts.length; p++) {
    if (thisPort == myPorts[p]) {
      portNumber = p;
    }
  }
  // read a byte from the port:
  int inByte = thisPort.read();
  // put it in the list that holds the latest data from each port:
  dataIn[portNumber] = inByte;
  // tell us who sent what:
  println("Got " + inByte + " from serial port " + portNumber);
}


// SIMPLE READ
/*

// Wiring / Arduino Code
// Code for sensing a switch status and writing the value to the serial port.

int switchPin = 4;                       // Switch connected to pin 4

void setup() {
  pinMode(switchPin, INPUT);             // Set pin 0 as an input
  Serial.begin(9600);                    // Start serial communication at 9600 bps
}

void loop() {
  if (digitalRead(switchPin) == HIGH) {  // If switch is ON,
    Serial.write(1);               // send 1 to Processing
  } else {                               // If the switch is not ON,
    Serial.write(0);               // send 0 to Processing
  }
  delay(100);                            // Wait 100 milliseconds
}

*/


// MULTIPLE
/*
The following Wiring/Arduino code runs on both microcontrollers that
were used to send data to this sketch:

void setup()
{
  // start serial port at 9600 bps:
  Serial.begin(9600);
}

void loop() {
  // read analog input, divide by 4 to make the range 0-255:
  int analogValue = analogRead(0)/4; 
  Serial.write(analogValue);
  // pause for 10 milliseconds:
  delay(10);                 
}


*/
