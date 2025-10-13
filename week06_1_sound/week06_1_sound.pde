//wee06_1_sound_library
//file-preference 自行改大一點


import processing.sound.*;
SoundFile sound;
void setup(){
  
  size(500, 400);
  sound = new SoundFile(this, "music.mp3"); //老師把mp3傳給你 我們把她拉到程式裡
  sound.play();
}
void draw(){



}
