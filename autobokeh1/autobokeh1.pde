void setup(){
  size(640,360);
  background(0);
  
  colorMode(HSB, 360,100,100);
  
  blendMode(ADD);
  
  float bigDiameter = 85;
  float diameter = 80;
  
  for(int i = 0; i < 5; i++){
    float x = random(width);
    float y = random(height);
    
    float h = random(0,360);
    float s = random(80,100);
    float b = random(0,40);
    
    fill(h,s,b,160);
    
    ellipse(x,y,1000, 1000);
    
  }
  
  filter(BLUR,500);
  
  
  for(int i = 0; i < 80; i++){
    float x = random(width);
    float y = random(height);
    
    float h = random(0,360);
    
    float s = random(80,100);
    
    
    
    float b = random(0,30);
    
    //more saturated border
    /*
    color c = color(h,s,b);
    strokeWeight(3);
    stroke(c);
    */
    
    float alpha = random(30, 150);
    
    fill(h,s,b,alpha);
    
    ellipse(x,y,bigDiameter,bigDiameter);
    
    filter(BLUR,0.4);
    
    float innerSaturationSubtractor = random(70,100);
    
    fill(h,s-innerSaturationSubtractor,b,240);
    ellipse(x,y,bigDiameter-6,bigDiameter-6);
    
  }
  
    filter(BLUR,8);
    
  
  for(int i = 0; i < 80; i++){
    float x = random(width);
    float y = random(height);
    
    float h = random(0,360);
    
    float s = random(70,100);
    
    
    
    float b = random(20,100);
    
    //more saturated border
    /*
    color c = color(h,s,b);
    strokeWeight(3);
    stroke(c);
    */
    
    fill(h,s,b,200);
    
    ellipse(x,y,diameter,diameter);
    
    filter(BLUR,0.4);
    
    float innerSaturationSubtractor = random(0,100);
    
    float alpha = random(50,200);
    
    fill(h,s-innerSaturationSubtractor,b,alpha);
    ellipse(x,y,diameter-5,diameter-5);
    
  }
  
    filter(BLUR,0.7);
  
  
  save("bokehOutput.jpg");
  exit();
  
}