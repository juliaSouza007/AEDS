class Discos {

  int l, h;
  int posX, posY;
  color cor;

  Discos (int l, int h, color cor) {
    this.l = l;
    this.h = h;
    this.cor = cor;
  }

  void mostraDiscos() {
    fill(cor);
    rect(posX - l/2, posY - h/2, l, h);
  }
  
  void atualizaDisco(int posX, int posY) {
    this.posX = posX;
    this.posY = posY;
  }
}
