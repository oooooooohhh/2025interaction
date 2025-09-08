//week01_3_keyPressed_keyCode_LEFT_RIGHT
void setup(){
  size(500,500);
}

int x = 200, y = 250; //座標
void draw(){
  background(#FFFFAA);//淡黃色
  rect(x, y, 100, 50); //座標那邊畫方塊
  if(keyPressed && keyCode==LEFT) x-=3;//往左
  if(keyPressed && keyCode==RIGHT) x+=3;//往右
}//用方向鍵 來移動方塊
