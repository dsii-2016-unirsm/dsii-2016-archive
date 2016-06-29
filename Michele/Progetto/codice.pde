/*
QRcode reader
 Generate images from a QRcode generator such as
 http://qrcode.kaywa.com/ and put them in this sketch's
 data folder.
 Press spacebar to read from the camera, generate an image,
 and scan for barcodes.  Press f to read from a file and scan.
 Press s for camera settings.
 Created 9 June 2007
 by Tom Igoe / Daniel Shiffman
 */


import processing.video.*;
import qrcodeprocessing.*;

String PATH1 = "C:/Users/Michele/Desktop/Università/Laboratorio di design dell'interazione per informazione/QR Code/qrcodeprocessing/tragitto 1.mp4"; //put files from your PC and update the address
String PATH2 = "C:/Users/Michele/Desktop/Università/Laboratorio di design dell'interazione per informazione/QR Code/qrcodeprocessing/tragitto 2.mp4"; //put files from your PC and update the address
String PATH3 = "C:/Users/Michele/Desktop/Università/Laboratorio di design dell'interazione per informazione/QR Code/qrcodeprocessing/tragitto 2.mp4"; //put files from your PC and update the address
Movie mov1;
Movie mov2;
Movie mov3;
PImage img;
Capture video;                                 // instance of the video capture library
String statusMsg = "Waiting for an image";     // a string to return messages:

// Decoder object from prdecoder library
Decoder decoder;

void setup() {
  fullScreen();
  //size(400, 320);
  video = new Capture(this, 320, 240);
  video.start();

  // Create a decoder object
  decoder = new Decoder(this);

  mov1 = new Movie(this, PATH1);
  mov1.loop();
  mov1.speed(1);
  mov1.volume(0);

  mov2 = new Movie(this, PATH2);
  mov2.loop();
  mov2.speed(1);
  mov2.volume(0);

  mov3 = new Movie(this, PATH2);
  mov3.loop();
  mov3.speed(1);
  mov3.volume(0);
}

// When the decoder object finishes
// this method will be invoked.
void decoderEvent(Decoder decoder) {
  statusMsg = decoder.getDecodedString();
}

void captureEvent(Capture video) {
  video.read();
}

void movieEvent(Movie mov) {
  mov.read();
}

void draw() {
  background(0);

  // Display video
  //image(video, 0, 0);
  // Display status
  text(statusMsg, 10, height-4);

  // If we are currently decoding
  if (decoder.decoding()) {
    // Display the image being decoded
    PImage show = decoder.getImage();
    image(show, 0, 0, show.width/4, show.height/4); 
    statusMsg = "Decoding image";
    for (int i = 0; i < (frameCount/2) % 10; i++) statusMsg += ".";
  }

  /// TRAGITTO 1
  if (statusMsg.equals("tragitto1")) {
    image(mov1, 0, 0, width, height);

    //// TRAGITTO 2
  } else if (statusMsg.equals("tragitto2")) {
    image(mov2, 0, 0, width, height);

    //// TRAGITTO 3
  } else if (statusMsg.equals("tragitto3")) {
    image(mov3, 0, 0, width, height);
  }
}

void keyReleased() {
  // Depending on which key is hit, do different things:
  if (key == ' ' || key == 'f')
    switch (key) {
    case ' ':        
      // Spacebar takes a picture and tests it:
      // copy it to the PImage savedFrame:
      PImage savedFrame = createImage(video.width, video.height, RGB);
      savedFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height);
      savedFrame.updatePixels();
      // Decode savedFrame
      decoder.decodeImage(savedFrame);
      break;
    case 'f':    // f runs a test on a file
      int quale=int(random(1, 4));
      PImage preservedFrame = loadImage("qrcode"+quale+".png");
      // Decode file
      decoder.decodeImage(preservedFrame);
      break;
    }
}
