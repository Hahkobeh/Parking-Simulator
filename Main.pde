Street streatN;
Street streatS;
int full = 0;

void setup() {
  size(1200, 830);
}


void draw() {
  drawBackground();
}

void drawBackground() {
  background(27, 128, 45);
  fill(100);
  stroke(255);
  strokeWeight(5);
  rect(90, 200, 1020, 500);
  noStroke();
  fill(100);
  rect(570,190, 60, 20);
  rect(570,690, 60, 40);
  streatN = new Street(80);
  streatS = new Street(720);
  ParkingLot lot = new ParkingLot();
}
