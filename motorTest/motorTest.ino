//int x = 2000;
//sheild 1


//motor pins
// pin at PWM for digitalWrite
const int leftmotor1 = 2;//6 // forward pin left
const int leftmotor2 = 6;//2
const int rightmotor1 = 4;//4 // forward pin right
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

void loop() {
  
 /* if(Serial.available()>0){
    
    incByte = Serial.read();
    
  }
  
  
  //Serial.println(incByte);
  
  //conditions from android device
  
 if(incByte == 'U'){  movFor();  }
 
 if(incByte == 'D'){   movBac();  }
 
 if(incByte == 'L'){    movLef(); }
 
 if(incByte == 'R'){   movRig();  }
 
 else if(incByte == 'S'){   movStop();  }
 
  */

movFor();
delay(2000);
movBac();
delay(2000);
movLef();
delay(2000);
movRig();
delay(2000);   


}
//function to move ,left, right ,forward, backward and stop!

void movFor(){
 
 digitalWrite(leftmotor1,HIGH);
 digitalWrite(leftmotor2,LOW);
 digitalWrite(rightmotor1,HIGH);
 digitalWrite(rightmotor2,LOW); 
}

void movBac(){

 digitalWrite(leftmotor2,HIGH);
 digitalWrite(leftmotor1,LOW);
 digitalWrite(rightmotor2,HIGH);
 digitalWrite(rightmotor1,LOW);  
}

void movRig(){
 digitalWrite(leftmotor1,HIGH);
 digitalWrite(leftmotor2,LOW);
 digitalWrite(rightmotor1,LOW);
 digitalWrite(rightmotor2,HIGH);
}

void movLef(){
 digitalWrite(leftmotor1,LOW);
 digitalWrite(leftmotor2,HIGH);
 digitalWrite(rightmotor1,HIGH);
 digitalWrite(rightmotor2,LOW);
}

void movStop(){
 digitalWrite(leftmotor1,LOW);
 digitalWrite(leftmotor2,LOW);
 digitalWrite(rightmotor1,LOW);
 digitalWrite(rightmotor2,LOW);
}
