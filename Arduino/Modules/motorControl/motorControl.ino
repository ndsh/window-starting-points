int buttonLeft = 8;
int buttonRight = 9;

long debounce = 50;
long timestamp = 0;

void setup() {
  Serial.begin(9600);
  pinMode(buttonLeft,INPUT_PULLUP); 
  pinMode(buttonRight,INPUT_PULLUP); 

}

void loop() {
  
  if(millis() - timestamp > debounce) {
    timestamp = millis();
    int buttonL = digitalRead(buttonLeft); 
    int buttonR = digitalRead(buttonRight); 
    Serial.print(buttonL);
    Serial.print(" / ");
    Serial.println(buttonR);
  }

}
