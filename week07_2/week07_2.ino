//week07-2_arduino_blink_blink

void setup() {
  pinMode(12, OUTPUT); // 把第13隻腳,能夠送出資料 OUTPUT
  pinMode(13, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(12, LOW);
  digitalWrite(13, HIGH); // 發亮
  delay(200);
  digitalWrite(13, LOW); // 暗掉
  digitalWrite(12, HIGH);
  delay(200);
}
