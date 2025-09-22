//week03_7_arduino_serial_read_tone

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600); //設定usb傳輸速度
  pinMode(8, OUTPUT); // 8 叭 要會發聲
}

void serialEvent(){ //等待usb 的事件
  while (Serial.available()) { // 若有資料
    Serial.read();
    tone(8, 600, 200);

  }
}

void loop() {
  // put your main code here, to run repeatedly:

}
