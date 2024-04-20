class Peixes {
  // Variáveis para a posição e velocidade do peixe
  float posX, posY, velX, velY;

  // Variáveis para o tamanho do corpo do peixe
  float compCorpo, altCorpo;

  // Cor do peixe
  color cor;

  // Contador
  int contador;

  // Construtor
  Peixes() {
    posX = (float)random(width);
    posY = (float)random(alturaOndas, height);

    // Define o corpo do peixe
    noStroke();
    this.compCorpo = (float)random(30, 40);
    this.altCorpo = (float)random(20, 40);

    // Define a velocidade
    this.velX = (float)random(-50, 200);
    this.velY = (float)random(-50, 200);

    // Define a cor
    this.cor = color((int)random(225), (int)random(225), (int)random(225));
    this.contador = 0;
  }

  // Move o peixe
  void mover() {
    if (this.contador < 600) {
      posX += velX/frameRate;
      posY += velY/frameRate;

      // Trata colisões com as paredes
      if (posX >= width || posX < 0) velX = -velX;
      if (posY >= height || posY < alturaOndas) velY = -velY;

      this.contador++;
    } else {
      // Define uma nova velocidade
      this.velX = (float)random(80, 200);
      this.velY = (float)random(80, 200);
      this.contador = 0;
    }
  }

  // Desenha o peixe
  void desenhar() {
    fill(cor);

    // Desenha o corpo
    ellipse(posX, posY, compCorpo, altCorpo);

    // Desenha a cauda
    float larguraCauda = compCorpo/3;
    float alturaCauda = compCorpo/2;

    if (velX > 0) {
      // Cauda para a direita
      triangle((posX-compCorpo/2), posY,
        (posX-compCorpo/2-larguraCauda), (posY-alturaCauda),
        (posX-compCorpo/2-larguraCauda), (posY+alturaCauda));
    } else {
      // Cauda para a esquerda
      triangle((posX+compCorpo/2), posY,
        (posX+compCorpo/2+larguraCauda), (posY+alturaCauda),
        (posX+compCorpo/2+larguraCauda), (posY-alturaCauda));
    }
  }
}
