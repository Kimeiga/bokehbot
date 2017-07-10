void setup(){
 
  size(800, 800);
  
  blendMode(ADD);
  
  background(0);
  smooth();
  float radius = 40;
  
  for(int i = 0; i < 30; i++){
    float x = random(width);
    float y = random(height);
    float r = random(100,255);
    float g = random(100, 255);
    float b = random(100,255);
    
    float a = random(0.01,0.05);
    
    //lighter border
    
    //color c = color(r + 50, g + 50, b + 50);
    //strokeWeight(5);
    //stroke(c);
    
    //fill(r,g,b,200);
    //ellipse(x,y,100,100);
    
    
    createGradient(x,y,radius,color(r,g,b),color(r-20,g-20,b-20),a);
    
    filter(BLUR,0.1);
    
    noStroke();
    
    fill(r,g,b,100);
    ellipse(x,y,radius * 2 - 5,radius*2 - 5);
  }

  //int radius = width/2;
  // create some gradients
  /*
  for (int i=radius; i< width; i+=width){
    for (int j =radius; j< height; j+=width){
      createGradient(i, j, radius,
      color(int(0), int(0), int(0)),
      color(int(255), int(255), int(255)));
    }
  }
  */
  //createGradient(width/2,height/2,radius,color(200,200,200),color(255,255,255));
  
  
}

void createGradient (float x, float y, float radius, color c1, color c2, float a){
  
  updatePixels();
  
  float px = 0, py = 0, angle = 0;

  // calculate differences between color components
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);
  // hack to ensure there are no holes in gradient
  // needs to be increased, as radius increases
  float gapFiller = 64.0;

  for (int i=0; i< radius; i++){
    for (float j=0; j<360; j+=1.0/gapFiller){
      px = x+cos(radians(angle))*i;
      py = y+sin(radians(angle))*i;
      angle+=1.0/gapFiller;
      color c = color(
      (red(c1)+(i)*(deltaR/radius)),
      (green(c1)+(i)*(deltaG/radius)),
      (blue(c1)+(i)*(deltaB/radius))
        );
        
      color cFrom = get(int(px),int(py));
        
      color cFinal = lerpColor(cFrom,c,a);
      
       //print(red(cFrom)- red(cFinal));
      
      set(int(px), int(py), cFinal);     
    }
  }
  
  // adds smooth edge
  // hack anti-aliasing
  noFill();
  //stroke(150);
  //strokeWeight(2);
  
   
  
  color lightColor = color(red(c2) + 30,green(c2) + 30, blue(c2) + 30);
  stroke(lightColor);
  strokeWeight(2);
  
  ellipse(x, y, radius * 2, radius * 2);
}