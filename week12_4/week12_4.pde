// week12_4
// 修正自 week12_3_dino_jump_part3_boardX_falling_move_x
// 恐龍跳跳跳
PImage img;

void setup(){
  size(300, 500);
  img=loadImage("dino.jpg");
}

// 定義四個板子的 X 座標和 Y 座標
// boardX[i] 是板子的左上角 X 座標
float []boardX={50,200,100,200};
// boardY[i] 是板子的左上角 Y 座標
float []boardY={100,200,300,400};

float x=200,y=400,dy=0,dx=0;

void draw(){
  background(255);
  
  // 設置一個布林變數來追蹤恐龍是否在空中
  boolean flying=true; 
  
  // 遍歷所有四個板子
  for(int i=0;i<4;i++){
    // 繪製板子 (寬度 100, 高度 5)
    rect(boardX[i],boardY[i],100,5);
    
    // 碰撞檢測：檢查恐龍是否落在第 i 塊板子上
    if(y+100<=boardY[i] && y+dy+100>=boardY[i] && boardX[i]<=x+100 && x<=boardX[i]+100){
      y=boardY[i]-100; // 鎖定恐龍底部到板子頂部
      dy=0;            // 垂直速度歸零
      flying=false;    // 恐龍不在空中了
    }
  }
  
  // 如果恐龍在空中
  if(flying){
    y+=dy;
    
    // 處理重力 (如果 y < 400，套用重力)
    // 注意: 這裡的 y<400 判斷是從原始程式碼繼承下來的，它其實是地面鎖定邏輯
    if(y<400) dy+=0.98; 
    else{
      dy=0;            // 鎖定在 y=400 的地面
      flying=false;    // 碰到地面，不在空中
    }
  }
  
  // 繪製恐龍 (寬 100, 高 100)
  image(img,x,y,100,100);
  
  x+=dx; // 套用水平速度
}

void keyPressed(){
  if(keyCode==UP) dy=-15;
  if(keyCode==LEFT) dx=-1;
  if(keyCode==RIGHT) dx=1;
}

void keyReleased(){
  if(keyCode==LEFT || keyCode==RIGHT) dx=0;
}
