import java.util.HashSet;

class Grafo {
  int numVertices;
  HashSet<PVector> matrizAdj;
  PVector[] posicoes; 
  PVector[] velocidades; 
  float raio = 10; 
  int[] coresPossiveis;
  int[] indexCores;
  
  Grafo(int numVertices) {
    this.numVertices = numVertices;
    matrizAdj = new HashSet<PVector>();
    posicoes = new PVector[numVertices];
    coresPossiveis = new int[numVertices];

    indexCores = coloreGrafo();
    adicionaAresta();
    inicializaPosicoes();

    for (int i = 0; i < numVertices; i++) {
      coresPossiveis[i] = color(random(255), random(255), random(255));
    }
  }
  
  void adicionaAresta() {
    int aresta;

    for (int i = 0; i < numVertices; i++) {
      for (int j = 0; j < numVertices; j++) {

        if (i != j) {
          aresta = random(1) > 0.5 ? int(random(1, 5)) : 0;

          if (aresta != 0) {
            if (i < j && !matrizAdj.contains(new PVector(i, j))) {
              matrizAdj.add(new PVector(i, j));
            }
          }
        }
      }
    }
  }
  
  void inicializaPosicoes() {
    float angulo = TWO_PI / (numVertices - 1);
    float raioCirculo = min(width, height) / 3;
    
    for (int i = 0; i < numVertices; i++) {
      float x = width / 2 + raioCirculo * cos((i) * angulo);
      float y = height / 2 + raioCirculo * sin((i) * angulo);
      posicoes[i] = new PVector(x, y);
    }
    // Posicao fixa do vertice 0
    posicoes[0] = new PVector(width / 2, height / 2);
  }
  
  void desenhar() {
    textAlign(CENTER);
    // Desenha as arestas
    stroke(0);
    strokeWeight(1);
    for (int i = 0; i < numVertices; i++) {
      for (int j = i + 1; j < numVertices; j++) {
        strokeWeight(1);
        PVector x = new PVector(i, j);
        if (matrizAdj.contains(x)) line(posicoes[i].x, posicoes[i].y, posicoes[j].x, posicoes[j].y);
      }
    }
    // Desenha os nos
    noStroke();
    for (int i = 0; i < numVertices; i++) {
       fill(coresPossiveis[indexCores[i]]);
      ellipse(posicoes[i].x, posicoes[i].y, raio * 2, raio * 2);
      fill(0);
      text(str(i), posicoes[i].x, posicoes[i].y+4);
    }
  }
  
  int[] coloreGrafo() {
    int[] cores = new int[numVertices];
    boolean[] coresDisp = new boolean[numVertices];

    for (int i = 0; i < numVertices; i++) {
      coresDisp[i] = true;
    }

    for (int v = 0; v < numVertices; v++) {
      for (int u = 0; u < numVertices; u++) {
        if (cores[u] != 0) {
          coresDisp[cores[u]] = false;
        }
      }

      for (int cor = 1; cor < numVertices; cor++) {
        if (coresDisp[cor] == true) {
          cores[v] = cor;
          break;
        }
      }

      for (int i = 0; i < numVertices; i++) {
        coresDisp[i] = true;
      }
    }
    return cores;
  }
}
