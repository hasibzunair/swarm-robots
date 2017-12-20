
int x;


//motor pins
// pin at PWM for analogWrite
const int leftmotor1 = 5; // forward pin left
const int leftmotor2 = 6;
const int rightmotor1 = 9; // forward pin right
const int rightmotor2 = 10;

// different motor speeds
int velHigh = 170;
int velLow = 100;
int velFor = 200;
int velzero   = 0;

// runs good at 180 80 140 0



void setup() {

 //define motor pins
 pinMode(leftmotor1,OUTPUT);
 pinMode(leftmotor2,OUTPUT);
 pinMode(rightmotor1,OUTPUT);
 pinMode(rightmotor2,OUTPUT);
 
 
}

void loop() {
  
   movFor(); 


}
//function to move ,left, right ,forward, backward and stop!

void movFor(){

 analogWrite(leftmotor1,255);
 analogWrite(leftmotor2,velzero);
 analogWrite(rightmotor1,255);
 analogWrite(rightmotor2,velzero);
}

void movBac(){
 analogWrite(leftmotor1,velzero);
 analogWrite(leftmotor2,velHigh);
 analogWrite(rightmotor1,velzero);
 analogWrite(rightmotor2,velHigh);  
}

void movRig(){
 analogWrite(leftmotor1,velHigh);
 analogWrite(leftmotor2,velzero);
 analogWrite(rightmotor1,velLow);
 analogWrite(rightmotor2,velzero);
}

void movLef(){
 analogWrite(leftmotor1,velLow);
 analogWrite(leftmotor2,velzero);
 analogWrite(rightmotor1,velHigh);
 analogWrite(rightmotor2,velzero);
}

void movStop(){
 analogWrite(leftmotor1,velzero);
 analogWrite(leftmotor2,velzero);
 analogWrite(rightmotor1,velzero);
 analogWrite(rightmotor2,velzero);
}
