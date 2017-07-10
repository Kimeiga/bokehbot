void setup(){
  size(1000,500);
  background(0);
  
  colorMode(HSB, 360,100,100);
  
  blendMode(ADD);
  
  float diameter = 60;
  
  for(int i = 0; i < 50; i++){
    float x = random(width);
    float y = random(height);
    
    float h = random(200,360);
    
    float s = 100;
    
    
    
    float b = random(50,100);
    
    //more saturated border
    /*
    color c = color(h,s,b);
    strokeWeight(3);
    stroke(c);
    */
    
    fill(h,s,b,200);
    
    ellipse(x,y,diameter,diameter);
    
    filter(BLUR,0.4);
    
    fill(h,s-150,b,200);
    ellipse(x,y,diameter-5,diameter-5);
    
  }
  
    filter(BLUR,1);
    
  
  
  
  
  
  
}