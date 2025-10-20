//week07-1_arduino_blink

void setup() {
  pinMode(13, OUTPUT); // 把第13隻腳,能夠送出資料 OUTPUT
}

void loop() {
  // put your main code here, to run repeatedly:
  
  digitalWrite(13, HIGH); // 發亮
  delay(100);
  digitalWrite(13, LOW); // 暗掉
  delay(100);
  digitalWrite(13, HIGH);
  delay(100);
  digitalWrite(13, LOW);
  delay(100);
}
