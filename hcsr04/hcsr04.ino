#define trigPin 7
#define echoPin 6
float time;

unsigned long int count;
int c = 200;
void setup()
{
  
 Serial.begin(9600);
 pinMode(trigPin, OUTPUT);
 pinMode(echoPin,INPUT);

}


void loop(){
  
  time = millis()/1000.0;
float  timeN = time/60;
  unsigned int duration,distance;
  
  digitalWrite(trigPin, HIGH); //send ultrasoncie wave
  delay(c);
  digitalWrite(trigPin, LOW);
  
  duration = pulseIn(echoPin,HIGH);
  distance = (duration/2 )/29.1; //convert to cm
  
 // Serial.print(count);
  //count++;
  //Serial.print("      ");
  Serial.print(distance);
  Serial.print("     ");
  Serial.print(timeN);
  Serial.println();
  
  delay(200);
}

