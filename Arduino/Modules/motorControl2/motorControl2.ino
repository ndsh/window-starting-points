#include <AccelStepper.h>

//AccelStepper stepper; // Defaults to AccelStepper::FULL4WIRE (4 pins) on 2, 3, 4, 5
 AccelStepper stepper(1, 2,3); 
 
int buttonLeft = 8;
int buttonRight = 9;

long debounce = 10;
long timestamp = 0;

void setup() {
  Serial.begin(9600);
  pinMode(buttonLeft,INPUT_PULLUP); 
  pinMode(buttonRight,INPUT_PULLUP); 

  stepper.setMaxSpeed(2000);
   stepper.setSpeed(50);  

}

void loop() {
  
  if(millis() - timestamp > debounce) {
    timestamp = millis();
    int buttonL = digitalRead(buttonLeft); 
    int buttonR = digitalRead(buttonRight); 
    Serial.print(buttonL);
    Serial.print(" / ");
    Serial.println(buttonR);

    if(buttonL == 0) {
      stepper.setSpeed(2000);
      stepper.runSpeed();
    } else if(buttonR == 0) {
      stepper.setSpeed(-2000);
      stepper.runSpeed();
    } else stepper.stop();
  }

}
