int initBoidNum = 400; //amount of boids to start the program with
BoidList flock1;//,flock2,flock3;
float zoom=-1000;
boolean smoothEdges = false,avoidWalls = true;

import java.util.Collections;

void settings() {
  size(displayWidth,displayHeight,P3D);  
  if(smoothEdges)
    smooth();
  else
    noSmooth();
}

void setup()
{

  //create and fill the list of boids
  flock1 = new BoidList(initBoidNum,255);
  //flock2 = new BoidList(100,255);
  //flock3 = new BoidList(100,128);
}

void draw()
{
  //clear screen
  beginCamera();
  camera();
  //rotateX(map(mouseY,0,height,0,TWO_PI));
  //rotateY(map(mouseX,width,0,0,TWO_PI));
  translate(0,0,zoom);
  endCamera();
  background(#A5CAED);
  directionalLight(255,255,255, 0, 1, -100); 
  noFill();
  stroke(0);
  
  //line(0,0,300,  0,height,300);
  //line(0,0,900,  0,height,900);
  //line(0,0,300,  width,0,300);
  //line(0,0,900,  width,0,900);
  
  //line(width,0,300,  width,height,300);
  //line(width,0,900,  width,height,900);
  //line(0,height,300,  width,height,300);
  //line(0,height,900,  width,height,900);
  
  //line(0,0,300,  0,0,900);
  //line(0,height,300,  0,height,900);
  //line(width,0,300,  width,0,900);
  //line(width,height,300,  width,height,900);
  
  flock1.run(avoidWalls);
  //flock2.run();
  //flock3.run();
}

void keyPressed()
{
  switch (keyCode)
  {
    case UP: zoom-=10; break;
    case DOWN: zoom+=10; break;
  }
  switch (key)
  {
    case 's': smoothEdges = !smoothEdges; break;
    case 'a': avoidWalls = !avoidWalls; break;
  }
}