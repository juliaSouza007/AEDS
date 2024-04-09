class Planeta {
   float dist, r, ang, omega; // Declaração das variáveis de instância da classe

   int cor; // Variável de cor para o planeta

   // Construtor da classe Planeta
   Planeta (float dist, float r, float ang, float omega){
       // Inicialização das variáveis com valores aleatórios
       this.dist=(float)random(width/2);
       this.ang= ang;
       this.omega= omega;
       this.r= random(10,50);
       // Geração de uma cor aleatória para o planeta
       this.cor = color((int)random(9999999), (int)random(256), (int)random(256));
   }

   // Método para atualizar a posição angular do planeta
   void update (){
       ang+=omega; // Atualiza o ângulo adicionando a velocidade angular
       // Garante que o ângulo permaneça dentro do intervalo [0,360] graus
       if(ang>360) ang -=360;
       if(ang<0) ang +=360;
   }

   // Método para exibir o planeta na tela
   void show (){
       fill(cor); // Define a cor de preenchimento do planeta

       // Calcula as coordenadas x e y com base no raio e no ângulo atual
       float x=r*cos(radians(ang));
       float y=r*sin(radians(ang));

       // Desenha o planeta como uma elipse centrada nas coordenadas calculadas
       ellipse (x, y, 30, 30);
   }
}
