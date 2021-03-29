PVector robo = new PVector(0, 0);
PVector vel = new PVector(1, 1);

void setup() {
  size(400, 400);
}
void draw() {
  background(0);
  if(robo.x == width || robo.x == 0) {
    vel.x = -1 * vel.x;
  }
  if(robo.y == height || robo.y == 0) {
    vel.y = -1 * vel.y;
  }
  
  robo.x = robo.x + vel.x;
  robo.y = robo.y + vel.y;
   
  circle(robo.x, robo.y, 50);
}
