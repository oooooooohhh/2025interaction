//week10-2_arduino_pin2_switch_tone_8_523_784_delay100
void setup() {
  pinMode(2, INPUT_PULLUP);//拉高,變成5V 真的按下去 變成0V(GND 接地)

}

void loop() {
  if(digitalRead(2)==LOW){// 如果pin2按下去
    tone(8, 523, 100);// 發出523的do
    dalay(100);
    tone(8, 784, 100);//發出784的so
    delay(100);


  }

}
