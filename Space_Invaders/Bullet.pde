int bimgwidth; int bimgheight;

float bxpos; float bypos;


class Bullet {
  
  Bullet(PImage bimg, float bulletpos) {
    bimgwidth = bimg.width;
    bimgheight = bimg.height;
    bxpos = bulletpos;
    bypos = myPlayer.getY();
  }
  
  void move() {
    bypos -= 8;
  }
  
  void draw() {
    image(bulletimg, bxpos, bypos);
  }
  
  float getBX() {
    return bxpos;
  }
  
  float getBY() {
    return bypos;
  }
  
  void deleteBullet() {
    bypos = -10;
  }
}
