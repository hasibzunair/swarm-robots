#define trigPin 10
#define echoPin 9

void setup()
{
  
 Serial.begin(9600);
 pinMode(trigPin, OUTPUT);
 pinMode(echoPin,INPUT);

}


void loop(){
  
  
  int duration,distance;
  
  digitalWrite(trigPin, HIGH); //send ultrasoncie wave
  delay(500);
  digitalWrite(trigPin, LOW);
  
  duration = pulseIn(echoPin,HIGH);
  distance = (duration/2 )/29.1; //convert to cm
  Serial.print(distance);
  Serial.println("cm");
  delay(500);
  
}
  
  
  
  
  
  
  
  
  
