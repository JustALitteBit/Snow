import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

int quantity = 1000;
Snow[] flakes = new Snow[1000];
int Bx = 256;
int By = 212;
int r = 50;


void setup() {
  size (512, 424);
  for (int i = 0; i<flakes.length; i++) { 
    flakes[i] = new Snow (round(random(5, 10)));
    flakes[i].spreadY(i);

  }

}

void draw() {
  background(0); 
  ellipse(Bx,By,50,50);
  for (int i = 0; i < flakes.length; i++) {
    flakes[i] .display();
  if (flakes[i].x > 256 && flakes[i].y >445 && flakes[i].x<400){
    flakes[i].bounce();  
  }

  if ((flakes[i].x >231 && flakes[i].x <281) && flakes[i].y >= 237){
    flakes[i].collision();
    flakes[i].boundaryCheck();

   
  }
flakes[i].boundaryCheck();
  }
  }




class Snow {
  float x; 
  float y;
  float diameter;
  float speed = random(1, 5);
  float descentX;
  int col = 255; 
  
  Snow (float tempD) {
    x = random(-50, width+50);
    y = random(0,40);
    diameter = tempD;
  }
  
  void spreadY(int i) {
    y = y - i*3;
  }
  
  void display() {
  
    noStroke();
    fill(col);
    ellipse(x, y, diameter, diameter);
    y = y + speed;
    x = x + descentX;
  }
    
    //checking the boundary
    void boundaryCheck(){
    float h = random(237,282);
    float v = random(1,50);
    if (y > height) {
      y = -diameter;
    }
    if (x < 0-50) {
      x = width+diameter;} 
      else if (x > width+50){
      x = h;
    }
     if (y<width+diameter && (x==281 || x==237)){
    x -= v;
  }
  }
  void bounce(){
    y = y - speed; 
}
  void collision(){

  if (x>=256){
  y += 2;
  x += 2;
  }else{
  y-= 2;
  x -= 2;
  }
 
  }
}
  
