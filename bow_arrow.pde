//bepaald wat we eerst gingen doen
//bow en arrow classic: https://classicreload.com/win3x-bow-and-arrow.html

//-ballon (cirkel) die naar boven beweegt en onderaan weer start
//-pijl (lijn of rect) die naar rechts beweegt
//-optimalisaties: wat als scherm groter is
//-muis beweegt player
// TODO: mouse click = pijl schieten

float y1 = height;
float pijlX = 0;

void setup() {
  size(500,500);
}

void draw() {
  background(100,100,255);  
  y1 = y1 - 5;  
  pijlX = pijlX + 5;
  line(pijlX,mouseY,pijlX + 100,mouseY);
  ellipse(200,y1,30,30);  
  rect(20,mouseY,100,100);
  //mogelijke bug als y1 = 0  
  if (y1<=0) {
   y1 = height; 
  }
  if (pijlX >= width){
     pijlX = 0;    
  }
}
