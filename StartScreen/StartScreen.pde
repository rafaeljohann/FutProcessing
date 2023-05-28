ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
TEXTBOX playerOneInput, playerTwoInput;
int colorText = color(0, 0, 0);

Player player = new Player();
Player player2 = new Player();
Ball ball = new Ball();

float linha = 0;
int score = 0;
int score2 = 0;
int state = 0;
boolean startGame;

void setup() {
    background(255, 255, 255);
    size(1600, 900);
    playerOneInput = new TEXTBOX("NomePlayer1", true, 650, 560, 300, 35);
    playerTwoInput = new TEXTBOX("NomePlayer2", true, 650, 640, 300, 35);
    startScreen();
    textboxes.add(playerOneInput);
    textboxes.add(playerTwoInput);
    
    player.setup();
    player.xBat=width/4;
    player.yBat=height/2;
    player2.setup();
    player2.xBat = 400;
    player.xBat=1200;
    player.yBat=height/2;
    ball.setup();
}

void startScreen() {
    textSize (40);
    fill(0);
    text("FutProcessing!", (width - textWidth("FutProcessing!")) / 2, 39);
    fill(0);
    
    textSize(20);
    text("Digite o nome do player 1:", (width - textWidth("Digite o nome do player 1:")) / 2, 550);
    
    textSize(20);
    text("Digite o nome do player 2:", (width - textWidth("Digite o nome do player 2:")) / 2, 630);
    
    textSize(20);
    text("Teclas Player 1:", (width - textWidth("Teclas Player 1:")) / 2, 730);
    text("W S A D", (width - textWidth("W S A D")) / 2, 750);
    text("Teclas Player 2:", (width - textWidth("Teclas Player 2:")) / 2, 790);
    drawArrow(760, 800, 20, 90);
    drawArrow(780, 820, 20, 270);
    drawArrow(815, 810, 20, 180);
    drawArrow(825, 810, 20, 360);
}

void draw() {
    if (colorText == color(0, 0, 0)) {
       colorText = color(255, 255, 255); 
    } else {
      colorText = color(0, 0, 0);
    }
    
    if (startGame) {
      game();
    } else {
      delay(120);
      fill(colorText);
      textSize(30);
      text("Pressione ENTER para começar", (width - textWidth("Pressione ENTER para começar")) / 2, 450);
      
      for (TEXTBOX t : textboxes) {
        t.DRAW();
      }
    }

}

void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

void mousePressed() {
   for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
   }
}

void keyPressed() {
   for (TEXTBOX t : textboxes) {
     if (!startGame) {
       t.KEYPRESSED(key, (int)keyCode);
     }
   }
   
   if ((int)keyCode == (int)ENTER) {
     if (playerOneInput.Text == "" || playerTwoInput.Text == "") {
       textSize(20);
        text("Digite o nome dos players para prosseguir", (width - textWidth("Digite o nome dos players para prosseguir")) / 2, 500);
     } else {
        startGame = true;
     }
  }
   
  if (key=='w') {
    player2.yBatFart = -player2.fartenWSAD;
  }

  if (key=='s') {
    player2.yBatFart = player2.fartenWSAD;
  }
  
  if (key=='a') {
    player2.xBatFart = -player2.fartenWSAD;
  }

  if (key=='d') {
    player2.xBatFart = player2.fartenWSAD;
  }      
        
  if (key==CODED) {
    if (keyCode==UP) {
      player.yBatFart = -player.fartenWSAD;
    }

    if (keyCode==DOWN) {
      player.yBatFart = player.fartenWSAD;
    }
  
    if (keyCode==LEFT) {
      player.xBatFart = -player.fartenWSAD;
    }

    if (keyCode==RIGHT) {
      player.xBatFart = player.fartenWSAD;
    }
  }
        
  if (key=='r') {
    ball.xBall = width/2;
    ball.yBall = height/2;
  }
}

  void keyReleased() {
    if(key=='w' || key=='s') {
      player2.yBatFart = 0;
    }
  
    if (key=='a' || key=='d') {
      player2.xBatFart = 0;
    }
  
    if (key==CODED) {
      if (keyCode==UP || keyCode==DOWN) {
        player.yBatFart = 0;
      }
      if (keyCode==LEFT || keyCode==RIGHT) {
        player.xBatFart = 0;
      }
    }
  }
    
void game() {
    background(46, 202, 29);

    for (linha=0; linha < height; linha = linha + 20)
    {
        fill(255, 255, 255);
        stroke(255);
        strokeWeight(3);
        line(width/2, height, width/2, 0);
        stroke(0);
        strokeWeight(1);
    }
    
    strokeWeight(2);
    stroke(255);
    fill(46, 202, 29);
    ellipse(width/2, height/2, 120, 120);
    ellipse(width/2, height/2, 10, 10);
    strokeWeight(1);
    fill(255);
    stroke(0);
    rect(0, height/2 - 100, 20, 200);
    rect(1580, height/2 - 100, 20, 200);

    player.fill = color(235, 8, 8);
    player.draw();
    player2.fill = color(15, 180, 192);
    player2.draw();
    fill(255);
    ball.draw();
    player.collision(ball);
    player2.collision(ball);

    textSize(30);
    text(playerOneInput.Text, width*0.25, 70);
    text(score,width*0.25,30);
    text(score2,1200,30);
    text(playerTwoInput.Text, width*0.75, 70);
    
    textSize(18);
    fill(0);
    text("Pressione R para recomeçar, caso a bola ultrapasse as linhas do gramado", (width - textWidth("Pressione R para recomeçar, caso a bola ultrapasse as linhas do gramado")) / 2, 100);
    fill(255);
    
    if (player2.xBat >= width/2) {
      player2.xBatFart = -1;
    }

    if (player2.xBat <= 0) {
        player2.xBatFart = 1;
    }

    if (player2.yBat >= height) {
        player2.yBatFart = -1;
    }

    if (player2.yBat <= 0) {
        player2.yBatFart = 1;
    }

    if (player.xBat <= width/2) {
        player.xBatFart = 1;
    }

    if (player.xBat >= width) {
        player.xBatFart = -1;
    }

    if (player.yBat >= height) {
        player.yBatFart = -1;
    }

    if (player.yBat <= 0) {
        player.yBatFart = 1;
    }
}
