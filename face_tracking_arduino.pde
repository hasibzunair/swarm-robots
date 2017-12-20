import processing.video.*;

import gab.opencv.*;

import java.awt.Rectangle;

import processing.serial.*;


Capture video;
OpenCV opencv;
color trackColor; 
float distanceN = 0; //the true value given by the equation
float distanceR = 0; //a rounded version of the distance, because having 3 decimal places in a dodgy equation is stupid
boolean xtrue = false; //variable used to see whether the x co-ordinates of the face are inside the middle quadrant
boolean ytrue = false; //same as above but y co-ordinates instead

Serial arduinoPort;

void setup() {

    size(320, 240);
    arduinoPort = new Serial(this, "COM6", 9600); //change this to whichever port your arduino is on
    opencv = new OpenCV(this, width, height);
    video = new Capture(this, width, height);
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  // change this to where your frontal face xml is located
    trackColor = color(255,0,0);
    smooth();
    video.start();
}

void draw() {
    
    opencv.loadImage(video);
    image(video, 0,0 );
    
    // detect anything ressembling a FRONTALFACE
    Rectangle[] faces = opencv.detect();
    
    // draw detected face area(s)
    noFill();
    stroke(255,0,0);
    for( int i=0; i<faces.length; i++ ) {
        rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height ); 
    textSize(18);
   text(faces[i].x, faces[i].x, faces[i].y);
   text(faces[i].y, faces[i].x+50, faces[i].y);
   text(faces[i].width+faces[i].x, faces[i].x+faces[i].width-80, faces[i].y+faces[i].height+20);
   text(faces[i].height+faces[i].y, faces[i].x+faces[i].width-30, faces[i].y+faces[i].height+20);
   
    if(faces[i].x  < 107){
     println("Left"); 
     arduinoPort.write("d");
   }
     
   if(faces[i].x + faces[i].width > 213){
    println("Right"); 
    arduinoPort.write("a");
   }
  
  if(faces[i].y + faces[i].height > 160){
    println("Bottom"); 
    arduinoPort.write("s");
   }

  if(faces[i].y < 80){
   println("Top"); 
   arduinoPort.write("w");
  }

   distanceN = ((-0.4478*(faces[i].width))+117.31);
   distanceR = round(distanceN);
   fill(50);
   text(distanceR, 10, 30);
   text("cm", 80, 30);
  }
  
   line(0, 80, 320, 80);
   line(0, 160, 320, 160);
   line(107, 0, 107, 240);
   line(213, 0, 213, 240);  
   
   
   //video.loadPixels();
  //image(video,0,0);

  // Before we begin searching, the "world record" for closest color is set to a high number that is easy for the first pixel to beat.
  float worldRecord = 500; 

  // XY coordinate of closest color
  int closestX = 0;
  int closestY = 0;

  // Begin loop to walk through every pixel
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {
      int loc = x + y*video.width;
      // What is current color
      color currentColor = video.pixels[loc];
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(trackColor);
      float g2 = green(trackColor);
      float b2 = blue(trackColor);

      // Using euclidean distance to compare colors
      float d = dist(r1,g1,b1,r2,g2,b2); // We are using the dist( ) function to compare the current color with the color we are tracking.

      // If current color is more similar to tracked color than
      // closest color, save current location and current difference
      if (d < worldRecord) {
        worldRecord = d;
   
        closestX = x;
        closestY = y;
      }
    }
  }

  // We only consider the color found if its color distance is less than 10. 
  // This threshold of 10 is arbitrary and you can adjust this number depending on how accurate you require the tracking to be.
  if (worldRecord < 10) { 
    // Draw a circle at the tracked pixel
    fill(trackColor);
    strokeWeight(4.0);
    stroke(0);
    ellipse(closestX,closestY,20,20);
    arduinoPort.write("l");
    println("Turn on"); 
  }
  else
  {
    arduinoPort.write("o");
    println("Turn off");
  }
}

void mousePressed() {
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
  
}

void captureEvent(Capture c) {
  c.read();
}  
