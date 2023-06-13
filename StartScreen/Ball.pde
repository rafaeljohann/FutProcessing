class Ball {

  float x;
  float y;
  float base = 20;
  float h = 20;
  float qtdPixelsSteps = 0;
  float xRet = qtdPixelsSteps;
  float yRet = qtdPixelsSteps;

  void setup() {
    x = width / 2;
    y = height / 2;
  }

  void draw() {
    x = x + xRet;
    y = y + yRet;
    xRet = xRet * 0.995;
    yRet = yRet * 0.995;

    if (x >= width) {
      xRet = -xRet;
    }

    if (x <= 0) {
      xRet = -xRet;
    }

    if (y >= height) {
      yRet = -yRet;
    }

    if (y <= 0) {
      yRet = -yRet;
    } else if (y > 309 && y < 459 && x >= width) {
      stroke(0);
      rect(87, 237, 0, 0);
      stroke(255);
      score = score + 1;
      x = width / 2 + 200;
      y = height / 2;
      xRet = 0;
      yRet = 0;
    } else if (y > 309 && y < 459 && x <= 0) {
      score2 = score2 + 1;
      x = width / 2 - 200;
      y = height / 2;
      xRet = 0;
      yRet = 0;
    }

    strokeWeight(2);
    fill(160, 162, 235);
    ellipse(x, y, base, h);
    fill(255);
  }
}
