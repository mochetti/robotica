PVector pos;
PVector vel = new PVector(0, 0);
PVector acel = new PVector(0, 1);

void setup() {
  size(400, 400);
  pos = new PVector(width/2, 0);
}
void draw() {
  background(0);
  if(pos.x > width || pos.x < 0) {
    vel.x = -1 * vel.x;
  }
  if(pos.y > height || pos.y < 0) {
    vel.y = -1 * vel.y;
  }
  
  vel.x = vel.x + acel.x;
  vel.y = vel.y + acel.y;
  pos.x = pos.x + vel.x;
  pos.y = pos.y + vel.y;

  circle(width/2, pos.y, 50);
}
