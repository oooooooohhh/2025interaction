//week03-5_pin2_button_digitalRead_digitalWrite
//手動按按鈕, 看到燈慢慢改變now 之後,把now變亮
void setup() {
  // put your setup code here, to run once:
  pinMode(2, INPUT_PULLUP);//按鈕bottom是2號 沒接下去 就會拉高 
  for(int i=3; i<=13; i++){ //把pin 3, 4, 5........, 13 都射程output
    pinMode(i, OUTPUT); //都是可以發光發亮的
  }
}
int now=3;  //現在發亮的是pin 3
void loop() {
  // put your main code here, to run repeatedly:
  if(digitalRead(2)==LOW){ // 按下去囉!!
    now = now + 1;
    if(now>13) now = 3;
    for(int i=3; i<=13; i++){
      digitalWrite(i, LOW); //全部先清空變成 LOW 不亮
    }

    digitalWrite(now, HIGH); //now負責發亮
    delay(500); // 休息一下
  }
}
