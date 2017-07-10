void setup(){
  size(640,360);
  background(0);
  for(int i = 0; i < 10; i++){
    float x = random(width);
    float y = random(height);
    float r = random(100,255);
    float g = random(100, 255);
    float b = random(100,255);
    
    //lighter border
    
    color c = color(r + 50, g + 50, b + 50);
    strokeWeight(5);
    stroke(c);
    
    fill(r,g,b,200);
    ellipse(x,y,100,100);
  }
}