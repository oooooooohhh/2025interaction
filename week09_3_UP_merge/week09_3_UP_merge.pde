color [] c = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #EF7F63, #EF7F63};  // 2^1, 2^2, 2^3, 2^4...2^6
color [] c2 = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5};  // 背景顏色
int [] N = {0, 2, 4, 8, 16, 32}; // 對應的數字
int [][] B = {{0, 0, 0, 0}, {1, 2, 3, 4}, {5, 0, 0, 0}, {0, 0, 0, 0}};  // 初始棋盤

void setup() {
  size(420, 420);  // 設定視窗大小
}

void draw() {
  background(188, 174, 162); // 背景色
  for (int i = 0; i < 4; i++) {  // 左手i(對應y座標)
    for (int j = 0; j < 4; j++) {  // 右手j(對應x座標)
      int id = B[i][j];  // 對應的代碼
      fill(c[id]);
      noStroke();  // 不要外框
      rect(j * 100 + 10, i * 100 + 10, 90, 90, 5);  // 畫方格
      fill(c2[id]);  // 文字顏色
      textAlign(CENTER, CENTER);
      textSize(60);
      text(N[id], j * 100 + 55, i * 100 + 55);  // 顯示數字
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    for (int i = 0; i < 4; i++) {
      int now = 3;
      for (int j = 3; j >= 0; j--) {  // 從右往左找
        if (B[i][j] > 0) {  // 找到有數字
          B[i][now] = B[i][j];  // 移動數字到新的位置
          while (now < 3 && B[i][now + 1] == B[i][now]) {  // 檢查是否可以合併
            B[i][now + 1]++;  // 合併
            now++;
          }
          now--;  // 下一個位置
        }
      }
      // 清空未使用的格子
      for (int j = now; j >= 0; j--) {
        B[i][j] = 0;
      }
    }
  } else if (keyCode == LEFT) {
    for (int i = 0; i < 4; i++) {
      int now = 0;  // 初始化now
      for (int j = 0; j < 4; j++) {  // 從左往右找
        if (B[i][j] > 0) {  // 找到有數字
          B[i][now] = B[i][j];  // 移動數字到新的位置
          while (now < 3 && B[i][now + 1] == B[i][now]) {  // 檢查是否可以合併
            B[i][now + 1]++;  // 合併
            now++;
          }
          now--;  // 下一個位置
        }
      }
      // 清空未使用的格子
      for (int j = now; j < 4; j++) {
        B[i][j] = 0;
      }
    }
  } else if (keyCode == UP) {
     for (int j = 0; j < 4; j++) {  //j放外面
      int now = 0; //裡面now對應i
      for (int i = 0; i<4; i++) {  // i放裡面
        if (B[i][j] > 0) {  
          B[now][j] = B[i][j];  // 移動數字到新的位置
          while (now > 0 && B[now - 1][j] == B[now][j]) {  // 檢查是否可以合併
            B[now-1][j]++;  // 合併
            now--;
          }
          now++;  // 下一個位置
        }
      }
      // 清空未使用的格子
      for (int i=now; i>=0; i--) {
        B[i][j] = 0;
      }
    }
  } else if (keyCode == DOWN) {
    for (int j = 0; j < 4; j++) {  // 從下往上移動
      int now = 3;
      for (int i = 3; i >= 0; i--) {  // 從下往上找
        if (B[i][j] > 0) {  // 找到有數字
          B[now][j] = B[i][j];  // 移動數字到新的位置
          while (now > 0 && B[now - 1][j] == B[now][j]) {  // 檢查是否可以合併
            B[now - 1][j]++;  // 合併
            now--;
          }
          now++;  // 下一個位置
        }
      }
      // 清空未使用的格子
      for (int i = now; i >= 0; i--) {
        B[i][j] = 0;
      }
    }
  }
  genTwo();  // 生成新的數字
}

void genTwo() {
  int zero = 0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (B[i][j] == 0) zero++;  // 計算空白格子
    }
  }
  int ans = int(random(zero));  // 隨機選擇一個空白格
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (ans == 0) {
        B[i][j] = 1;  // 生成2的初始數字
        return;
      } else {
        ans--;
      }
    }
  }
}
