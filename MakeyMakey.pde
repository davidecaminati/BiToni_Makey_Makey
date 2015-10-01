// Example by Tom Igoe 
 
import processing.serial.*; 
//import processing.sound.*;

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
 
Minim minim;
AudioPlayer file1;
AudioPlayer file2;
AudioPlayer file3;
AudioPlayer file4;
boolean keyP;


Serial myPort;    // The serial port
PFont myFont;     // The display font
String inString;  // Input string from serial port
int lf = 10;      // ASCII linefeed 
 int value = 0;
 
void setup() { 
  size(400,200); 
  // You'll need to make this font with the Create Font Tool 

  // List all the available serial ports: 
  printArray(Serial.list()); 
  // I know that the first port in the serial list on my mac 
  // is always my  Keyspan adaptor, so I open Serial.list()[0]. 
  // Open whatever port is the one you're using. 
  myPort = new Serial(this, Serial.list()[0], 9600); 

  minim = new Minim(this);
  file1 = minim.loadFile("sample.mp3");
  
  file2 = minim.loadFile("sample1.mp3");
  file3 = minim.loadFile("sample2.mp3");
  file4 = minim.loadFile("sample3.mp3");

} 
 
void draw() { 
  background(0); 
  text("received: " + inString, 10,50); 
  text(value , 40,90); 
  
} 



void keyPressed() {
    //if (key == 'g' && !file1.isPlaying()) {
    if (key == 'g') {
      myPort.write("1\n");
  // Load a soundfile from the /data folder of the sketch and play it back
      file1.rewind();
      file1.play();
    //} else if (key == 'f' && !file2.isPlaying()) {
    } else if (key == 'f') {
      myPort.write("2\n");
  // Load a soundfile from the /data folder of the sketch and play it back
      file2.rewind();
      file2.play();
     
    //} else if (key ==  'd' && !file2.isPlaying()) {
    } else if (key ==  'd') {
      myPort.write("3\n");
  // Load a soundfile from the /data folder of the sketch and play it back
      file3.rewind();
      file3.play();
    } 
     //else if (key == 's' && !file2.isPlaying()) {
     else if (key == 's') {
      myPort.write("4\n");
  // Load a soundfile from the /data folder of the sketch and play it back
      file4.rewind();
      file4.play();
     
  } else {
    myPort.write("n\n");
  }
    
}
