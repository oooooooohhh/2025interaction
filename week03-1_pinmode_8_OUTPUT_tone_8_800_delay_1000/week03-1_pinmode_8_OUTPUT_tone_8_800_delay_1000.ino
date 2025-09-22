///week03-1_pinmode_8_OUTPUT_tone_8_800_delay_1000
void setup() {
  // put your setup code here, to run once:
  pinMode(8, OUTPUT);
  tone(8, 800, 200);
  delay(1000);
  tone(8, 800, 200);
  delay(1000);
  tone(8, 800, 200);
  delay(1000);
}

void loop() {
  // put your main code here, to run repeatedly:

}
