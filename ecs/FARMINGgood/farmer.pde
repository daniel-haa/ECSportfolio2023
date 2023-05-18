class Farmer {
  int x, y;
  PImage Farmer;
  boolean overFarm;
  int charY = 10;
  int charX = 10;


  Farmer () {
    x=width/2;
    y=height/2;
    imageMode(CENTER);
    Farmer = loadImage ("farmer.png");
    overFarm = false;
  }
  void display () {
    imageMode(CENTER);
    Farmer.resize(100, 100);
    image(Farmer, x, y);
  }

  void move (char dir) {
    if (dir == 'w') {
      y = y - charY ;
    } else  if (dir == 'a') {
      x = x - charX ;
    } else  if (dir == 's') {
      y = y + charY ;
    } else  if (dir == 'd') {
      x = x + charX ;
    }
  }

  void farmLand () {

    fill(#E39F60);
    rectMode(CENTER);
    rect(600, 350, 400, 400, 80);
  }

  void farmerSpeed() {
    rectMode(CORNER);
    fill(#95EAE4);
    rect(50, 500, 100, 100);
    fill(0);
    textMode(CORNER);
    textSize(20);
    text(Sprice + " Corn", 55, 550);
    textSize(10);
    text("+5 Character Speed", 55, 570);
    if (f1.x > 50 && f1.x < 150 && f1.y > 500 && f1.y < 600 && corn >= Sprice && charY < 75 && charX < 50) {
      charX += 5 ;
      charY += 5 ;
      corn = corn - Sprice;
      Sprice = Sprice + 100;
    };
    if (charX > 50 || charY > 50) {
      charX = 50;
      charY = 50;
    }
  }
  void farmerLoop () {
    if (x < -20) {
      x = 1120;
    }
    if (x > 1130) {
      x = -10;
    }
    if (y < -10) {
      y = 860;
    }
    if (y > 870) {
      y = -10;
    }
  }
}
