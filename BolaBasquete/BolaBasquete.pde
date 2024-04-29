// Tempo, começando em 0
float t = 0;

// Altura da bola, onde 0 é no chão
float y = 0;

// O tamanho da sombra aumenta conforme aumentamos y
float shadowSize;

// Como y é uma altura positiva, precisamos inverter
// para parecer certo no plano de coordenadas invertido
float correctedY;

void setup() {
    noStroke(); // Desativa o desenho de contorno para os elementos gráficos
    size(600, 600); // Define o tamanho da janela de visualização para 600x600 pixels
    
    // Inicializa uma lista vazia para armazenar as bolas
    listaBolas = new LinkedList<Bola>();
}

void mouseReleased() {
    // Adiciona uma nova bola à lista de bolas nas coordenadas onde o mouse foi liberado
    listaBolas.add(new Bola(mouseX, mouseY)); 
}

void desenhaCenario (){
    //quadra
    stroke(0);
    strokeWeight(5);
    fill(#064590);
    rect(-5, 350, 610, 280);
    fill(#0550AF);
    rect(-5, 400, 610, 202);
    
    //linhas da quadra
    stroke(0);
    strokeWeight(5);
    line(550, 402, 600, 600); // meio de campo
    line(132, 600, 110, 520); // lance livre
    line(0, 517, 108, 517);
    noFill();
    ellipse(593, 600, 200, 200); // meio de campo
    noStroke();
    fill(#FF0000);
    rect(0, 520, 108, 100); // linha do lance livre
    triangle(108, 600, 130, 600, 108, 520); // linha lance livre
    noFill();
    stroke(0);
    ellipse(0, 590, 382, 250);
    ellipse(108, 600, 170, 165); // garrafão
    
    //céu
    //sol
    noStroke();
    fill(#FFF415);
    ellipse(50, 50, 80, 80); 
    
    // nuvens
    noStroke();
    fill(#FFFFFA);
    ellipse(220, 80, 126, 97);
    ellipse(220 + 62, 80, 70, 60);
    ellipse(220 - 62, 80, 70, 60);  
    
    ellipse(450, 80, 126, 97);
    ellipse(450 + 62, 80, 70, 60);
    ellipse(450 - 62, 80, 70, 60); 
}

void draw() {
    background(#8BEFFF); // Limpa o fundo com uma cor azul clara
    desenhaCenario();    // Desenha o cenário do jogo
    
    // Itera sobre cada bola na lista de bolas
    for(int i = 0; i < listaBolas.size(); i++) {
        listaBolas.get(i).mostraBola(); // Chama o método mostraBola() de cada bola para desenhá-las na tela
    }
}
