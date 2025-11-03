import processing.serial.*;

Serial myPort;
color[] c = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #EF7F63, #EF7F63, #F67C5F, #F59563, #F2B179, #EDE0C8, #E6DBD0}; // 方格顏色
color[] c2 = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5, #FDF8F5}; // 文字顏色
int[] N = {0, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048}; // 數字
int[][] B = {{0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}, {0, 0, 0, 0}}; // 初始棋盤

void setup() {
  size(420, 420); // 設定視窗大小
  myPort = new Serial(this, "COM6", 9600); // 開啟串口，與硬體進行通信
}

void draw() {
  background(188, 174, 162); // 背景色
  for (int i = 0; i < 4; i++) {  // 遍歷每行
    for (int j = 0; j < 4; j++) {  // 遍歷每列
      int id = B[i][j];  // 取得對應的數字
      fill(c[id]);  // 設定方格顏色
      noStroke();  // 不顯示外框
      rect(j * 100 + 10, i * 100 + 10, 90, 90, 5);  // 畫出方格
      fill(c2[id]);  // 設定文字顏色
      textAlign(CENTER, CENTER);  // 文字置中
      textSize(60);  // 設定文字大小
      text(N[id], j * 100 + 55, i * 100 + 55);  // 顯示數字
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    myPort.write('R');
    moveRight();
  } else if (keyCode == LEFT) {
    myPort.write('L');
    moveLeft();
  } else if (keyCode == UP) {
    myPort.write('U');
    moveUp();
  } else if (keyCode == DOWN) {
    myPort.write('D');
    moveDown();
  }
  genTwo();  // 生成新的數字
}

void moveRight() {
  for (int i = 0; i < 4; i++) {
    int now = 3;
    for (int j = 3; j >= 0; j--) {
      if (B[i][j] > 0) {
        B[i][now] = B[i][j];
        while (now < 3 && B[i][now + 1] == B[i][now]) {
          B[i][now + 1]++;
          now++;
        }
        now--;
      }
    }
    for (int j = now; j >= 0; j--) {
      B[i][j] = 0;
    }
  }
}

void moveLeft() {
  for (int i = 0; i < 4; i++) {
    int now = 0;
    for (int j = 0; j < 4; j++) {
      if (B[i][j] > 0) {
        B[i][now] = B[i][j];
        while (now < 3 && B[i][now + 1] == B[i][now]) {
          B[i][now + 1]++;
          now++;
        }
        now--;
      }
    }
    for (int j = now; j < 4; j++) {
      B[i][j] = 0;
    }
  }
}

void moveUp() {
  for (int j = 0; j < 4; j++) {
    int now = 0;
    for (int i = 0; i < 4; i++) {
      if (B[i][j] > 0) {
        B[now][j] = B[i][j];
        while (now > 0 && B[now - 1][j] == B[now][j]) {
          B[now - 1][j]++;
          now--;
        }
        now++;
      }
    }
    for (int i = now; i >= 0; i--) {
      B[i][j] = 0;
    }
  }
}

void moveDown() {
  for (int j = 0; j < 4; j++) {
    int now = 3;
    for (int i = 3; i >= 0; i--) {
      if (B[i][j] > 0) {
        B[now][j] = B[i][j];
        while (now < 3 && B[now + 1][j] == B[now][j]) {
          B[now + 1][j]++;
          now++;
        }
        now--;
      }
    }
    for (int i = now; i >= 0; i--) {
      B[i][j] = 0;
    }
  }
}

void genTwo() {
  int zero = 0;
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (B[i][j] == 0) zero++;  // 計算空白格
    }
  }
  int ans = int(random(zero));  // 隨機選擇一個空格
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (ans == 0) {
        B[i][j] = 1;  // 隨機放置 2
        return;
      } else {
        ans--;
      }
    }
  }
}
