//week12-7_coin_falling_part3_
//修改自12-5
//接金幣(5)小人在下面接金幣 (6)得分!!!
PImage imgCoin;
void setup(){
  size(300, 500);
  imgCoin = loadImage("coin.jpg");
  for(int i=0;i<10;i++){
    x[i] = random(300-100);
    y[i] = -100 - random(1000);
  }
}
float [] x = new float[10];
float [] y = new float[10];
int score = 0;
int userX = 0150, userY = 450;
void draw(){
  background(255);
  for(int i=0;i<10;i++){
    rect(x[i]-1, y[i]-1, 102, 102);
    image(imgCoin, x[i], y[i], 100, 100);
    y[i] += 3; //往下掉
    if(dist(userX, userY, x[i]+50, y[i]+50) < 50){
      score += 100; //加分
      x[i] = random(300-100); //金幣重回到上面重生
      y[i] = -100 - random(200);
    }
    if(y[i]>500){
    x[i] = random(300-100); 
    y[i] = -100 - random(200);
    }
  }
  fill(255, 0, 0); //紅色的小人
  ellipse(userX, userY, 50, 10);
  if(keyPressed && keyCode==LEFT) userX--;
  if(keyPressed && keyCode==RIGHT) userX++;
  fill(0);
  text("Score: " + score, 200, 50);
}
 
