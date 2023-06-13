class Player {

  float x;
  float y;
  float baseSize = 30;
  float h = 30;
  float xSteps = 0;
  float ySteps = 0;
  float qtdPixelsSteps = 7;
  color fill;

  void setup() {
    x = width / 4;
    y = height / 2;
  }

  void draw() {
    x = x + xSteps;
    y = y + ySteps;

    fill(fill);
    ellipse(x, y, baseSize, h);
  }

  void collisionPreview(Ball localBall) {
    float d = dist(x, y, localBall.x, localBall.y);
    if (d < 35) {
      float dx = x - localBall.x;
      float dy = y - localBall.y;
      localBall.xRet = -dx * 0.4;
      localBall.yRet = -dy * 0.4;
    }
  }
}
