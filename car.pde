//spawncars() spawns all cars randomly behind the left side of the window in a way that no cars are doubled. 

void spawncars() {
  for (int i = 0; i < 1000; i++) {
    int x = int(random(-16000 + 300 * i, -16000 + 300 + 1 * i));
    cars[i] = new Car (x, 82);
  }
}

boolean oneCarAtTime = true; //responsible for deciding if a car is alowed to leave or not to stop two cars from leaving at a time.
int counter = 0; 

void drawcars() {
  if (!cp.paused) {
    for (int i = 0; i< 1000; i++) {
      if (cars[i].parked == true) {
        cars[i].y = 722;
      } 
      
      else if (cars[i].down == true) {
        cars[i].y = cars[i].y + 8; 
        cars[i].drawCar();
      } 
      
      else if (cars[i].leaving == true) {
        cars[i].x = cars[i].x + 8;
        if (cars[i].x < -100) {
          cars[i].leaving = false;
          cars[i].y = 82;
          cars[i].x = -16000;
        }
        cars[i].drawCar();
      } 
      
      else {
        cars[i].x = cars[i].x + 8; 
        cars[i].drawCar();
      }

      if (cars[i].x == 1300) {
        cars[i].x = -10000;
      }

      if (cars[i].x < 580 && cars[i].x > 550 && full < 120 && cars[i].leaving == false) {
        if (int(random(0, 4)) == 1) {
          cars[i].down = true;
        }
      }

      if (cars[i].y > 130 && cars[i].parked == false && cars[i].leaving == false) {
        cars[i].parked = true;
        cars[i].down = false;
        full++;
      }

      if (cars[i].parked == true && oneCarAtTime == true) {
        if (int(random(0, 2000)) == 2) {
          oneCarAtTime = false;
          cars[i].parked = false;
          cars[i].down = false;
          cars[i].leaving = true;
          money = money + 8.25;
          full--;
        }
      }

      if (counter == 20) {
        counter = 0;
        oneCarAtTime = true;
      }
      counter++;
    }
  } else {
    for(int i = 0; i < 1000; i++) {
      if(cars[i].parked == false){
          cars[i].drawCar();
      }
    }
  }
}

class Car {
  boolean leaving = false;
  boolean parked = false;
  boolean down = false;
  float x;
  float y;
  color col;

  Car(float a, float b) {
    x = a; //x-coordinate of car
    y = b;
    col = color(random(255), random(255), random(255)); //assigns a random color to the car
    fill(col);
    stroke(0);
    strokeWeight(1);
    rect(x, y, 70, 50);
    fill(184, 234, 245);
    rect(x+42, y+5, 20, 40);
    rect(x+5, y+5, 20, 40);
    fill(0);
    rect(x+5, y-5, 20, 5);
    rect(x+40, y-5, 20, 5);
    rect(x+5, y+50, 20, 5);
    rect(x+40, y+50, 20, 5);
    fill(240, 255, 250);
    ellipse(x+70, y+13, 5, 10);
    ellipse(x+70, y+37, 5, 10);
  }

  void drawCar() {
    fill(col);
    stroke(0);
    strokeWeight(1);
    rect(x, y, 70, 50);
    fill(184, 234, 245);
    rect(x+42, y+5, 20, 40);
    rect(x+5, y+5, 20, 40);
    fill(0);
    rect(x+5, y-5, 20, 5);
    rect(x+40, y-5, 20, 5);
    rect(x+5, y+50, 20, 5);
    rect(x+40, y+50, 20, 5);
    fill(240, 255, 250);
    ellipse(x+70, y+13, 5, 10);
    ellipse(x+70, y+37, 5, 10);
  }
}
