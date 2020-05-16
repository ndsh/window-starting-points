/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
String s;      // Data received from the serial port

int lastVal[] = {0,0,0,0};

void setup() 
{
  size(600, 200);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  
  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);
}

void draw() {
  
  if ( myPort.available() > 0) {  // If data is available,
    s = myPort.readString();         // read it and store it in val
  }
  String[] split = split(s, ',');
  println(s);
  /*for(int i = 0; i<4; i++) {
    if(split[i].equals("x")) {
      split[i] = lastVal[i]+"";
    } else lastVal[i] = int(split[i]);
  }*/
  //println(s);
  if(split.length == 4) {
    background(0);
    int m[] = {int(split[0]), int(split[1]), int(split[2]), int(split[3])};
    for(int i = 0; i<4; i++) {
      
      m[i] = (int)map(m[i], -1000, 1000, 0, 200);
    }
    
    for(int i = 0; i<4; i++) {
      rect((i*width/4)+(width/4)/2, m[i], 20, 20);
    }
  }
}



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
