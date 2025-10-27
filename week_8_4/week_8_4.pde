//week08-4_2048_part4_????
//修改自 week08-3_2048_part3_void_keypressed_genTwo
//(1)按方向鍵, 板子往那個方向走
color [] c = {#CEC2B9, #EFE5DA, #EDE1CA, #EFB37E, #EF7F63, #EF7F63};//2^1, 2^2, 2^3, 2^4...2^6
color [] c2 = {#776E66, #776E66, #776E66, #FDF8F5, #FDF8F5, #FDF8F5};
int [] N = {0, 2, 4, 8, 16, 32}; //對應的數字
int [][] B = {{0,0,0,0}, {1,2,3,4}, {5,0,0,0}, {0,0,0,0}};
void keyPressed(){
  if (keyCode==RIGHT){
    for(int i=0; i<4; i++){//正常的迴圈,
      int now = 3;
      for(int j=3; j>=0; j--){
        if(B[i][j]>0){
          B[i][now] = B[i][j];
          now--;
        }  
      }//到這裡結束時, now的左邊, 將不要放東西, 都歸0
        for(int j=now; j>=0; j--){
          B[i][j] = 0;
        }  
    }
  }
  genTwo();
}
void genTwo(){
  int zero = 0;
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      if(B[i][j]==0) zero++;
    }
  }
  int ans = int(random(zero));
  for(int i=0; i<4; i++){
    for(int j=0; j<4; j++){
      if(ans==0){
        B[i][j] = 1;
        return;
      }else ans--;
    }
  }
}
void setup(){
  size(420,420); //讓邊線漂亮一點
}

void draw(){
  background(188, 174, 162); //色彩用滴管, 吸範例的圖
  for(int i=0; i<4; i++){ // 左手i(對應y座標)
    for(int j=0; j<4; j++){ //右手j(對應x座標)
    int id = B[i][j]; // 對應的代碼
       fill(c[id]);
       noStroke();//不要有黑線外框
       rect(j*100+10, i*100+10, 90, 90, 5);
       fill(c2[id]); //色彩用滴管,吸範例的圖
       textAlign(CENTER,CENTER);
       textSize(60);
       text( N[id], j*100+55, i*100+55);
  }
 }
}
