class Player
{ 
    float xBat;
    float yBat; 
    float bBat = 40;
    float hBat = 40; 
    float xBatFart = 0;
    float yBatFart = 0;
    float fartenWSAD = 7; 
    color fill;

    void setup() {
        xBat = width/4;
        yBat = height/2;
    }


    void draw() {
        xBat = xBat + xBatFart;
        yBat = yBat + yBatFart; 

        fill(fill);
        ellipse(xBat, yBat, bBat, hBat);
    }

    void collision(Ball localPuck) {
        float d = dist(xBat, yBat, localPuck.xBall, localPuck.yBall);
        if (d < 35) {
          float dx = xBat-localPuck.xBall;
          float dy = yBat-localPuck.yBall;
          localPuck.xRet = -dx*0.4;
          localPuck.yRet = -dy*0.4;
        }
    }
}
