//int x = 2000;
//sheild 2


//motor pins
// pin at PWM for digitalWrite
const int leftmotor1 = 4;//6 // forward pin left
const int leftmotor2 = 5;//2
const int rightmotor1 = 2;//4 // forward pin right
const int rightmotor2 = 3;//3



char incByte;
void setup() 
{
 Serial.begin(9600);
 //define motor pins
 pinMode(leftmotor1,OUTPUT);
 pinMode(leftmotor2,OUTPUT);
 pinMode(rightmotor1,OUTPUT);
 pinMode(rightmotor2,OUTPUT);
 
 
}

void loop() 
{
  
   if(Serial.available()>0)
   {
    
    incByte = Serial.read();
    
   }
  
  
  //Serial.println(incByte);
  
  //conditions from android device
  
 if(incByte == 'U')
 {  
  digitalWrite(4, HIGH);
  digitalWrite(5, LOW);
  delay(50);
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);
  delay(50);
 }
 
 if(incByte == 'D')
 {  
  digitalWrite(5, HIGH);
  digitalWrite(4, LOW);
  delay(50);
  digitalWrite(5, LOW);
  digitalWrite(4, LOW);
  delay(50);
 }

 if(incByte == 'S')
 {  
  digitalWrite(5, LOW);
  digitalWrite(4, LOW);
  delay(50);
  digitalWrite(5, LOW);
  digitalWrite(4, LOW);
  delay(50);
 }

}
