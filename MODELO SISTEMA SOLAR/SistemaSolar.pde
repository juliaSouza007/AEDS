// Variáveis para definir o raio do círculo, o ângulo inicial e a velocidade angular
float r = 300, ang = 0, omega = 1;

// Configuração inicial do sketch
void setup (){
    size (600,600); // Define o tamanho da tela
}

// Função que é chamada continuamente para desenhar os elementos na tela
void draw(){
    translate(300,300); // Define o ponto central como (300,300)
    background(0); // Define o fundo da tela como preto

    // Desenha um círculo amarelo no centro
    fill(#FFD734);
    ellipse(0, 0, 150, 150);

    // Define a cor azul para o próximo círculo
    fill(#349BFF);

    // Calcula as coordenadas x e y com base no raio e no ângulo atual
    float x = r * cos(radians(ang));
    float y = r * sin(radians(ang));

    ang += omega; // Atualiza o ângulo adicionando a velocidade angular

    // Garante que o ângulo permaneça dentro do intervalo [0,360] graus
    if(ang > 360)
        ang -= 360;
    if(ang < 0)
        ang += 360;

    // Desenha um círculo na posição calculada
    ellipse (x, y, 30, 30);
}
