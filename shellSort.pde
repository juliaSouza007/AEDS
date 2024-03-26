//inicializar a tela
int[][] grid; 
//array de numeros
int array[] = {5,15,7,9,2,3,12,11,6,1,8}; 

void setup() {
    size(800,800); // Define o tamanho da tela 
    frameRate(100); // Define a taxa de quadros por segundo
    thread("execute"); // Inicia uma nova thread chamando o método 
}

void execute(){
    while(true){
        ShellSort(array); // Chama a função ShellSort para ordenar o array
        break; // Sai do loop após a ordenação ser realizada uma vez
    }
}

void ShellSort (int[] array) {
    int n = array.length; // Obtém o tamanho do array
    int h = 1; // Inicializa o valor de h como 1
    
    // Define a sequência de valores de h para o algoritmo Shell Sort
    while (h < n/3) h = 3*h + 1;
    
    // Loop principal do algoritmo Shell Sort
    while (h >= 1) {
        // Itera sobre o array começando de h até o final
        for(int i = h; i <= n-1; i++) {
            int temp = array[i]; // Armazena o valor atual do elemento
            int j = i; // Inicializa j com o índice do elemento
            
            // Move os elementos maiores que temp para a direita
            // até encontrar a posição correta para inserir temp
            while (j >= h && array[j - h] > temp){
                array[j] = array[j - h];
                j -= h;
            }
            
            array[j] = temp; // Insere temp na posição correta
            delay(100); // Aguarda um tempo para continuar a ordenação
        }
        
        h /= 3; // Atualiza o valor de h de acordo com a sequência
    }
}

void draw() {
    background(#195BFC); // Define o plano de fundo como uma cor azul
    int p = 1; // Inicializa uma variável de posição
    
    // Itera sobre o array ordenado e desenha retângulos proporcionais aos valores dos elementos
    for(int v : array) {
      fill(#07E839); // Define a cor de preenchimento como verde
      // Desenha um retângulo com base no valor do elemento
      rect(width/n*(p - 1), height - height/20*v, width/n, height/20*v);
      p+=1; // Incrementa a variável de posição
    }
}
