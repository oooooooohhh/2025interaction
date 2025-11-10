//week10-3_arduino_analogRead_A3
//百joystick 的Y線 經由麵包版幫忙, 接到makeruno pin 3
//(不能接其他的, 因為要接有 小蟲 的符號代表 analog 訊號)
void setup() {
  pinMode(2, INPUT_pullup);
  pinMode(3, INPUT); //有小蟲符號, 代表analog訊號
  pinMode(8, OUTPUT); //發出聲音
}

void loop() {
  int now = analogRead(A3);
  if (now > 800) { //高
    tone(8, 523, 100);// 發出523的do
    dalay(100);
    tone(8, 784, 100);//發出784的so
    delay(100);
    
  }else if( now < 200) {
    tone(8, 784, 100);// 發出523的do
    dalay(100);
    tone(8, 523, 100);//發出784的so
    delay(200);
    



  }



  }

}
