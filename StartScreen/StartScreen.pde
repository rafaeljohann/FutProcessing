ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
TEXTBOX playerOneInput, playerTwoInput;
int colorText = color(0, 0, 0);
PImage trofeu;
int totalGols = 10;
PImage img;

Player player = new Player();
Player player2 = new Player();
Ball ball = new Ball();

float linha = 0;
int score = 0;
int score2 = 0;
int state = 0;
boolean startGame;
boolean endGame;
boolean inputsBlank;

void setup() {
    background(255, 255, 255);
    img = loadImage( "./img/gol.png" );
    size(1024, 760);
    playerOneInput = new TEXTBOX("NomePlayer1", true, width/2 - 150, 460, 300, 35);
    playerTwoInput = new TEXTBOX("NomePlayer2", true, width/2 - 150, 540, 300, 35);
    startScreen();
    textboxes.add(playerOneInput);
    textboxes.add(playerTwoInput);
    trofeu = loadImage("./img/trofeu.jpg");
    
    player.setup();
    player.x = width/4;
    player.y = height/2;
    player2.setup();
    player2.x = 256;
    player.x = 768;
    player.y = height/2;
    ball.setup();
}

void startScreen() {
    
    textSize (40);
    fill(0);
    text("FutProcessing!", (width - textWidth("FutProcessing!")) / 2, 39);
    fill(0);
    
    textSize(20);
    text("O primeiro a marcar 10 gols vence!", (width - textWidth("O primeiro a marcar 10 gols vence!")) / 2, 75);
    text("Digite o nome do player 1:", (width - textWidth("Digite o nome do player 1:")) / 2, 450);
    
    textSize(20);
    text("Digite o nome do player 2:", (width - textWidth("Digite o nome do player 2:")) / 2, 530);
    
    textSize(20);
    text("Teclas Player 1:", (width - textWidth("Teclas Player 1:")) / 2, 630);
    text("W S A D", (width - textWidth("W S A D")) / 2, 650);
    text("Teclas Player 2:", (width - textWidth("Teclas Player 2:")) / 2, 690);
    drawArrow(560, 700, 20, 90);
    drawArrow(480, 720, 20, 270);
    drawArrow(515, 710, 20, 180);
    drawArrow(525, 710, 20, 360);
}

void draw() {
    if (colorText == color(0, 0, 0)) {
       colorText = color(255, 255, 255); 
    } else {
      colorText = color(0, 0, 0);
    } 
    
    if (startGame) {
      game();
    } else if (endGame){
      endGame();
    } else {
      background(255);
      startScreen();
      delay(120);
      fill(colorText);
      textSize(30);
      text("Pressione ENTER para começar", (width - textWidth("Pressione ENTER para começar")) / 2, 350);
      for (TEXTBOX t : textboxes) {
        t.DRAW();
      }
      image(img, -50, 1, 350, 350);
    }
    
    
    if (inputsBlank) {
      text("Digite o nome dos players para prosseguir", (width - textWidth("Digite o nome dos players para prosseguir")) / 2, 400);
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
       inputsBlank = true;
     } else {
        inputsBlank = false;
        startGame = true;
        
        for (TEXTBOX t : textboxes) {
           t.selected = false; 
        }
        
     }
  }
   
  calculatePositionPlayers(key);
        
  if (key=='r') {
    ball.x = width/2;
    ball.y = height/2;
    ball.xRet = 0;
    ball.yRet = 0;
  }
  
   if(!startGame && endGame && key=='b'){
      score = 0;
      score2 = 0;
      endGame = false;
      player.setup();
      player.x = width/4;
      player.y = height/2;
      player2.setup();
      player2.x = 256;
      player.x = 768;
      player.y = height/2;
      ball.setup();
      ball.xRet = 0;
      ball.yRet = 0;
      playerOneInput.Text = "";
      playerTwoInput.Text = "";
  }
}

void calculatePositionPlayers(int keyPressed) {
     if (keyPressed=='w') {
    player2.ySteps = -player2.qtdPixelsSteps;
  }

  if (keyPressed=='s') {
    player2.ySteps = player2.qtdPixelsSteps;
  }
  
  if (keyPressed=='a') {
    player2.xSteps = -player2.qtdPixelsSteps;
  }

  if (keyPressed=='d') {
    player2.xSteps = player2.qtdPixelsSteps;
  }      
        
  if (keyPressed==CODED) {
    if (keyCode==UP) {
      player.ySteps = -player.qtdPixelsSteps;
    }

    if (keyCode==DOWN) {
      player.ySteps = player.qtdPixelsSteps;
    }
  
    if (keyCode==LEFT) {
      player.xSteps = -player.qtdPixelsSteps;
    }

    if (keyCode==RIGHT) {
      player.xSteps = player.qtdPixelsSteps;
    }
  }
  
}

  void keyReleased() {
    if(key=='w' || key=='s') {
      player2.ySteps = 0;
    }
  
    if (key=='a' || key=='d') {
      player2.xSteps = 0;
    }
  
    if (key==CODED) {
      if (keyCode==UP || keyCode==DOWN) {
        player.ySteps = 0;
      }
      if (keyCode==LEFT || keyCode==RIGHT) {
        player.xSteps = 0;
      }
    }
  }
    
void game() {
    background(46, 202, 29);

    for (linha=0; linha < height; linha = linha + 20) {
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
    rect(0, height/2 - 75, 20, 150);
    rect(width - 20, height/2 - 75, 20, 150);

    player.fill = color(235, 8, 8);
    player.draw();
    player2.fill = color(15, 180, 192);
    player2.draw();
    fill(255);
    ball.draw();
    player.collisionPreview(ball);
    player2.collisionPreview(ball);

    textSize(30);
    text(playerOneInput.Text, width*0.25, 70);
    text(score,width*0.25,30);
    text(score2,width*0.75,30);
    text(playerTwoInput.Text, width*0.75, 70);
    
    textSize(18);
    fill(0);
    text("Pressione R para recomeçar, caso a bola fique presa nas linhas do gramado", (width - textWidth("Pressione R para recomeçar, caso a bola fique presa nas linhas do gramado")) / 2, 100);
    fill(255);
    
    returnPlayerToCorrectSide();
    

    if (score == totalGols || score2 == totalGols){
      endGame = true;
      startGame = false;
    }
}

void returnPlayerToCorrectSide() {
      if (player2.x >= width/2) {
      player2.xSteps = -1;
    }

    if (player2.x <= 0) {
        player2.xSteps = 1;
    }

    if (player2.y >= height) {
        player2.ySteps = -1;
    }

    if (player2.y <= 0) {
        player2.ySteps = 1;
    }

    if (player.x <= width/2) {
        player.xSteps = 1;
    }

    if (player.x >= width) {
        player.xSteps = -1;
    }

    if (player.y >= height) {
        player.ySteps = -1;
    }

    if (player.y <= 0) {
        player.ySteps = 1;
    }
}


void endGame(){
  
    background (255);
   
    textSize (40);
    fill(0);
    TEXTBOX textboxPlayerVencedor;
    
    image(trofeu, width/2 - 250, 1, 500, 500);
    
    if (score == totalGols){
      textboxPlayerVencedor = playerOneInput;

    }else{
      textboxPlayerVencedor = playerTwoInput;
    }
    
    text("Jogador " + textboxPlayerVencedor.Text + " Vencedor!!" , (width - textWidth("Jogador " + textboxPlayerVencedor.Text + " Vencedor!!")) / 2, 550);
    text("RESULTADO", (width - textWidth("RESULTADO")) / 2, 650);
    text(playerOneInput.Text + " " + score + " X " + score2 + " " + playerTwoInput.Text,  (width - textWidth(playerOneInput.Text + " " + score + " X " + score2 + " " + playerTwoInput.Text)) / 2, 700);
      
    fill(0);
    textSize (15);
    text("Pressione B para iniciar novamente!", (width - textWidth("Pressione B para iniciar novamente!")) / 2, 730);
}
