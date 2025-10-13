//week06-4_arduino_slow_jogging
void setup() {
  // put your setup code here, to run once:
  pinMode(8, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  tone(8, 700, 100); // 你自己決定聲音的HZ
  delay(333); // 等 0.333秒換下個音
  tone(8, 320, 60); // 你自己決定聲音的HZ
  delay(300); // 等 0.333秒換下一個音
}//每秒會叫 3 聲 一分鐘會叫 180次
