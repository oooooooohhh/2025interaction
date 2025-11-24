//week12_2_dino_jump_p2_board???
//恐龍跳跳跳(3)板子 (2)卡在板子上
PImage img;

void setup(){
  size(300, 500); // 畫布大小
  // 請確認您的專案資料夾中有名為 "dino.jpg" 的圖片
  img = loadImage("dino.jpg"); 
}

// 板子位置和大小
float boardX = 200, boardY = 400; // 板子 Y 座標為 400
// 恐龍位置和速度
float x = 200, y = 300, dx = 0, dy = 0; // 調整 y 讓恐龍從空中開始，方便測試落地
final float DINO_H = 100; // 恐龍高度 100

void draw(){
  background(255);
  // 繪製板子 (寬 100, 高 5)
  rect(boardX, boardY, 100, 5); 
  // 繪製恐龍 (寬 100, 高 100)
  image(img, x, y, DINO_H, DINO_H); 
  
  // 預設持續套用重力
  dy += 0.98; 
  
  // 1. **板子碰撞判斷** (優先判斷)
  if(
      y + DINO_H <= boardY &&      // 1. 恐龍底部目前在板子頂部之上
      y + dy + DINO_H >= boardY && // 2. 下一幀恐龍底部會穿越板子頂部
      boardX <= x + DINO_H &&      // 3. 恐龍右側在板子水平範圍內
      x <= boardX + 100            // 4. 恐龍左側在板子水平範圍內
  ){
    // 發生碰撞，鎖定在板子上
    y = boardY - DINO_H; // 將恐龍底部鎖定在板子頂部
    dy = 0;              // 垂直速度歸零
  } 
  
  // 2. **套用移動速度**
  y += dy;
  x += dx;
  
  // 3. **地面碰撞判斷** (假設畫布底部 height=500 是地面)
  if(y + DINO_H >= height){ 
    y = height - DINO_H; // 鎖定在地面
    dy = 0;              // 垂直速度歸零
  }

  // 4. **水平邊界限制**
  if (x < 0) x = 0;
  if (x + DINO_H > width) x = width - DINO_H;

  // 註：您的原始碼沒有這個，但這個更符合遊戲邏輯
  // if (dy == 0) dx = 0; // 落地後停止水平慣性 (可以選擇性加入)
}

void keyPressed(){
  // 修正：只有在靜止狀態 (dy==0) 或剛落地時才能跳躍
  if(dy == 0) {
    if(keyCode==UP) dy = -15;
  }
  
  // 左右移動允許
  if(keyCode==LEFT) dx = -1;
  if(keyCode==RIGHT) dx = +1;
}

void keyReleased(){
  // 放開就不要再左右移動了
  if(keyCode==LEFT || keyCode==RIGHT) dx = 0; 
}
