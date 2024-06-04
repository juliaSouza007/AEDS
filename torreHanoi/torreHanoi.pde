import java.util.Stack;

// Utilizando 3 torres - 3 pilhas
Stack<Integer>[] torres = new Stack[3];

int numDiscos = 5;
int lDisco = 50;
int hDisco = 20;
int lTorre = 10;
int hTorre = 200;
int entreTorres = 150;
int torreSelecionada = -1;

void setup() {
  size(600, 400);
  for (int i = 0; i < 3; i++) {
    torres[i] = new Stack<Integer>(); 
  }
  // Inicializa a primeira torre com discos aleatórios
  for (int i = numDiscos; i >= 1; i--) {
    torres[0].push(i); 
  }
}

void draw() {
  background(255);
  desenharTorres();
  desenharDiscos();
}

void desenharTorres() {
    fill(0);
    rect(2 * (lTorre + entreTorres), 400 - hTorre, lTorre, hTorre);
    rect(3 * (lTorre + entreTorres), 400 - hTorre, lTorre, hTorre);
    rect(1 * (lTorre + entreTorres), 400 - hTorre, lTorre, hTorre);
}

void desenharDiscos() {
  for (int i = 0; i < 3; i++) {
    int x = i * (lTorre + entreTorres) + lTorre / 2;
    int y = height - hTorre + hDisco;
    for (int disco : torres[i]) { 
      int largura = lDisco * disco;
      fill(255, 0, 0);
      rectMode(CENTER);
      rect(x, y, largura, hDisco);
      y -= hDisco;
    }
  }
}

int torreClicada(int mouseX) {
  for (int i = 1; i <= 3; i++) {
    int x = i * (lTorre + entreTorres);
    if (mouseX > x && mouseX < x + lTorre) {
      return i;
    }
  }
  return -1;
}

void mousePressed() {
  int torre = torreClicada(mouseX);
  if (torre != -1) {
    if (torreSelecionada == -1) {
      torreSelecionada = torre;
    } else {
      if (!torres[torreSelecionada].isEmpty() && (torres[torre].isEmpty() || torres[torreSelecionada].peek() < torres[torre].peek())) {
        torres[torre].push(torres[torreSelecionada].pop());
      }
      torreSelecionada = -1;
    }
  }
}
