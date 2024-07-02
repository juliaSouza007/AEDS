class No {
  int valor;
  No esq;
  No dir;

  //nós da esquerda e da direita
  No(int valor) {
    this.valor = valor;
    esq = null;
    dir = null;
  }
}

class ArvoreBinaria {
  No raiz;

  ArvoreBinaria() {
    raiz = null;
  }

  void insere(int valor) {
    raiz = insereRec(raiz, valor);
  }

  private No insereRec(No raiz, int valor) {
    if (raiz == null) {
      raiz = new No(valor);
      return raiz;
    }

    if (valor < raiz.valor) {
      if (raiz.esq == null) {
        raiz.esq = new No(valor);
      } else {
        raiz.esq = insereRec(raiz.esq, valor);
      }
    } else if (valor > raiz.valor) {
      if (raiz.dir == null) {
        raiz.dir = new No(valor);
      } else {
        raiz.dir = insereRec(raiz.dir, valor);
      }
    }

    return raiz;
  }

  void mostrar() {
    mostrarArvore(raiz, width / 2, 40, width / 4);
  }

  private void mostrarArvore(No raiz, float x, float y, float xOffset) {
    if (raiz != null) {
      if (raiz.esq != null) {
        line(x, y, x - xOffset, y + 60);
        mostrarArvore(raiz.esq, x - xOffset, y + 60, xOffset / 2);
      }

      if (raiz.dir != null) {
        line(x, y, x + xOffset, y + 60);
        mostrarArvore(raiz.dir, x + xOffset, y + 60, xOffset / 2);
      }

      stroke(255);
      fill(#021FBF);
      ellipse(x, y, 30, 30);
      fill(255);
      textAlign(CENTER, CENTER);
      text(raiz.valor, x, y);
    }
  }
    //PRÉ-ORDEM: visita a raiz, o filho da esquerda e o filho da direita
    //RAIZ-ESQUERDA-DIREITA
    
    void preOrdem() {
      preOrdemRec(raiz);
    }
  
    private void preOrdemRec(No no) {
      if (no != null) {
        print(no.valor + " ");
        preOrdemRec(no.esq);
        preOrdemRec(no.dir);
      }
    }
    
    //EM-ORDEM: visita o filho da esquerda, a raiz e o filho da direita
    //ESQUERDA-RAIZ-ESQUERDA
    
    void emOrdem() {
      emOrdemRec(raiz);
    }
  
    private void emOrdemRec(No no) {
      if (no != null) {
        emOrdemRec(no.esq);
        print(no.valor + " ");
        emOrdemRec(no.dir);
      }
    }
    
    //PÓS-ORDEM: visita o filho da esquerda, o filho da direita e a raiz
    //ESQUERDA-DIREITA-RAIZ
     void posOrdem() {
      posOrdemRec(raiz);
    }
  
    private void posOrdemRec(No no) {
      if (no != null) {
        posOrdemRec(no.esq);
        posOrdemRec(no.dir);
        print(no.valor + " ");
    }
  }
}
