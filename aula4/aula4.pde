
import processing.video.*;


// Câmera virtual
Capture video;

// Armazena cor do clique
color alvo = color(0, 0, 0);


void setup() {
  // Tamanho da tela
  size(640, 480);
  // FPS
  frameRate(30);
  // Modo de cor
  colorMode(RGB, 255, 255, 255, 100);

  // Inicializa a câmera
  video = new Capture(this, Capture.list()[0]);
  
  // Começa a puxar imagens
  video.start();  
  
  // Fundo preto
  background(0);
}


void draw() { 
  if (video.available()) {
    video.read();
    video.loadPixels();
 
     // Varre todos os pixels do video
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
      
        // Onde estamos?
        int loc = x + y*video.width;
      
        // Componentes do pixel atual
        float vermelho = red(video.pixels[loc]);
        float verde = green(video.pixels[loc]);
        float azul = blue(video.pixels[loc]);
        
        // Calcula a diferença entre a cor do alvo e a atual
        float dR = abs(vermelho - red(alvo));
        float dG = abs(verde - green(alvo));
        float dB = abs(azul - blue(alvo));
        
        int tolerancia = 25;
        if(dR < tolerancia && dG < tolerancia && dB < tolerancia) {
          // Muda a cor para branco
          set(x, y, color(255, 255, 255));
        }
        else {
          // Mantém a cor original
          set(x, y, color(vermelho, verde, azul));
        }
      }
    }
  }
}

// Função chamada quando o mouse é apertado
void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  float vermelho = red(video.pixels[loc]);
  float verde = green(video.pixels[loc]);
  float azul = blue(video.pixels[loc]);
  println("alvo: " + vermelho + ", " + verde + ", " + azul);
  alvo = color(vermelho, verde, azul);
}
