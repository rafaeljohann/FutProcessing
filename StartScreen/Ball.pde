class Ball
{
  float xBall;
  float yBall;
  float bBall = 25;
  float hBall = 25;
  float fart = 0;
  float xRet = fart;
  float yRet = fart;

  void setup() {
    xBall = width/2;
    yBall = height/2;
  }
    
    
    void draw() {
   
    xBall = xBall + xRet;
    yBall = yBall + yRet;
    xRet = xRet * 0.993;
    yRet = yRet * 0.993;
    
    if (xBall >= width) {
      xRet = -xRet;
    }
    
    if (xBall <= 0) {
      xRet = -xRet; 
    }
    
    if (yBall >= height) {
      yRet = -yRet;
    }
   System.out.println("xpkuk: " + xBall);
   System.out.println("ypkuk: " + yBall);
   if (yBall <= 0) {
     yRet = -yRet;
   }
    
    else if (yBall > 350 && yBall < 550  && xBall >= 1600) {
      stroke(0);
      rect(87, 237, 0, 0);
      stroke(255);
      println("Gol!");
      score = score +1;
      xBall = 1250;
      yBall = 450;
      xRet = 0;
      yRet = 0;
    }
    
    else if (yBall > 350 && yBall < 550 && xBall <= 0) {
      println("Gol!");
      score2 = score2 +1;
      xBall = 450;
      yBall = 450;
      xRet = 0;
      yRet = 0;
    }
    
      strokeWeight(2);
      fill(160, 162, 235);
      ellipse (xBall, yBall, bBall, hBall);
      fill(255);
    }
}
