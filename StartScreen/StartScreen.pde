ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
TEXTBOX playerOneInput, playerTwoInput;
int colorText = color(0, 0, 0);

void setup()
{
    background(255, 255, 255);
    size(1600, 900);
    playerOneInput = new TEXTBOX("NomePlayer1", true, 650, 560, 300, 35);
    playerTwoInput = new TEXTBOX("NomePlayer2", true, 650, 640, 300, 35);
    startScreen();
    textboxes.add(playerOneInput);
    textboxes.add(playerTwoInput);
}

void startScreen()
{
    textSize (40);
    fill(0);
    text("FutProcessing!", (width - textWidth("FutProcessing!")) / 2, 39);
    fill(0);
    //
    //text("Pressione ENTER para começar", (width - textWidth("Pressione ENTER para começar")) / 2, 450);
    
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
    

    //drawArrow(760, 750, 20, 270);
    //text("Pressione R se a bola estiver fora ou presa na tela", width/2, 314);
    //text("Teclas para o player 1: WSAD", width/2-335, 15);
    //text("Teclas para o player 2: Flechas", width/2-335, 30);
    
}

void draw() {
    if (colorText == color(0, 0, 0)) {
       colorText = color(255, 255, 255); 
    } else {
      colorText = color(0, 0, 0);
    }
    delay(120);
    fill(colorText);
    textSize(30);
    text("Pressione ENTER para começar", (width - textWidth("Pressione ENTER para começar")) / 2, 450);
    
    for (TEXTBOX t : textboxes) {
      t.DRAW();
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
      t.KEYPRESSED(key, (int)keyCode);
   }
   
   if ((int)keyCode == (int)ENTER) {
     //confirm();
   }
}
