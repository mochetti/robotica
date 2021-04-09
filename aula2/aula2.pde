// Vetor posição
PVector pos;
// Vetor velocidade
PVector vel = new PVector(0, 0);
// Velor aceleração
PVector acel = new PVector(0, 1);

void setup() {
  // Tamanho da tela
  size(400, 400);
  // Inicializa a posição
  pos = new PVector(width/2, 0);
}
void draw() {
  // Pinta o fundo
  background(0);
  
  // Atualiza os vetores
  vel.x = vel.x + acel.x;
  vel.y = vel.y + acel.y;
  pos.x = pos.x + vel.x;
  pos.y = pos.y + vel.y;
  
  // Checa colisão
  if(pos.x > width || pos.x < 0) {
    vel.x = -1 * vel.x;
  }
  if(pos.y > height || pos.y < 0) {
    vel.y = -1 * vel.y;
  }
  
  println(vel.y);

  // Desenha o círculo
  circle(width/2, pos.y, 50);
}
