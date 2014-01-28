Alien[] myAliens;
Player myPlayer;
Bullet aBullet;


PImage[] myimages;
PImage playerimg;
PImage bulletimg;

void setup() {
  size(SCREENX,SCREENY);
  
  myAliens = new Alien[10];
  myimages = new PImage[10];
  
  playerimg = loadImage("playa.gif");
  myPlayer = new Player(playerimg);
  
  bulletimg = loadImage("bullet.gif");
  
  initArray(myAliens);
}

void initArray(Alien[] theArray) {
 int[] placement = new int[theArray.length];
 
 PImage testImg = loadImage("invader.GIF");
  
 for(int i = 0; i != placement.length; i++) {
    placement[i] = (MARGIN + 1) + (i*(testImg.width+20));
 }
  
  for(int i = 0; i != theArray.length; i++) {
    int r = (int) random(1,4);
    if(r==1) myimages[i] = loadImage("invader.GIF");
    if(r==2) myimages[i] = loadImage("invader2.gif");
    if(r==3) myimages[i] = loadImage("invader3.gif");
    theArray[i] = new Alien(placement[i], 10, i, myimages[i]);
  }
}

void draw() {
  background(0);

  myPlayer.move(mouseX);
  myPlayer.draw();
  
  if(aBullet != null) {
    aBullet.move();
    aBullet.draw();
    float colliderX = aBullet.getBX();
    float colliderY = aBullet.getBY();
    
    for(int i = 0; i != myAliens.length; i++) {
      float alienX = myAliens[i].getAlienX(i);
      float alienY = myAliens[i].getAlienY(i);
      
      if(alienY - colliderY < 10 && alienY - colliderY > -1 ){
        if(alienX - colliderX < 2 && alienX - colliderX > -25) {
           aBullet.deleteBullet();
           myAliens[i].explode(i); 
        }
       }
    }
  }
  
  for(int i = 0; i != myAliens.length; i++) {
    myAliens[i].move(i);
    myAliens[i].draw(i);
    if(randomexplode)
    myAliens[i].explode(i);
  }
}

void mousePressed() {
  if(aBullet == null) {
    float playerxpos = myPlayer.getX();
    int playerwidth = myPlayer.getWidth();
    float bulletpos = playerxpos + playerwidth/2 -2;
    aBullet = new Bullet(bulletimg, bulletpos);
    
    
  } else {
    float bulletypos = aBullet.getBY();
      if(bulletypos<0) {
        float playerxpos = myPlayer.getX();
        int playerwidth = myPlayer.getWidth();
        float bulletpos = playerxpos + playerwidth/2 -2;
        aBullet = new Bullet(bulletimg, bulletpos);
      }
    }
}


