boolean play, dist;
Farmer f1;
Corn c1;
Timer t1;
int corn, time, farmerX, farmerY, upgrade1, minutes;
Timer timer, timer2;
double scoreVar = 10;
int price = 250;   // helped by Evan Lou
int Gprice = 100;
int Cprice = 20;
int Sprice = 100;
int totalTime = 600000;
int infoTime;
int goalTime;
int shownTime;


void setup () {
  size (1100, 850);
  f1 = new Farmer () {
  };
  c1 = new Corn () {
  };
  timer = new Timer(totalTime);
  timer2 = new Timer(5000);
  dist = false;
  play = false;
  frameRate(60);
}

void draw() {
  if (!play) {
    frameCount = 0;
    infoTime = millis();
    println(infoTime);
  } else {
    goalTime = infoTime + totalTime;
    shownTime = goalTime - millis();
  }
  if (!play) {
    startScreen();
  } else {
    println(shownTime);
    drawBackground ();
    f1.farmerSpeed();
    f1.farmerLoop();
    c1.display();
    infoPanel();
    scoreMult ();
    diamVar();
    f1.display();
    if (timer.isFinished()) {
      gameOver();
    }
    if (f1.x > 600 && f1.x < 1000 && f1.y > 350 && f1.y < 750) {
      f1.overFarm = true;
      c1.diam += c1.diamVar;
    }
  }
}

void keyPressed () {
  if (key == 'w' || key == 'W') {
    f1.move('w');
  } else if (key == 'a' || key == 'A') {
    f1.move('a');
  } else if (key == 'd' || key == 'D') {
    f1.move('d');
  } else if (key == 's' || key == 'S') {
    f1.move('s');
  } else if (key == 'y') {
    corn = corn + 500;
  } else if (key == ' ') {
    play = true;
  }
}

void drawBackground() {
  background(#BCF5C3);
  fill(#E39F60); //soil
  rectMode(CORNER);
  rect(600, 350, 400, 400, 80);
}

void startScreen () {
  background(0);
  fill(255);
  textSize(20);
  textAlign(CENTER);
  text("Farming", width/2, height/2 - 125);
  text("by Daniel", width/2, 250);
  text("You have 10 minutes", width/2, height/2 + 75);
  text("press SPACE to start", width/2, height/2 + 200);
  timer.start();
}

void gameOver () {
  background(0);
  fill(255);
  textAlign(CENTER);
  textSize(30);
  text("Game Over", width/2, height/2);
  text("", width/2, height/2 + 50);
  text("Corn:   " + corn, width/2, height/2 + 100);
  noLoop();
}

void infoPanel() {
  textAlign(CORNER);
  fill(#F5BCBC); // RED INFO BAR
  rectMode(CORNER);
  rect(-10, 0, 1300, 80);
  fill(0);
  textSize(50); //SCORE AND TIME BAR
  text("Corn:  " + corn, 10, 50);
  text("|Seconds: " +(shownTime/1000), 300, 50);
  textSize(20);
  text("Corn Multiplier: " + scoreVar, 625, 25);
  text("Grow Multiplier: " + c1.diamVar, 625, 55);
  text("Grow Time: " + c1.diam/30, 925, 55);
  text("Speed : " + f1.charX, 925, 25);
}

void scoreMult () {
  float f = random(0, 5);
  int i = round(f);
  textMode(CORNER);
  fill(#95EAE4);
  rectMode(CORNER);
  rect(50, 100, 100, 100);
  fill(0);
  textSize(20);
  text(Cprice+" Corn", 55, 150);
  textSize(10);
  text("Corn Multplier +0 to +5", 55, 170);
  var randNum = i;
  if (f1.x > 50 && f1.x < 150 && f1.y > 100 && f1.y < 200 && corn >= Cprice) {
    scoreVar = scoreVar + randNum;
    corn -= Cprice;
    Cprice += 5;
  };
  fill(#95EAE4);
  rect(50, 300, 100, 100);
  fill(0);
  textSize(20);
  text(price+" Corn", 55, 350);
  textSize(10);
  text("2X Corn Multiplier", 55, 370);

  if (f1.x > 50 && f1.x < 150 && f1.y > 300 && f1.y < 400 && corn >= price) {
    scoreVar *= 2;
    corn -= price;
    price *= 2;
  }

  if (c1.diam > 500) {
    c1.diam = c1.diam * 0;
    corn += scoreVar;
  }
}

void diamVar () {
  fill(#95EAE4);
  rect(50, 700, 100, 100);
  fill(0);
  textMode(CORNER) ;
  textSize(20);
  text(Gprice+" Corn", 55, 750);
  textSize(10);
  text("+1 Grow Multiplier", 55, 765);
  //println(c1.diamVar);
  if (f1.x > 50 && f1.x < 150 && f1.y > 700 && f1.y < 800 && corn >= Gprice) {
    c1.diamVar = c1.diamVar + 1 ;
    corn = corn - Gprice;
    Gprice *= 2;
  }
}
