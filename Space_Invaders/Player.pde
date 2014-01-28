float pxpos; float pypos;

int pimgwidth; int pimgheight;


class Player {
  
  Player(PImage img) {
    pimgwidth = img.width;
    pimgheight = img.height;
    pypos = SCREENY - MARGIN - pimgheight;
  }
  
  void move(int x) {
    if(x>=SCREENX - pimgwidth) { pxpos = SCREENX - pimgwidth; }
    else {pxpos = x;}
  }
  
  void draw() {
    image(playerimg, pxpos, pypos);
  }
  
  float getX() {
    return pxpos;
  }
  
  int getWidth() {
    return pimgwidth;
  }
  
  float getY() {
    return pypos;
  }
    
}
  
