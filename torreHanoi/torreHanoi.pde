import java.util.Stack;

int numDiscos = 5;
int h = 35;
int tPosY = 60;
int posX1 = 150;
int posX2 = 300;
int posX3 = 450;

Stack<Discos> torre1;
Stack<Discos> torre2;
Stack<Discos> torre3;

boolean escolha;
Discos buffer;

Botao restart;
Botao exitb;
Botao play;

boolean mostrarTelaInicial = true;  // Variável de estado para controlar a tela inicial

void setup() {
  size(600, 400);

  torre1 = iniciarTorre();
  torre2 = new Stack<Discos>();
  torre3 = new Stack<Discos>();

  escolha = false;
  
  restart = new Botao(width/2+80, height-80, 130, 45, #745EB7, #1E0667, "RESTART", #030303, 30);
  exitb = new Botao(width/2-200, height-80, 130, 45, #745EB7, #1E0667, "EXIT", #030303, 30);
  play = new Botao(width/2-130/2, height-80, 130, 45, #745EB7, #1E0667, "PLAY", #030303, 30);
  
}

void draw() {
  background(#CEBFFC);
  noStroke();
  
  if (mostrarTelaInicial) {
    // Exibir a tela inicial
    play.Show();
    play.Selecionado();

    if (play.pressed) {
      mostrarTelaInicial = false;  // Troca para a tela do jogo
      play.pressed = false; // Redefine o estado do botão play
    }

    // Texto
    textSize(50);
    textAlign(CENTER);
    fill(#745EB7);
    rect(width/2-200, 50, 400, 70);
    rect(width/2-220, 60, 440, 50);
    fill(0,0,0);
    text("TORRE DE HANOI", width/2, 100);

    fill(0, 0, 0);
    textSize(25);
    text("REGRAS DO JOGO:", width/2, 160);
    text("Apenas o disco do topo pode ser movido.", width/2, 200);
    text("Um disco maior não pode ser colocado em", width/2, 235);
    text(" cima de um disco menor.", width/2, 255);
  } else {
    // Exibir o jogo
    fill(0, 0, 0);
    rect(posX1, tPosY, 15, 220);
    rect(posX2, tPosY, 15, 220);
    rect(posX3, tPosY, 15, 220);

    rect(50, 280, 500, 15);

    mostrarTorre(torre1, posX1);
    mostrarTorre(torre2, posX2);
    mostrarTorre(torre3, posX3);

    selecionado(torre1);
    selecionado(torre2);
    selecionado(torre3);

    if (escolha) {
      buffer.atualizaDisco(mouseX, mouseY);
      buffer.mostraDiscos();

      selecionarTorre(torre1, posX1);
      selecionarTorre(torre2, posX2);
      selecionarTorre(torre3, posX3);
    }

    restart.Show();
    restart.Selecionado();

    exitb.Show();
    exitb.Selecionado();

    if (restart.pressed) {
      limparTorre(torre1);
      limparTorre(torre2);
      limparTorre(torre3);
      buffer = null;
      escolha = false;

      torre1 = iniciarTorre();

      restart.pressed = false;
    }

    if (exitb.pressed) {
      exit();
    }
  }
}

void mostrarTorre(Stack<Discos> torre, int posX) {
  int i = 0;

  for (Discos discos : torre) {
    discos.atualizaDisco(posX + 5, 262 - i);
    discos.mostraDiscos();

    i = i + 35;
  }
}

void selecionado(Stack<Discos> torre) {
  if (!torre.empty()) {
    Discos ultimo = torre.peek();

    if ((mouseX >= ultimo.posX-ultimo.l/2 && mouseX <= ultimo.posX+ultimo.l/2) && (mouseY >= ultimo.posY-ultimo.h/2 && mouseY <= ultimo.posY+ultimo.h/2)) {
      if (mousePressed  && escolha == false) {
        buffer = torre.pop();
        escolha = true;
      }
    }
  }
}

void selecionarTorre(Stack<Discos> torre, int posX) {

  if ((mouseX >= posX-30 && mouseX <= posX+40) && (mouseY >= tPosY-30 && mouseY <= tPosY+25)) {
    fill(#866827);

    if (!torre.empty()) {
      Discos ultimo = torre.peek();

      if (mousePressed && ultimo.l > buffer.l) {
        torre.push(buffer);
        escolha = false;
      }
    } else {
      if (mousePressed) {
        torre.push(buffer);
        escolha = false;
      }
    }
  }
}

Stack<Discos> iniciarTorre() {
  Stack<Discos> torre = new Stack<Discos>();

  for (int i = 0; i < numDiscos; i++) {
    Discos newDiscos = new Discos((int)random(80, 150), h, color(0, 0, random(255)));

    torre.push(newDiscos);
  }

  return torre;
}

void limparTorre(Stack<Discos> torre) {
  while (!torre.empty()) {
    torre.pop();
  }
}
