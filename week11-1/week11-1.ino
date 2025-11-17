//week11-1_arduino_serial_joystick_x_y_to_processing_better
//week10-7_arduino_serial_joystick_x_y_to_processing
//修自week10_5

void setup(){
  Serial.begin(9600);
  pinMode(2, INPUT_PULLUP);
  pinMode(8, OUTPUT);
}
int count = 0, totalX = 0, totalY = 0;
int x0 = 512, y0 = 512;
void loop(){
  delay(30);
  int x = analogRead(A2);
  int y = analogRead(A3);
  if(count<20) {
    totalX += x;
    totalY += y;
    count++;
    x0 = totalX / count;
    y0 = totalY / count;
  } 
//Serial.write(x/4);
//Serial.write(y/4);
  if (abs(x-x0) < 15) x = 128; //數值變化太小 直接放中間值128
  else x = (x-x0)/4+128;//有大的數值, 就剪掉中間值, 在除4, 在+1
  if (abs(y-0) < 15) y = 128; //數值變化太小 直接放中間值128
  else y = (y-y0)/4+128;//有大的數值, 就剪掉中間值, 在除4, 在+1
  Serial.write(x);
  Serial.write(y);
  if(x>200) tone(8, 784, 100);
  if(x<50) tone(8, 523, 100);
  if(y>200) tone(8, 659, 100);
  if(y<50) tone(8, 500, 100); //亂寫數字
}