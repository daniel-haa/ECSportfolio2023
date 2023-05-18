class Corn {
  int x, y, diam, corn;
  PImage Corn;
  PImage Corn2;
  PImage Corn3;
  float r = random(600, 800);
  int diamVar = 1 ;
  Corn () {
    x= 800;
    y= 500;
    diam = 0;
    Corn = loadImage ("corn1.png");
    Corn2 = loadImage ("corn2.png");
    Corn3 = loadImage ("corn3.png");
  }
  void display () {

    imageMode(CENTER);
    if (diam < 200) {
      Corn.resize(50, 50);
      image(Corn, x, y);
    } else if (diam > 200 && diam < 400) {
      image(Corn2, x, y);
      Corn2.resize(100, 100);
    } else if (diam > 400) {
      image(Corn3, x, y);
      Corn3.resize(150, 150);
    }
  }

  void move (int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }

 
}
