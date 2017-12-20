int pin1 = A0; // sensor pin s
int pin2 = A1;
int pin3 = A2;
int pin4 = A3;


int val1;
int val2;
int val3;
int val4;

const int Motor1Pin1 = 3; // motor pins
const int Motor1Pin2 = 4;
const int Motor2Pin1 = 6;
const int Motor2Pin2 =7;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
 pinMode(Motor1Pin1, OUTPUT);   
  pinMode(Motor1Pin2, OUTPUT);   
  pinMode(Motor2Pin1, OUTPUT);   
  pinMode(Motor2Pin2, OUTPUT);
}

void loop() {

// black : val > 500
// white : val < 200
if ( val3>500) { moveForward();}

sensor_read();

if ( val1>500 ) { moveLeft();}

sensor_read();

if ( val4>500) { moveRight();}

sensor_read();

if (val1 < 200 && val2 < 200 && val3 < 200 && val4 < 200 ){ moveUturn();}

}



void moveForward(){
  
  analogWrite(Motor1Pin1, 150);
  analogWrite(Motor1Pin2, LOW);
  analogWrite(Motor2Pin1, 150);
  analogWrite(Motor2Pin2, LOW);
}

void moveBackward(){
  
  analogWrite(Motor1Pin1, LOW);
  analogWrite(Motor1Pin2, 150);
  analogWrite(Motor2Pin1, LOW);
  analogWrite(Motor2Pin2, 150);
}

void moveRight(){
  
  analogWrite(Motor1Pin2, LOW);
  analogWrite(Motor1Pin1, LOW);//
  analogWrite(Motor2Pin1, 150);
  analogWrite(Motor2Pin2,LOW); 
}

void moveLeft(){
  
  analogWrite(Motor1Pin2, LOW);
  analogWrite(Motor1Pin1, 150);
  analogWrite(Motor2Pin1, LOW);//
  analogWrite(Motor2Pin2, LOW);
}

void moveUturn(){
  
  analogWrite(Motor1Pin1, 150);
  analogWrite(Motor1Pin2, LOW);
  analogWrite(Motor2Pin1, LOW);
  analogWrite(Motor2Pin2, 150);
}


void sensor_read(){

val1 = analogRead(pin1);
val2 = analogRead(pin2);
val3 = analogRead(pin3);
val4 = analogRead(pin4);


}



