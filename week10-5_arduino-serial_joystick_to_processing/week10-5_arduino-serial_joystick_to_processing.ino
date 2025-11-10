//week10-5_arduino-serial_joystick_to_processing
//修改自//week10-4_arduino_serial_monitor_joystick_serial_println
//但是不使用serial.println() 要改用 serial.write() 0-1023 vs. 0-255 差4被倍
void setup() {
 Serial.begin(9600);
 pinMode(2, INPUT_PULLUP);
 pinMode(8, OUTPUT);
}

void loop() {
  delay(100);
  int now = analogRead(A3) / 4; //小心 要除以4 才能順利
  Serial.write(now); //把0-255的值送出去
  if(now > 200) tone(8, 784, 100);
  if(now > 50) tone (, 523, 100);

}
