import controlP5.*;

ControlP5 cp5;

float seperate = 1;
float align = 1;
float cohere = 1;

int initBoidNum = 1000; //amount of boids to start the program with
BoidList flock1;//,flock2,flock3;
float zoom=-800;
boolean smoothEdges = true,avoidWalls = true;

Slider sep;
Slider ali;
Slider coh;

void settings() {
  size(displayWidth,displayHeight,P3D);  
  if(smoothEdges)
    smooth();
  else
    noSmooth();
}

void setup()
{
  //sliders
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  
  
PFont pfont = createFont("Advent", 40, true); // use true/false for smooth/no-smooth
ControlFont font = new ControlFont(pfont, 241);
int fontSize=30;

int heightOfSlider=40;
int widthOfSlider=300;
int gapBetweenSliders=10;
  
  
      cp5 = new ControlP5(this);
  sep=cp5.addSlider("seperate")
     .setPosition(10,height-2*(heightOfSlider+gapBetweenSliders))
     .setRange(0,10)
     .setColorCaptionLabel(10000)
     .setSize(widthOfSlider,heightOfSlider)
     ;
     
  sep.setCaptionLabel("Seperate")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(fontSize)
            ;
     
  ali=cp5.addSlider("align")
     .setPosition(10,height-heightOfSlider-gapBetweenSliders)
     .setRange(0,10)
     .setColorCaptionLabel(0)
     .setSize(widthOfSlider,heightOfSlider)
     ;
     
  ali.setCaptionLabel("Align")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(fontSize)
            ;
  
  coh=cp5.addSlider("cohere")
     .setPosition(10,height-3*(heightOfSlider+gapBetweenSliders))
     .setRange(0,10)
     .setColorCaptionLabel(0)
     .setSize(widthOfSlider,heightOfSlider)
     ;
     
  coh.setCaptionLabel("Cohere")
    .getCaptionLabel()
      .setFont(font)
        .toUpperCase(false)
          .setSize(fontSize)
            ;
     
  //cp5.getController("align")
  ////.setSize(24)
  //;

  //create and fill the list of boids
  flock1 = new BoidList(initBoidNum,255);
  //flock2 = new BoidList(100,255);
  //flock3 = new BoidList(100,128);

}

void draw()
{
  pushMatrix();
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
  
  flock1.run(avoidWalls, seperate, align, cohere);
  //flock2.run();
  //flock3.run();
  popMatrix();
}

void keyPressed()
{
  switch (keyCode)
  {
    case UP: zoom-=100; break;
    case DOWN: zoom+=100; break;
  }
  switch (key)
  {
    case 's': smoothEdges = !smoothEdges; break;
    case 'a': avoidWalls = !avoidWalls; break;
  }
}