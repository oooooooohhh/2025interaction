//week09-5_arduino_C4_G3_A3_B3
#DEFINE NOTE_C4 262

#DEFINE NOTE_G3 196

#DEFINE NOTE_A3 220

#DEFINE NOTE_B3 247

void setup() {

  Serial.begin(9600);

  pinMode(8 OUtPUT);// 發生音的8

  tone(8, 784, 100);//聲音So

  delay(100);

  tone(8, 196, 100);//Do

  delay(100);

}



void serialEvent(){

  while(Serial.available()){

    char now = Serial.read();

    if(now=='R'){

      tone(8,262,100);

      delay(100);

      

    }else if(now=='L'){

      tone(8,196,100);

      delay(100);

      

    }else if(now=='U'){

      tone(8,220,100);

      delay(100);

      

    }else if(now=='D'){

      tone(8,247,100);

      delay(100);

    }   

 	





    

  }





}

void loop() {

  // put your main code here, to run repeatedly:



}