//Daniel Ha | Apr 2023 | Etch a Sketch
int x, y;
PImage photo;

void setup() {
  size(795, 657);
  x = width/2;
  y = height /2;
  background(250);
  photo = loadImage ("Etch.png");
  strokeWeight(3);
}

void draw() {
  image (photo, 0, 0);
}

void mousePressed() {
  saveFrame("line-######.png");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      moveUp(1);
    } else if (keyCode == DOWN) {
      moveDown(1);
    } else if (keyCode == LEFT ) {
      moveLeft(1);
    } else if (keyCode == RIGHT) {
      moveRight(1);
    }
  }
}

void moveRight(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x+i, y);
  }
  x = x + rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x+i, y);
  }
  x = x - rep;
}

void moveUp(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x, y+i);
  }
  y = y - rep;
}

void moveDown(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x, y+i);
  }
  y = y + rep;
}
