//bepaald wat we eerst gingen doen
//bow en arrow classic: https://classicreload.com/win3x-bow-and-arrow.html

//-ballon (cirkel) die naar boven beweegt en onderaan weer start
//TODO
//-pijl (lijn of rect) die naar rechts beweegt
//-optimalisaties: wat als scherm groter is
float y1 = 500;

void setup() {
  size(500,500);
}

void draw() {
  background(100,100,255);
  y1 = y1 - 30;  
  ellipse(200,y1,30,30);  
   
  //mogelijke bug als y1 = 0  
  if (y1<=0) {
   y1 = 500; 
  
  }
}
