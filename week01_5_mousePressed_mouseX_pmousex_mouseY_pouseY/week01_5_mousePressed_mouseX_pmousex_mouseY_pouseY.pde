//week01_5_mousePressed_mouseX_pmousex_mouseY_pouseY
void setup(){
  size(500, 500);
}
int x = 200, y = 250;
void draw(){
  background(#FFFFAA);
  if(mousePressed){//不管有沒有壓到四邊形都可以移動他
    x += mouseX - pmouseX;
    y += mouseY - pmouseY; 
}
  rect(x, y, 100, 50);
}
