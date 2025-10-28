//bepaald wat we eerst gingen doen
//bow en arrow classic: https://classicreload.com/win3x-bow-and-arrow.html

float pijlX = 0;
float pijlY=0;
boolean pijlVisible = false;
int pijlenOver = 10;
float y1 = 500;
int level = 1;
Ballon[] ballonnen = new Ballon[10];

void setup() {
  if (level==1) {
    ballonnen[0] = new Ballon(100, 500, 2);
    ballonnen[1] = new Ballon(200, 500, 2);
    ballonnen[2] = new Ballon(300, 500, 2);
  }
  if (level==2) {
    ballonnen[0] = new Ballon(200, 500, 4);
    ballonnen[1] = new Ballon(400, 500, 4);
  }


  size(500, 500);
}

void draw() {
  background(100, 100, 255);

  tekenPijlenOver();

  for (int i=0; i<ballonnen.length; i++) {
    Ballon ballon = ballonnen[i];
    if (ballon!= null && ballon.visible) {
      ballon.move();
      ballon.hitArrow(pijlX+100, pijlY);
      ballon.checkCollisionWall();
      ballon.teken();
    }
  }


  println(alleBallonenWeg());

  if (alleBallonenWeg()) {
    level++;
    if (level==1) {
      ballonnen[0] = new Ballon(100, 500, 2);
      ballonnen[1] = new Ballon(200, 500, 2);
      ballonnen[2] = new Ballon(300, 500, 2);
    }
    if (level==2) {
      ballonnen[0] = new Ballon(200, 500, 4);
      ballonnen[1] = new Ballon(400, 500, 4);
    }
  }






  if (pijlVisible) {
    pijlX = pijlX + 5;
    line(pijlX, pijlY, pijlX + 100, pijlY);

    if (pijlX >= width) {
      pijlVisible = false;
    }
  }



  fill(255, 255, 255);
  rect(20, mouseY, 60, 60);
}

boolean alleBallonenWeg() {
  for (int i=0; i<ballonnen.length; i++) {
    Ballon ballon = ballonnen[i];
    if (ballon!= null && ballon.visible) {
      return false;
    }
  }
  return true;
}


void mouseClicked() {
  pijlVisible = true;
  pijlX = 0;
  pijlY = mouseY + 30;
  pijlenOver--;
}

void tekenPijlenOver() {
  for (int i=1; i<= pijlenOver; i++) {
    float lijnX = 380 + (i*10);
    line(lijnX, 0, lijnX, 30);
  }
}




class Ballon {
  float x;
  float y;
  float snelheid;
  float w = 30;
  boolean hit;
  boolean visible= true;

  //constructor
  Ballon(float x, float y, float snelheid) {
    this.x = x;
    this.y=y;
    this.snelheid = snelheid;
  }

  void checkCollisionWall() {
    if (y<=0) {
      y = height;
    }
  }

  void move() {
    y = y - snelheid;

    if (hit) {
      w--;
      if (w < 0) {
        visible = false;
        w=0;
      }
    }
  }

  boolean hitArrow(float pijlX, float pijlY) {
    float distance = dist(pijlX, pijlY, x, y);
    if (distance < w/2) {
      hit = true;
    }

    return hit;
  }

  void teken() {

    if (hit) {
      fill(255, 0, 0);
    } else {
      fill(255, 255, 255);
    }
    ellipse(x, y, w, w);
  }
}







//class Ballon {
//  float x;
//  float y;
//  float w = 30;
//  float h = 30;
//  float speed = 2;
//  boolean visible = true;

//  Ballon(float x, float y, float speed) {
//    this.x=x;
//    this.y=y;
//    this.speed=speed;
//  }

//  void move() {
//    y = y - speed;
//  }

//  boolean doesArrowHit(float arrowX, float arrowY) {
//    float distance = dist(arrowX, arrowY, x, y);
//    if (distance < w) {
//      ballon.visible=false;
//      fill(255, 0, 0);
//    } else {
//      fill(255, 255, 255);
//    }
//    return
//  }

//  void display() {
//    if (visible) {
//      ellipse(x, y, w, h);
//    }
//  }
//}
