// week12_5_coin
// week12_5_coins_falling_part1_PImage_image_y
// 接金幣 (1) 有金幣, (2) 掉下來
PImage imgCoin; // 把圖檔, 拉進程式裡

void setup(){
  size(300, 500);
  imgCoin = loadImage("coin.jpg");
}

float x = 0, y = 0;

void draw(){
  background(255);
  
  // 註解掉的程式碼，原意可能是用來測試滑鼠控制
  // image(imgCoin, mouseX, mouseY, 100, 100); 
  
  // 繪製掉落的金幣 (寬 100, 高 100)
  image(imgCoin, x, y, 100, 100);
  
  // 使金幣往下掉
  y += 3; 
}
