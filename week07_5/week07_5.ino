//week07-5_arduino_analogWrite_rgb_led

void setup() {
  pinMode(3, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(5, OUTPUT);
  pinMode(11, OUTPUT);
  //這些特別的腳 分別是 3 5 6 9 10 11 共6腳 都可控制他亮暗程度
}

void loop() {
  analogWrite(6, 0) ; //藍色關掉
  analogWrite(3, 255) ; // 最亮的紅色
  delay(500); // 每0.5秒
  analogWrite(3, 0) ; //紅色關掉
  analogWrite(5, 255) ; //最高綠色
  delay(500) ;
  analogWrite(5, 0) ; //綠色關掉
  analogWrite(6, 255) ; //最高藍色
  delay(500) ;
}
