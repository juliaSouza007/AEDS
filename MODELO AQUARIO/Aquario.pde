// Array para armazenar os peixes
Peixes[] peixes = new Peixes[15];

// Variável para controlar a altura das ondas
int alturaOndas = 80;

void setup() {
    size(800, 600);

    // Inicializa os peixes
   for (int i = 0; i < peixes.length; i++) {
      peixes[i] = new Peixes();
   }
}

  // Desenha o aquário
void desenharAquario() {
    fill(255);
    float posX = 0;

    // Desenha as ondas
    stroke(255);
    for (int i = 0; i < width; i++) {
      ellipse(posX, 0, 120, alturaOndas);
      posX += alturaOndas;
    }
    
    // Desenha ornamentos
      // Desenha o castelo
      int x = 10;
      int y = 400;
      
      stroke(#000000);
      strokeWeight(1);
      
      fill(#757977);
      rect(x, y, 100, 300); //torre 1
      rect(x + 100, y + 100, 100, 150);  // meio
      rect(x + 200, y, 100, 300); //torre 2
      
      //tijolinhos torre 1
      rect(x, y - 20, 20, 20); 
      rect(x + 40, y - 20, 20, 20);
      rect(x + 80, y - 20, 20, 20);
      
      //tijolinhos torre 2
      rect(x + 200, y - 20, 20, 20);
      rect(x + 240, y - 20, 20, 20);
      rect(x + 280, y - 20, 20, 20);
      
      //porta
      fill(#907029);
      rect(x + 130, y + 120, 40, 80);
      
      // Desenha o arco
      int pX = 600;
      int pY = 600;
      
      fill(#89D2F7);
      stroke(#3E9524);
      strokeWeight(30);
      ellipse(pX, pY, 200, 500);
}

void draw() {
    background(#89D2F7);

    // Desenha o aquário
    desenharAquario();

    // Desenha os peixes
    noStroke();
    for (int i = 0; i < peixes.length; i++) {
      peixes[i].mover();
      peixes[i].desenhar();
    }
}
