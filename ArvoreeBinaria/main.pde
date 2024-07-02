ArvoreBinaria arv = new ArvoreBinaria();

void setup(){
   size(1000, 900); 
}

void draw(){
  background(0);
  
  arv.mostrar();
}

void mouseClicked() {
  arv.insere((int)random(1000));
  
  //IMPLEMENTAÇÃO DOS MÉTODOS PARA PERCORRER ELEMENTOS
  println("Pré-Ordem:");
  arv.preOrdem();
  println("\nEm Ordem:");
  arv.emOrdem();
  println("\nPós-Ordem:");
  arv.posOrdem();
}
