Peixes[] aquario = new Peixes[10];
PVector zero = new PVector(0,0); // Vetor zero para inicialização
float centerX, centerY, bodyLength = 118, bodyHeight = 174, tailWidth, tailHeight;
color bodyColor;

void setup (){
    size (800,600);

    for(int i = 0; i < aquario.length; i++){
        //PVector pos = new PVector(random(-width/2,width/2), 0); // Posição aleatória
        PVector pos = new PVector(i*800/aquario.length, 0); // Posição distribuída
        PVector vel = new PVector(0, random(-2, 2)); // Velocidade aleatória
        PVector acel = zero.copy(); // Aceleração inicial é zero

        aquario[i] = new Peixes(); // Cria um novo corpo celeste
    }
}

void draw(){
    background(#8BA7F2);

}