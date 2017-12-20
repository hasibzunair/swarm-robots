
//RC car with bluetooth communication

const int Motor1Pin1 = 8;
const int Motor1Pin2 = 9;
const int Motor2Pin2 =10;
const int Motor2Pin1 = 11;




char incByte;




void setup(){
  
  Serial.begin(9600);
  pinMode(Motor1Pin1, OUTPUT);   
  pinMode(Motor1Pin2, OUTPUT);   
  pinMode(Motor2Pin1, OUTPUT);   
  pinMode(Motor2Pin2, OUTPUT);
  
  
}



void loop(){
 
 
  if(Serial.available()>0){
    
    incByte = Serial.read();
    
  }
  
  
  Serial.println(incByte);
  
  //conditions from android device
  
 if(incByte == 'U'){  moveForward();  }
 
 if(incByte == 'D'){   moveBackward();  }
 
 if(incByte == 'L'){    moveLeft(); }
 
 if(incByte == 'R'){   moveRight();  }
 
 else if(incByte == 'S'){   moveStop();  }
 
  
  
}


//functions for different modes


void moveForward(){
  
  digitalWrite(Motor1Pin1, HIGH);
  digitalWrite(Motor1Pin2, LOW);
  digitalWrite(Motor2Pin1, HIGH);
  digitalWrite(Motor2Pin2, LOW);
}

void moveBackward(){
  
  digitalWrite(Motor1Pin1, LOW);
  digitalWrite(Motor1Pin2, HIGH);
  digitalWrite(Motor2Pin1, LOW);
  digitalWrite(Motor2Pin2, HIGH);
}

void moveLeft(){
  
  digitalWrite(Motor1Pin2, LOW);
  digitalWrite(Motor1Pin1, LOW);//
  digitalWrite(Motor2Pin1, HIGH);
  digitalWrite(Motor2Pin2,LOW); 
}

void moveRight(){
  
  digitalWrite(Motor1Pin2, LOW);
  digitalWrite(Motor1Pin1, HIGH);
  digitalWrite(Motor2Pin1, LOW);//
  digitalWrite(Motor2Pin2, LOW);
}

void moveStop(){
  
  digitalWrite(Motor1Pin1, LOW);
  digitalWrite(Motor1Pin2, LOW);
  digitalWrite(Motor2Pin1, LOW);
  digitalWrite(Motor2Pin2, LOW);
}

