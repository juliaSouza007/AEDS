Grafo grafo;

void setup() {
  size(800, 600);
  frameRate(60);
  
  int n = 10;
  int[][] adj = new int[n][n];
  
  // Inicializa a matriz de adjacência com pesos aleatórios
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      if(i == j) {
        adj[i][j] = 0;
      } else {
        adj[i][j] = random(1) > 0.5 ? int(random(1, 5)) : 0;
        adj[j][i] = adj[i][j];
      }
    }
  }
  
  grafo = new Grafo(adj);
  
  // Calcula o menor caminho entre o vértice 0 e o vértice 5
  ArrayList<Integer> caminho = grafo.dijkstra(0, 5);
  println("Caminho mínimo: " + caminho);
}

void draw() {
  background(#AFF4FF);
  grafo.atualizar();
  grafo.desenhar();
}
