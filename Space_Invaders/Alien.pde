float SPEED = 1;
float FORWARD = SPEED;
float BACKWARD = -SPEED;
float DOWN = SPEED;
float STILL = 0;
float[] FALLS = new float[10];

float[] xpos = new float[10]; 
float[] ypos = new float[10];
int imgwidth; int imgheight;

float[] direction = new float[10];
int downinc;

int[] alive = new int[10];

class Alien {
 /* declare variables for alien position, direction of movement and appearance */

 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(int x, int y, int index, PImage alienImage){
   imgwidth = alienImage.width;
   imgheight = alienImage.height;
   downinc = 0;
   direction[index] = FORWARD;
   xpos[index] = x;
   ypos[index] = y;
   alive[index] = 1;
 }
  
 void move(int index){
   if(alive[index] == 1) {
     if(xpos[index]+imgwidth >= SCREENX - MARGIN) {
       direction[index] = STILL;
       DOWN = SPEED;
       ypos[index] += DOWN;
       downinc++;
       if(downinc >= imgheight/DOWN) {
         downinc = 0;
         direction[index] = BACKWARD;
       }
     } else if(xpos[index] <= 0 + MARGIN) {
       direction[index] = STILL;
       DOWN = SPEED;
       ypos[index] += DOWN;
       downinc++;
       if(downinc >= imgheight/DOWN) {
         downinc = 0;
         direction[index] = FORWARD;
       }
     } else {
         if(direction[index] > 0) direction[index] = FORWARD;
         if(direction[index] < 0) direction[index] = BACKWARD;
     }
     
     xpos[index] += direction[index];
   } else {
       FALLS[index] += .1;
       ypos[index] += FALLS[index];
   }
 }
  
  void draw(int index){
    image(myimages[index], xpos[index], ypos[index]);
  }
  
  void explode(int index) {
    int upper;
    if(randomexplode) {
      upper = 1000;
    } else {
      upper = 2;
    }
    int r = (int)random(1, upper);
    if(r == 1) {
      myimages[index] = loadImage("exploding.GIF");
      alive[index] = 0;
      SPEED += 0.5;
      FORWARD = SPEED;
      BACKWARD = -SPEED;
      DOWN = SPEED;
    }
  }
  
  float getAlienX(int index) {
    return xpos[index];
  }
  
  float getAlienY(int index) {
    return ypos[index];
  }
}


