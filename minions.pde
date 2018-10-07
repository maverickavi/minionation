  import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

PImage img;
PImage fullEye;
PImage halfEyeL;
PImage halfEyeU;

float val;
float f = 0.1;
int s = 0;
float m, n;

void setup() {
  size(1200, 900, P3D);
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  img = loadImage("background1.jpg");
  fullEye = loadImage("eye full 1.png");
  halfEyeU = loadImage("eye half 2.png");
  halfEyeL = loadImage("eye half 1.png");
  frameRate(30);
  
}

void draw() {
  val = checkArduino();
  if (val!= f)
    s=1;
  else
    s=0;
  background(img);
  pushMatrix();
  translate(187 + s*(((((width-224)/6) * val + 112) - 187) * 12)/1200, 618);
  textureMode(NORMAL);
  beginShape();
  texture(halfEyeU);
  noStroke();
  vertex(-9, -13, 0, 0, 0);
  vertex( 9, -13, 0, 1, 0);
  vertex( 9,  2, 0, 1, 1);
  vertex(-9,  2, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(232 + s*(((((width-224)/6) * val + 112) - 232) * 12)/1200, 619);
  textureMode(NORMAL);
  beginShape();
  texture(halfEyeU);
  noStroke();
  vertex(-9, -13, 0, 0, 0);
  vertex( 9, -13, 0, 1, 0);
  vertex( 9,  2, 0, 1, 1);
  vertex(-9,  2, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(395 + s*(((((width-224)/6) * val + 112) - 395) * 12)/1200, 618);
  textureMode(NORMAL);
  beginShape();
  texture(fullEye);
  noStroke();
  vertex(-9, -9, 0, 0, 0);
  vertex( 9, -9, 0, 1, 0);
  vertex( 9,  9, 0, 1, 1);
  vertex(-9,  9, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(440 + s*(((((width-224)/6) * val + 112) - 440) * 12)/1200, 618);
  textureMode(NORMAL);
  beginShape();
  texture(fullEye);
  noStroke();
  vertex(-9, -9, 0, 0, 0);
  vertex( 9, -9, 0, 1, 0);
  vertex( 9,  9, 0, 1, 1);
  vertex(-9,  9, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(598 + s*(((((width-224)/6) * val + 112) - 598) * 12)/1200, 672);
  textureMode(NORMAL);
  beginShape();
  texture(halfEyeL);
  noStroke();
  vertex(-9, -4, 0, 0, 0);
  vertex( 9, -4, 0, 1, 0);
  vertex( 9, 10, 0, 1, 1);
  vertex(-9, 10, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(790 + s*(((((width-224)/6) * val + 112) - 790) * 12)/1200, 618);
  textureMode(NORMAL);
  beginShape();
  texture(fullEye);
  noStroke();
  vertex(-9, -9, 0, 0, 0);
  vertex( 9, -9, 0, 1, 0);
  vertex( 9,  9, 0, 1, 1);
  vertex(-9,  9, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(835 + s*(((((width-224)/6) * val + 112) - 835) * 12)/1200, 618);
  textureMode(NORMAL);
  beginShape();
  texture(fullEye);
  noStroke();
  vertex(-9, -9, 0, 0, 0);
  vertex( 9, -9, 0, 1, 0);
  vertex( 9,  9, 0, 1, 1);
  vertex(-9,  9, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(995 + s*(((((width-224)/6) * val + 112) - 995) * 12)/1200, 619);
  textureMode(NORMAL);
  beginShape();
  texture(halfEyeU);
  noStroke();
  vertex(-9, -13, 0, 0, 0);
  vertex( 9, -13, 0, 1, 0);
  vertex( 9,  2, 0, 1, 1);
  vertex(-9,  2, 0, 0, 1);
  endShape();
  popMatrix();
  
  pushMatrix();
  translate(1040 + s*(((((width-224)/6) * val + 112) - 1040) * 12)/1200, 618);
  textureMode(NORMAL);
  beginShape();
  texture(halfEyeU);
  noStroke();
  vertex(-9, -13, 0, 0, 0);
  vertex( 9, -13, 0, 1, 0);
  vertex( 9,  2, 0, 1, 1);
  vertex(-9,  2, 0, 0, 1);
  endShape();
  popMatrix();
  
    
}

float checkArduino(){
  int y = 0;
  for(int l=0; l<7; l++){
     y = y + arduino.analogRead(l);
  }
  if (y / 7 > 1020)
    return f;
   
  for (int p = 0; p < 7; p++) {
    
        if (abs (arduino.analogRead(p+1) - arduino.analogRead(p)) > 20){
          if((arduino.analogRead(p+1) - arduino.analogRead(p)) > 20)
            if (arduino.analogRead(0)<1020 && p>0)
              m = float (p/2);
            else
              m = float (p);
          else
            m = float(p + 1);
          break;
           }
        
  }
  for (int q=7; q > 1; q--){
        if (abs (arduino.analogRead(q-1) - arduino.analogRead(q-2)) > 20){
          if((arduino.analogRead(q-1) - arduino.analogRead(q-2)) > 20)
              if (arduino.analogRead(6)<1020 && q>0)
                n = float((q - 2)/2);
              else
                n = float(q - 2);
           
          else
            n = float(q - 1);
          break;
           }
        
  }
     
      if (m == n)
        return m;
      else{
        float z= (m + n)/2.0;
        return z;
      }
} 
