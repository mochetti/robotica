// Vetor posição
PVector pos;
// Vetor velocidade
PVector vel = new PVector(0, 0);
// Velor aceleração
PVector acel = new PVector(0, 1);

// Limites de movimento
int velMax = 0;

// Configurações da raquete
int yRaquete;
int comprimentoRaquete = 100;

void setup() {
  // Tamanho da tela
  size(400, 400);
  
  // Inicializa a posição
  pos = new PVector(width/2, 0);
  yRaquete = height - 50;
}
void draw() {
  // Pinta o fundo
  background(0);
  
  // Checa colisão em x
  if(pos.x > width || pos.x < 0) {
    vel.x = -1 * vel.x;
  }
  // Atualiza velocidade em x
  else {
    vel.x = vel.x + acel.x;
  }
  // Checa colisão em y
  if(pos.y > yRaquete) {
    if(abs(pos.x-mouseX) < comprimentoRaquete/2) {
      // Rebate
      vel.y = -1 * vel.y;
      vel.x = random(10) - 5;
    }
    else {
      // Fim de jogo
      println("GAME OVER");
      delay(2000);
      pos = new PVector(width/2, 0);
      vel = new PVector(0, 0);
    }
  }
  // Atualiza velocidade em y
  else {
    vel.y = vel.y + acel.y;
  }
  
  // Atualiza a posição
  pos.x = pos.x + vel.x;
  pos.y = pos.y + vel.y;
  
  // Atualiza velMax
  if(vel.y > velMax) velMax = int(vel.y);
  
  // Define a cor em função da velocidade
  //float cor = map(abs(vel.y), 0, velMax, 0, 255);
  //fill(cor, 0, 0);
  // Desenha o círculo
  circle(pos.x, pos.y, 50);
    
  // Desenha a raquete
  rectMode(CENTER);
  rect(mouseX, yRaquete, comprimentoRaquete, 20);
}
