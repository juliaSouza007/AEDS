class Organismo {
  PVector posicao;
  PVector velocidade;
  float[] dna;
  float vida;    // Indica a aptidão (quanto mais saúde, melhor)
  float velocidadeMax;
  float percepcao; // Distância máxima para detectar recursos
  float tamanho;
  int sexo;      // 0 para masculino, 1 para feminino
  
  Organismo(PVector posicao, float[] dna) {
    this.posicao = posicao.copy();
    this.dna = dna;
    this.vida = 100;
    
    // Fenótipo derivado do genótipo (DNA)
    this.velocidadeMax = map(dna[0], 0, 1, 2, 5);
    this.percepcao = map(dna[1], 0, 1, 50, 200);
    this.tamanho = map(dna[2], 0, 1, 4, 8);
    this.velocidade = PVector.random2D();
    
    // Define o sexo com base no DNA (metade da população é de cada sexo)
    this.sexo = dna.length == 4 ? (dna[3] < 0.5 ? 0 : 1) : (random(1) < 0.5 ? 0 : 1);
  }
  
  void atualiza() {
    // Movimento simples
    posicao.add(velocidade);
    // Consume energia ao se mover
    vida -= velocidadeMax / 10.0;
    
    // Limites da tela
    if (posicao.x > width) posicao.x = 0;
    if (posicao.x < 0) posicao.x = width;
    if (posicao.y > height) posicao.y = 0;
    if (posicao.y < 0) posicao.y = height;
  }
  
  void procuraComida() {
    PVector maisProximo = null;
    float dist = Float.MAX_VALUE;
    
    for (PVector r : comida) {
      float d = PVector.dist(posicao, r);
      if (d < dist && d < percepcao) {
        dist = d;
        maisProximo = r;
      }
    }
    
    if (maisProximo != null) {
      PVector desejado = PVector.sub(maisProximo, posicao);
      desejado.setMag(velocidadeMax);
      
      PVector direcao = PVector.sub(desejado, velocidade);
      velocidade.add(direcao);
      
      // Se alcançar o recurso, consome-o
      if (dist < tamanho) {
        vida += 20;
        comida.remove(maisProximo);
      }
    }
  }
  
  Organismo reproduzir(Organismo outro) {
    // Reproduz se estiver próximo de um organismo de sexo oposto
    if (podeReproduzir(outro) && random(1) < 0.01 && vida > 50 && outro.vida > 50) {
      float[] novoDna = new float[4];
      
      // Combina o DNA dos dois organismos (metade de cada)
      for (int k = 0; k < novoDna.length - 1; k++) {
        novoDna[k] = random(1) < 0.5 ? this.dna[k] : outro.dna[k];
      }
      
      // O sexo do novo organismo é aleatório
      novoDna[3] = random(1);
  
      // Mutação genética
      for (int k = 0; k < novoDna.length; k++) {
        if (random(1) < 0.001) {
          novoDna[k] = constrain(novoDna[k] + random(-0.1, 0.1), 0, 1);
        }
      }
      
      vida -= 10; // O organismo perde um pouco de vida ao se reproduzir
      
      // Log de reprodução
      println("Reprodução! Organismo de sexo " + (sexo == 0 ? "macho" : "fêmea") +
              " e organismo de sexo " + (outro.sexo == 0 ? "macho" : "fêmea") +
              " geraram um novo organismo de sexo " + (novoDna[3] < 0.5 ? "macho" : "fêmea") +
              " com DNA: " + novoDna[0] + ", " + novoDna[1] + ", " + novoDna[2] + ", " + novoDna[3]);
      
      return new Organismo(posicao, novoDna);
    }
    return null;
  }

  
  boolean morreu() {
    return vida <= 0;
  }
  
  void mostra() {
    stroke(0);
    
    if (sexo == 0) {
      fill(60, 100, 100); // Azul (macho)
    } else {
      fill(300, 100, 100); // Rosa (fêmea)
    }
    
    ellipse(posicao.x, posicao.y, tamanho, tamanho);
  }

  
  color cor(float valor) {
    valor = constrain(valor, 0, 100);
    float matiz = map(valor, 0, 100, 0, 120);
    return color(matiz, 100, 100);
  }
  
  // Verifica a reprodução com outro organismo
  boolean podeReproduzir(Organismo outro) {
    return sexo != outro.sexo && PVector.dist(posicao, outro.posicao) < tamanho + outro.tamanho;
  }
}
