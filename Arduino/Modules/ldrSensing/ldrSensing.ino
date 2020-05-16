int sensorPin = A0;
int ledPin = 6;

void setup() {
  Serial.begin(9600);
  pinMode(ledPin, OUTPUT);
}

void loop() {
  int val = analogRead(sensorPin);
  analogWrite(ledPin, 20);
  Serial.println(val);
}
