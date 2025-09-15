//Week02_3_mousePressed_serial
import processing.serial.*//第一航 使用usb 的serial
Serial myPort;//第二行 宣告 usb 的Serial 變數myPort
void mousePressed(){
  myPort.write(' ');//第四行 mouse 按下時 就送 '' 出去
}
void setup(){
  size(400, 400);
  myPort = new Serial(this, "COM4", 9600);
}//剛跟你在arduino 裡設定 COM多少就多少
void draw(){
  if(mousePressed) background(#FF000);
  else background(#00FF00);
}
