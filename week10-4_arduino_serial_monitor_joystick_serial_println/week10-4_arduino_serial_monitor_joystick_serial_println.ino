//week10-4_arduino_serial_monitor_joystick_serial_println
//修改自week10-3-arduino_analogRead_A3
//把joystick的y的線 經由麵包版幫接到a3

void setup() {
  Serial.begin(9600); 開啟usb傳輸
  pinMode(2, INPUT_pullup);
  pinMode(8, OUTPUT); //發出聲音
}

void loop() { 一秒鐘會跑 1000hz
  delay(100); //慢一點procesing來不及處理, 眼睛看不到
  int now = analogRead(A3);
  Serial.println(now);
  //想利用serial Monitor 來看看他會送出甚麼建訊號

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
