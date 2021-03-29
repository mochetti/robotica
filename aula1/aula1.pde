int batata = 0;
int chuchu = 1000;
void setup() {
  size(800, 800);  
}
void draw() {
  batata = batata + 1;
  chuchu = chuchu - 1;
  background(0, 237, 235);
  circle(batata, chuchu, chuchu);
  rect(100 + batata, chuchu, chuchu, 200);
}
