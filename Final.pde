// Make a top-down 2d simulator especially like Link to the Past.

// set up a boolean variable to check if the simulator has started
Boolean hasBeenFired = false;
Boolean hasMovedRight1 = false;


// set up a variable to store the direction that is being taken. 
// This is used to change to the correct directional image on key release
String myDirection = "forward";

//variables for movement across space
float newX = 0;
float newY = 0;

int numFrames = 24;  // The number of frames in the animation
int currentFrame = 0;
int currentScreen = 1;

//set up arrays for image loops
PImage[] imagesForward = new PImage[numFrames];
PImage[] imagesBackward = new PImage[numFrames];
PImage[] imagesRight = new PImage[numFrames];
PImage[] imagesLeft = new PImage[numFrames];

//set up environments, background and rainbow
PImage bg;
PImage bg2;
PImage rainbow;


void setup() {
  size(800, 800);
  frameRate(24);

  //load foreground and background

  bg  = loadImage("bg.png");
  bg2  = loadImage("bg2.png");

  rainbow  = loadImage("rainbow.png");


  //Images Forward

  imagesForward[0]  = loadImage("guyforward-02.png");
  imagesForward[1]  = loadImage("guyforward-02.png");
  imagesForward[2]  = loadImage("guyforward-02.png");
  imagesForward[3]  = loadImage("guyforward-02.png");
  imagesForward[4]  = loadImage("guyforward-02.png");
  imagesForward[5]  = loadImage("guyforward-02.png");
  imagesForward[6]  = loadImage("guyforward-02.png");
  imagesForward[7]  = loadImage("guyforward-02.png");
  imagesForward[8]  = loadImage("guyforward-02.png");
  imagesForward[9]  = loadImage("guyforward-02.png");
  imagesForward[10]  = loadImage("guyforward-02.png");
  imagesForward[11]  = loadImage("guyforward-02.png");
  imagesForward[12]  = loadImage("guyforward-02.png");
  imagesForward[13]  = loadImage("guyforward-01.png");
  imagesForward[14]  = loadImage("guyforward-01.png"); 
  imagesForward[15]  = loadImage("guyforward-01.png"); 
  imagesForward[16]  = loadImage("guyforward-01.png"); 
  imagesForward[17]  = loadImage("guyforward-01.png"); 
  imagesForward[18]  = loadImage("guyforward-01.png"); 
  imagesForward[19]  = loadImage("guyforward-01.png"); 
  imagesForward[20]  = loadImage("guyforward-01.png"); 
  imagesForward[21]  = loadImage("guyforward-01.png"); 
  imagesForward[22]  = loadImage("guyforward-01.png"); 
  imagesForward[23]  = loadImage("guyforward-01.png"); 

  //imagesBackwards

  imagesBackward[0]  = loadImage("guybackward-02.png");
  imagesBackward[1]  = loadImage("guybackward-02.png");
  imagesBackward[2]  = loadImage("guybackward-02.png");
  imagesBackward[3]  = loadImage("guybackward-02.png");
  imagesBackward[4]  = loadImage("guybackward-02.png");
  imagesBackward[5]  = loadImage("guybackward-02.png");
  imagesBackward[6]  = loadImage("guybackward-02.png");
  imagesBackward[7]  = loadImage("guybackward-02.png");
  imagesBackward[8]  = loadImage("guybackward-02.png");
  imagesBackward[9]  = loadImage("guybackward-02.png");
  imagesBackward[10]  = loadImage("guybackward-02.png");
  imagesBackward[11]  = loadImage("guybackward-02.png");
  imagesBackward[12]  = loadImage("guybackward-02.png");
  imagesBackward[13]  = loadImage("guybackward-01.png");
  imagesBackward[14]  = loadImage("guybackward-01.png"); 
  imagesBackward[15]  = loadImage("guybackward-01.png"); 
  imagesBackward[16]  = loadImage("guybackward-01.png"); 
  imagesBackward[17]  = loadImage("guybackward-01.png"); 
  imagesBackward[18]  = loadImage("guybackward-01.png"); 
  imagesBackward[19]  = loadImage("guybackward-01.png"); 
  imagesBackward[20]  = loadImage("guybackward-01.png"); 
  imagesBackward[21]  = loadImage("guybackward-01.png"); 
  imagesBackward[22]  = loadImage("guybackward-01.png"); 
  imagesBackward[23]  = loadImage("guybackward-01.png");

  //imagesRight

  imagesRight[0]  = loadImage("guyside-02.png");
  imagesRight[1]  = loadImage("guyside-02.png");
  imagesRight[2]  = loadImage("guyside-02.png");
  imagesRight[3]  = loadImage("guyside-02.png");
  imagesRight[4]  = loadImage("guyside-02.png");
  imagesRight[5]  = loadImage("guyside-02.png");
  imagesRight[6]  = loadImage("guyside-02.png");
  imagesRight[7]  = loadImage("guyside-02.png");
  imagesRight[8]  = loadImage("guyside-02.png");
  imagesRight[9]  = loadImage("guyside-02.png");
  imagesRight[10]  = loadImage("guyside-02.png");
  imagesRight[11]  = loadImage("guyside-02.png");
  imagesRight[12]  = loadImage("guyside-02.png");
  imagesRight[13]  = loadImage("guyside-01.png");
  imagesRight[14]  = loadImage("guyside-01.png"); 
  imagesRight[15]  = loadImage("guyside-01.png"); 
  imagesRight[16]  = loadImage("guyside-01.png"); 
  imagesRight[17]  = loadImage("guyside-01.png"); 
  imagesRight[18]  = loadImage("guyside-01.png"); 
  imagesRight[19]  = loadImage("guyside-01.png"); 
  imagesRight[20]  = loadImage("guyside-01.png"); 
  imagesRight[21]  = loadImage("guyside-01.png"); 
  imagesRight[22]  = loadImage("guyside-01.png"); 
  imagesRight[23]  = loadImage("guyside-01.png");


  //imagesLeft

  imagesLeft[0]  = loadImage("guysideLeft-02.png");
  imagesLeft[1]  = loadImage("guysideLeft-02.png");
  imagesLeft[2]  = loadImage("guysideLeft-02.png");
  imagesLeft[3]  = loadImage("guysideLeft-02.png");
  imagesLeft[4]  = loadImage("guysideLeft-02.png");
  imagesLeft[5]  = loadImage("guysideLeft-02.png");
  imagesLeft[6]  = loadImage("guysideLeft-02.png");
  imagesLeft[7]  = loadImage("guysideLeft-02.png");
  imagesLeft[8]  = loadImage("guysideLeft-02.png");
  imagesLeft[9]  = loadImage("guysideLeft-02.png");
  imagesLeft[10]  = loadImage("guysideLeft-02.png");
  imagesLeft[11]  = loadImage("guysideLeft-02.png");
  imagesLeft[12]  = loadImage("guysideLeft-02.png");
  imagesLeft[13]  = loadImage("guysideLeft-01.png");
  imagesLeft[14]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[15]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[16]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[17]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[18]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[19]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[20]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[21]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[22]  = loadImage("guysideLeft-01.png"); 
  imagesLeft[23]  = loadImage("guysideLeft-01.png");
} 

void draw() { 
  println(hasBeenFired);
  image(bg, 0, 0);
  //background(255);
  currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
  int offset = 0;

  //load the intitial image before a key has been pressed. Do this one time only.

  if (hasBeenFired == false) {
    image(imagesForward[0], newX, newY);
  }


  if (newX >= 800 && hasMovedRight1 == false) {
    println("movedrightscreen");
    hasMovedRight1 = true;
    newX = 10;
    currentScreen = 2;
  }
  
  if(currentScreen == 2){
      image(bg2, 0, 0);  
  }
  

  //Direction Controls
  if (keyPressed && key == CODED) {
    hasBeenFired = true;
    if (keyCode == UP) {
      newY -= 10;
      image(imagesBackward[(currentFrame+offset) % numFrames], newX, newY);
      myDirection = "up";
    } else if (keyCode == DOWN) {
      newY += 10;
      image(imagesForward[(currentFrame+offset) % numFrames], newX, newY);
      myDirection = "down";
    } else if (keyCode == RIGHT) {
      newX += 10;
      image(imagesRight[(currentFrame+offset) % numFrames], newX, newY);
      myDirection = "right";
    } else if (keyCode == LEFT) {
      newX -= 10;

      image(imagesLeft[(currentFrame+offset) % numFrames], newX, newY);
      myDirection = "left";
    }
  } else {

    // read the direction variable to determine which static image to stop on
    if (myDirection == "down") {
      image(imagesForward[0], newX, newY);
    }
    if (myDirection == "up") {
      image(imagesBackward[0], newX, newY);
    }
    if (myDirection == "left") {
      image(imagesLeft[0], newX, newY);
    }
    if (myDirection == "right") {
      image(imagesRight[0], newX, newY);
    }
  }
  image(rainbow, 0, 0);
}