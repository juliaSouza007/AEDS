// Parâmetros da Simulação
int tamanhoDaPopulacao = 100;    // Tamanho da população
int geracao = 0;                // Contador de gerações
ArrayList<Organismo> populacao; // Lista de organismos
ArrayList<PVector> comida;      // Lista de recursos
int quantidadeRecursos = 10;   // Número de recursos no ambiente
int tempoDeVida = 1000;          // Duração de cada geração em frames
int contadorDeFrames = 0;       // Contador de frames

void setup() {
  size(800, 600);
  populacao = new ArrayList<Organismo>();
  comida = new ArrayList<PVector>();
  
  // Inicializa a população
  for (int i = 0; i < tamanhoDaPopulacao; i++) {
    float[] dna = new float[3];
    for(int k = 0; k < dna.length; k++) dna[k] = random(1);
    populacao.add(new Organismo(new PVector(random(width), random(height)), dna));
  }
  
  // Inicializa os recursos
  for (int i = 0; i < quantidadeRecursos; i++) {
    comida.add(new PVector(random(width), random(height)));
  }
}

void draw() {
  background(255);
  
  // Atualiza e desenha os recursos
  for (PVector r : comida) {
    fill(0);
    ellipse(r.x, r.y, 10, 10);
  }
  
  for (int i = populacao.size() - 1; i >= 0; i--) {
    Organismo o = populacao.get(i);
    o.procuraComida();
    o.atualiza();
    o.mostra();
    
    // Verifica se está morto
    if (o.morreu()) {
      populacao.remove(i);
    } else {
      // Tentativa de reprodução com outro organismo de sexo oposto
      for (int j = 0; j < populacao.size(); j++) {
        if (i != j) {
          Organismo outro = populacao.get(j);
          Organismo filho = o.reproduzir(outro);
          if (filho != null) {
            populacao.add(filho);
          }
        }
      }
    }
  }

  
  // Contador de frames para controlar as gerações
  contadorDeFrames++;
  if (contadorDeFrames >= tempoDeVida) {
    novaGeracao();
    contadorDeFrames = 0;
    geracao++;
  }
    
  surface.setTitle("Geração: " + geracao + " | " + "População: " + populacao.size() + " | " + "Recursos: " + comida.size());
}

void novaGeracao() {
  // Reabastece os recursos ao começar uma nova geração
  comida.clear();
  for (int i = 0; i < quantidadeRecursos; i++) {
    // Adiciona novos recursos em posições aleatórias
    comida.add(new PVector(random(width), random(height)));
  }

  // Se a população estiver muito pequena, adiciona novos organismos
  if (populacao.size() < 50) {
    for (int i = 0; i < 10; i++) {
      float[] dna = new float[3];
      for(int k = 0; k < dna.length; k++) dna[k] = random(1);
      populacao.add(new Organismo(new PVector(random(width), random(height)), dna));
    }
  }
}
