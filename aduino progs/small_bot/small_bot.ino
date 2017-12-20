#include <QTRSensors.h>
#define P 4
#define D 40
#define I 2
#define Kp 20
#define Ki 1000// experiment to determine this, start by something small that just makes your bot follow the line at a slow speed
#define Kd 3/2 // experiment to determine this, slowly increase the speeds and adjust this value. ( Note: Kp < Kd) 
int rightMaxSpeed=150 ; // max speed of the robot
int leftMaxSpeed =150; // max speed of the robot
int rightBaseSpeed= 130; // this is the speed at which the motors should spin when the robot is perfectly on the line
int leftBaseSpeed =140;//this is the speed at which the motors should spin when the robot is perfectly on the line
int rightMaxSpeed_loop=100;
int leftMaxSpeed_loop=100;
int rightBaseSpeed_loop=90;
int leftBaseSpeed_loop=90;
#define reverse_speed 100
#define trigPin 8
#define echoPin 9
#define NUM_SENSORS  8     // number of sensors used
#define TIMEOUT 2500  // waits for 2500 us for sensor outputs to go low
#define EMITTER_PIN 30     // emitter is controlled by digital pin 2
#define DEBUG 0
#define rightMotor1 3
#define rightMotor2 4
#define rightMotorPWM 7
#define leftMotor1 5
#define leftMotor2 6
#define leftMotorPWM 2
#define ledRed 12
#define ledYellow 11
#define ledGreen 13
int  setPoint=0; 
#define Debug 0

QTRSensorsRC qtrrc((unsigned char[]) {  32,34, 36, 38,40, 42,44, 46 } ,NUM_SENSORS, TIMEOUT, EMITTER_PIN); // sensor connected through analog pins A0 - A5 i.e. digital pins 14-19

unsigned int sensorValues[NUM_SENSORS];
unsigned int sensors[NUM_SENSORS];
void setup()
{
Serial.begin(9600);
  pinMode(ledYellow,OUTPUT);
  pinMode(rightMotor1, OUTPUT);
  pinMode(rightMotor2, OUTPUT);
  pinMode(rightMotorPWM, OUTPUT);
  pinMode(leftMotor1, OUTPUT);
  pinMode(leftMotor2, OUTPUT);
  pinMode(leftMotorPWM, OUTPUT);
  pinMode(ledRed,OUTPUT);
  pinMode(ledGreen,OUTPUT);
  pinMode(28,OUTPUT);
  digitalWrite(28,HIGH);
  
 // digitalWrite(ledRed,LOW);
  //digitalWrite(ledGreen,LOW);
  digitalWrite(ledYellow,LOW);
  //delay(500);
 digitalWrite(ledRed,HIGH);
  manual_calibration();
  digitalWrite(ledYellow,HIGH);
 set_point();
  digitalWrite(ledYellow,LOW);
  
 
 }
 //Globall variable ;
int blackValue = 800;
boolean lff;
boolean rff;
boolean rf;
boolean lf;
boolean rn;
boolean ln;
boolean lc;
boolean rc;
boolean rfff;
boolean lfff;
int lastError = 0;
boolean wall;

void loop(){

    readSensor();
     if(!lff&&!lc&&!rc&&!rff){
       u_turn();
       }
    else{ 
        pid_control_loop();
    }
   

  
  digitalWrite(ledRed,LOW);
  digitalWrite(ledGreen,LOW);
  digitalWrite(ledYellow,LOW);
}
  
void turn_left(){
  
    while(!(!lff&&!lf&&rf&&!rff&&(rn||rc))){
        digitalWrite(rightMotor1, LOW);
        digitalWrite(rightMotor2, HIGH);
        analogWrite(rightMotorPWM,100);
        digitalWrite(leftMotor1, HIGH);
        digitalWrite(leftMotor2, LOW);
        analogWrite(leftMotorPWM,100);
        readSensor();
         Serial.println("Left");
    }
}

void u_turn(){
   while(!(!lff&&!rff&&(ln||lc||lf))){
        digitalWrite(rightMotor1,HIGH);
        digitalWrite(rightMotor2, LOW);
        analogWrite(rightMotorPWM,70);
        digitalWrite(leftMotor1, LOW);
        digitalWrite(leftMotor2,HIGH);
        analogWrite(leftMotorPWM,70);
        Serial.println("Right");
        readSensor();
   }
}

void turn(){

  if((lff)&&(lc||rc||rn||ln||lf||rf)){
  straight_slight_turns();
     //sharp_turn_left(); 
      //Serial.print("turning Left");
      }else if((rff)&&(lc||rc||rn||ln||lf||rf)){
       straight_slight_turns();
       //sharp_turn_right();
       // Serial.print("Turning Right");
      }else 
          pid_control_loop();
}



  void sonar_PID_control() {

  int position = Map(); // get calibrated readings along with the line position, refer to the QTR Sensors Arduino Library for more details on line position.
  Serial.print(position);
  Serial.print("  ");
  int error = position - setPoint;
  Serial.print(error);
  Serial.print(" ");

  int integral = 0;
  integral = integral + error;

  int motorSpeed = error / Kp + (error - lastError) / Kd + (integral) / Ki;
  lastError = error;

  int rightMotorSpeed = rightBaseSpeed + motorSpeed;
  int leftMotorSpeed = leftBaseSpeed - motorSpeed;

  if (rightMotorSpeed > rightMaxSpeed ) rightMotorSpeed = rightMaxSpeed; // prevent the motor from going beyond max speed
  if (leftMotorSpeed > leftMaxSpeed ) leftMotorSpeed = leftMaxSpeed; // prevent the motor from going beyond max speed
  if (rightMotorSpeed < 0) rightMotorSpeed = 0; // keep the motor speed positive
  if (leftMotorSpeed < 0) leftMotorSpeed = 0; // keep the motor speed positive

  {
    // move forward with appropriate speeds
    digitalWrite(rightMotor1, HIGH);
    digitalWrite(rightMotor2, LOW);
    Serial.print(rightMotorSpeed);

    Serial.print(" ");
    Serial.print(leftMotorSpeed);
    Serial.println();
    analogWrite(rightMotorPWM, rightMotorSpeed);
    digitalWrite(leftMotor1, HIGH);
    digitalWrite(leftMotor2, LOW);
    analogWrite(leftMotorPWM, leftMotorSpeed);
  }



}




 void PID_control(){

   int position = qtrrc.readLine(sensors); // get calibrated readings along with the line position, refer to the QTR Sensors Arduino Library for more details on line position.
  Serial.print(position);
  Serial.print("  ");
  int error = position - setPoint;
  Serial.print(error);
  Serial.print(" ");
  
  int integral=0;
  integral=integral+error;
  
  int motorSpeed = error/Kp +(error - lastError)/Kd+(integral)/Ki;
  lastError = error;

  int rightMotorSpeed = rightBaseSpeed + motorSpeed;
  int leftMotorSpeed = leftBaseSpeed - motorSpeed;
  
    if (rightMotorSpeed > rightMaxSpeed ) rightMotorSpeed = rightMaxSpeed; // prevent the motor from going beyond max speed
  if (leftMotorSpeed > leftMaxSpeed ) leftMotorSpeed = leftMaxSpeed; // prevent the motor from going beyond max speed
  if (rightMotorSpeed < 0) rightMotorSpeed = 0; // keep the motor speed positive
  if (leftMotorSpeed < 0) leftMotorSpeed = 0; // keep the motor speed positive
  
   {
// move forward with appropriate speeds
  digitalWrite(rightMotor1, HIGH);
  digitalWrite(rightMotor2, LOW);
  Serial.print(rightMotorSpeed);
 
  Serial.print(" ");
  Serial.print(leftMotorSpeed);
  Serial.println();
  analogWrite(rightMotorPWM, rightMotorSpeed);
  digitalWrite(leftMotor1, HIGH);
  digitalWrite(leftMotor2, LOW);
  analogWrite(leftMotorPWM, leftMotorSpeed);
}


   
}
void pid_control_loop(){
  

   int position = qtrrc.readLine(sensors); // get calibrated readings along with the line position, refer to the QTR Sensors Arduino Library for more details on line position.
  Serial.print(position);
  Serial.print("  ");
  int error = position - setPoint;
  Serial.print(error);
  Serial.print(" ");
  
  int integral=0;
  integral=integral+error;
  
  int motorSpeed = error*P+(error - lastError)*D+(integral)*I;
  lastError = error;

  int rightMotorSpeed = rightBaseSpeed_loop + motorSpeed;
  int leftMotorSpeed = leftBaseSpeed_loop - motorSpeed;
  
    if (rightMotorSpeed > rightMaxSpeed_loop ) rightMotorSpeed = rightMaxSpeed_loop; // prevent the motor from going beyond max speed
  if (leftMotorSpeed > leftMaxSpeed_loop ) leftMotorSpeed = leftMaxSpeed_loop; // prevent the motor from going beyond max speed
  if (rightMotorSpeed < 0) rightMotorSpeed = 0; // keep the motor speed positive
  if (leftMotorSpeed < 0) leftMotorSpeed = 0; // keep the motor speed positive
  
   {
// move forward with appropriate speeds
  digitalWrite(rightMotor1, HIGH);
  digitalWrite(rightMotor2, LOW);
  Serial.print(rightMotorSpeed);
 
  Serial.print(" ");
  Serial.print(leftMotorSpeed);
  Serial.println();
  analogWrite(rightMotorPWM, rightMotorSpeed);
  digitalWrite(leftMotor1, HIGH);
  digitalWrite(leftMotor2, LOW);
  analogWrite(leftMotorPWM, leftMotorSpeed);
}


   
}
  



void set_point(){
  for(int i=0;i<100;i++)
  {
    setPoint= qtrrc.readLine(sensors);
    delay(20);
  }
  
}


void straight_slight_turns(){

  if(!lc||!rc){
    digitalWrite(ledRed,HIGH);
    pid_control_loop();
   }
      else{
   digitalWrite(ledGreen,HIGH);
   PID_control();
      }



}
  


void reverse() {
  Serial.println("reverse");
  while (!(lff || rff)) {

    digitalWrite(rightMotor1, LOW);
    digitalWrite(rightMotor2, HIGH);
    analogWrite(rightMotorPWM, reverse_speed);
    digitalWrite(leftMotor1, LOW);
    digitalWrite(leftMotor2, HIGH);
    analogWrite(leftMotorPWM, reverse_speed);
    readSensor();
  }
  Stop();
  delay(500);
  if (rfff) {
    sharp_turn_left();

  } else if (rfff)
    sharp_turn_right();
}





void manual_calibration() {
 
int i;
for (i = 0; i < 100; i++)
{
qtrrc.calibrate(QTR_EMITTERS_ON);
delay(20);
}
 
if (DEBUG) {
Serial.begin(9600);
for (int i = 0; i < NUM_SENSORS; i++)
{
Serial.print(qtrrc.calibratedMinimumOn[i]);
Serial.print(' ');
}
Serial.println();
 
for (int i = 0; i < NUM_SENSORS; i++)
{
Serial.print(qtrrc.calibratedMaximumOn[i]);
Serial.print(' ');
}
Serial.println();
Serial.println();
}
}




void Stop() {


  digitalWrite(rightMotor1, HIGH);
  digitalWrite(rightMotor2, LOW);
  analogWrite(rightMotorPWM, 0);
  digitalWrite(leftMotor1, HIGH);
  digitalWrite(leftMotor2, LOW);
  analogWrite(leftMotorPWM, 0);

}




 void sharp_turn_right() {

  int position = qtrrc.readLine(sensors); // get calibrated readings along with the line position, refer to the QTR Sensors Arduino Library for more details on line position.
  Serial.print(position);
  boolean tc = position == setPoint;
  while (!(!lff && !rff && (lf || ln || lc || tc))) {
    digitalWrite(rightMotor1, HIGH);
    digitalWrite(rightMotor2, LOW);
    analogWrite(rightMotorPWM, 0);
    digitalWrite(leftMotor1, HIGH);
    digitalWrite(leftMotor2, LOW);
    analogWrite(leftMotorPWM, 150);
    Serial.println("Right");
    position = qtrrc.readLine(sensors);
    tc = position == setPoint;
    readSensor();
  }
}






void sharp_turn_left() {

  int position = qtrrc.readLine(sensors); // get calibrated readings along with the line position, refer to the QTR Sensors Arduino Library for more details on line position.
  Serial.print(position);
  boolean tc = position == setPoint;
  while (!(!lff && !rff && (rf || rn || rc || tc))) {
    digitalWrite(rightMotor1, HIGH);
    digitalWrite(rightMotor2, LOW);
    analogWrite(rightMotorPWM, 150);
    digitalWrite(leftMotor1, HIGH);
    digitalWrite(leftMotor2, LOW);
    analogWrite(leftMotorPWM, 0);
    readSensor();
    position = qtrrc.readLine(sensors);
    tc = position == setPoint;
    Serial.println("Left");

  }



}





int get_distance() {

  long duration, distance;
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = (duration / 2) / 29.1;

  if (Debug) {
    Serial.println(" distance is" );
    delay(200);
    Serial.println(distance);
    delay(1000);
  }
  return distance;
}
int Map() {

  int distance = get_distance();

  int  position = distance * (setPoint / 15);
  return position;

}





void readSensor(){

   qtrrc.read(sensorValues);
  if(Debug){
   for (unsigned char i = 0; i < NUM_SENSORS; i++)
  {
    Serial.print(sensorValues[i]);
    Serial.print('\t'); // tab to format the raw data into columns in the Serial monitor
  }
  delay(250);
  
  Serial.println();
  
  }

  lff=sensorValues[0]>=blackValue;
  lf=sensorValues[1]>=blackValue;
  ln=sensorValues[2]>=blackValue;
  lc=sensorValues[3]>=blackValue;
  rc=sensorValues[4]>=blackValue;
  rn=sensorValues[5]>=blackValue;
  rf=sensorValues[6]>=blackValue;
  rff=sensorValues[7]>=blackValue;
 
  
if(Debug)  {

     Serial.print(lfff);
    Serial.print('\t'); 
    Serial.print(lff);
    Serial.print('\t'); // tab to format the raw data into columns in the Serial monitor
    Serial.print(lf);
    Serial.print('\t');
    Serial.print(ln);
    Serial.print('\t');
    Serial.print(lc);
    Serial.print('\t');
    Serial.print(rc);
    Serial.print('\t');
    Serial.print(rn);
    Serial.print('\t');
    Serial.print(rf);
    Serial.print('\t');
    Serial.print(rff);
    Serial.print('\t'); 
    Serial.print(lfff);
    
 Serial.println();
 delay(250);
}
}


