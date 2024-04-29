// Importando a classe LinkedList do pacote java.util
import java.util.LinkedList;

// Criando uma LinkedList para armazenar as bolas
LinkedList<Bola> listaBolas;

// Definição da classe Bola
class Bola {
    float x, y; // Coordenadas x e y da bola
    float vy, ay; // Velocidade vertical (vy) e aceleração vertical (ay) da bola
    float raio = 45; // Raio da bola
    
    // Construtor da classe Bola
    Bola (int x, int y){
        this.x = x; // Inicializa a coordenada x da bola
        this.y = y; // Inicializa a coordenada y da bola
        vy = 0; // Inicializa a velocidade vertical como 0
        ay = 0.4; // Define a aceleração vertical como 0.4
    }
    
    // Método para atualizar a posição da bola
    void atualizaBola(){
        vy = vy + ay; // Atualiza a velocidade vertical com a aceleração
        y = y + (int)vy; // Atualiza a posição vertical com base na velocidade
        
        // Verifica se a bola atingiu o chão e ajusta sua velocidade e posição
        if (y >= 500) {
            vy = -0.9 * vy; // Inverte a direção e reduz a velocidade vertical
            y = 500; // Mantém a bola no chão
        }
    }
    
    // Método para desenhar a bola
    void mostraBola (){
        // Desenha a bola
        noStroke();
        fill(#F5B400); // Cor laranja para a bola
        ellipse(x, y, raio, raio); // Desenha a bola como uma elipse
        
        // Detalhes da bola
        stroke(0); // Cor preta para os detalhes
        strokeWeight(2); // Define a espessura do traço como 2 pixels
        line(x, y + 45/2, x, y - 45/2); // Linha vertical para simular sombreamento
        line(x - 45/2, y, x + 45/2, y); // Linha horizontal para simular sombreamento
        noFill();
        // Curva para adicionar detalhes de brilho
        curve(x - 45, y, x - 15, y + 18, x - 15, y - 18, x - 120, y - 55);
        curve(x + 45, y, x + 15, y - 18, x + 15, y + 18, x + 120, y + 55);
        
        // Atualiza a posição da bola
        atualizaBola();
    }
}
