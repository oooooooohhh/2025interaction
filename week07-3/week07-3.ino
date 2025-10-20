//week07-3_arduino_blink_blink
//7-2修改版
//小心, 有一隻腳要接GND 另一隻要接13
//小心, 有一隻腳要接GND 另一隻要接12
//小心, 有一隻腳要接GND 另一隻要接11(多這行)
//小心, 有一隻腳要接GND 另一隻要接10(多這行)
void setup() {
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT); // 把第13隻腳,能夠送出資料 OUTPUT
  pinMode(13, OUTPUT);
}

void loop() {
  for(int i = 10; i <= 13; i++){

    digitalWrite(i-1, LOW);
    digitalWrite(i, HIGH);
    digitalWrite(i+1,LOW);
    delay(500);

  }
}
