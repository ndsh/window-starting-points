#include <AccelStepper.h>

# define X_DIR 5 // X -axis stepper motor direction control
# define Y_DIR 6 // y -axis stepper motor direction control
# define Z_DIR 7 // z axis stepper motor direction control

# define X_STP 2 // x -axis stepper control
# define Y_STP 3 // y -axis stepper control
# define Z_STP 4 // z -axis stepper control
# define A_STP 12 // A -axis stepper control
# define A_DIR 13 // A axis stepper motor direction control

AccelStepper motorA(1, X_STP, X_DIR); // pin 2 = step, pin 5 = direction
AccelStepper motorB(1, Y_STP, Y_DIR); // pin 2 = step, pin 5 = direction
AccelStepper motorC(1, Z_STP, Z_DIR); // pin 2 = step, pin 5 = direction
AccelStepper motorD(1, A_STP, A_DIR); // pin 2 = step, pin 5 = direction

const byte enablePin = 8;
 
int buttonLeft = 9;
int buttonRight = 10;

long debounce = 10;
long timestamp = 0;

int maximumSpeed = 2000;

void setup() {
  //Serial.begin(9600);

  pinMode(enablePin, OUTPUT);
  digitalWrite(enablePin, LOW);
   
  pinMode(buttonLeft,INPUT_PULLUP); 
  pinMode(buttonRight,INPUT_PULLUP); 

  motorA.setMaxSpeed(12800);
   motorA.setSpeed(1000); // had to slow for my motor

   motorB.setMaxSpeed(12800);
   motorB.setSpeed(1000); // had to slow for my motor

   motorC.setMaxSpeed(12800);
   motorC.setSpeed(1000); // had to slow for my motor

   motorD.setMaxSpeed(12800);
   motorD.setSpeed(1000); // had to slow for my motor

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
      motorA.setSpeed(maximumSpeed/2);
      motorB.setSpeed((maximumSpeed*2)*-1);
      motorC.setSpeed(maximumSpeed);
      motorD.setSpeed(maximumSpeed*-1);

      motorA.runSpeed();
      motorB.runSpeed();
      motorC.runSpeed();
      motorD.runSpeed();

   
    } else if(buttonR == 0) {
      motorA.setSpeed((maximumSpeed/2)*-1);
      motorB.setSpeed(maximumSpeed*2);
      motorC.setSpeed(maximumSpeed*-1);
      motorD.setSpeed(maximumSpeed);

      motorA.runSpeed();
      motorB.runSpeed();
      motorC.runSpeed();
      motorD.runSpeed();
    } else {
      motorA.stop();
      motorB.stop();
      motorC.stop();
      motorD.stop();
    }
  }

}
