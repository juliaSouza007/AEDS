Grafo grafo;

void setup() {
  size(800, 600);
  frameRate(60);
  
  int n = 10;
  grafo = new Grafo(n);
}

void draw() {
  background(#B0D2FC);
  grafo.desenhar();
}
