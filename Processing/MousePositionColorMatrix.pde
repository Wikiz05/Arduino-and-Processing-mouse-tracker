// processing sketch by Waldo Costa
// 2017/11/19

int[][] rx;
int[][] gx;
int[][] bx;

import processing.serial.*;

// The serial port:
Serial myPort;


int rect_size = 150;

int x = 0;
int y = 0;


void setup() 
{
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);

  rx = new int[4][5];
  gx = new int[4][5];
  bx = new int[4][5];


  // set the inicial colors of the matrix
  for (int i=0; i<4; i++)
  {
    for (int j=0; j<5; j++)
    {
      rx[i][j]=(i+j)*20;
      gx[i][j]=(i+j);
      bx[i][j]=(i)*20;
    }
  }


  size(750, 600);
  background(0); //black background
  smooth();
  rectMode(CORNER);
}

void draw() {


  for (int i=0; i<4; i++)
  {
    for (int j=0; j<5; j++)
    {
      // draw colored rectangles
      x = j*(750)/5;
      y = i*(600)/4;
      fill(rx[i][j], gx[i][j], bx[i][j], 255);
      rect(x, y, rect_size, rect_size);
      // send color values to serial port
      myPort.write((i) + "," + (j) + "," + rx[i][j] + "," + gx[i][j] + "," + bx[i][j] + "\n");
      // send color values to Processing console
      println((i) + "," + (j) + "," + rx[i][j] + "," + gx[i][j] + "," + bx[i][j] + "\n");
    }
  }


  // LINHA 0
  if ((mouseX <= 150) && (mouseY <= 150)) {
    reset_colors();
    rx[0][0]=0;
    gx[0][0]=255;
    bx[0][0]=0;
  } else if ((mouseX <= 300) && (mouseY <= 150)) {
    reset_colors();
    rx[0][1]=0;
    gx[0][1]=255;
    bx[0][1]=0;
  } else if ((mouseX <= 450) && (mouseY <= 150)) {
    reset_colors();
    rx[0][2]=0;
    gx[0][2]=255;
    bx[0][2]=0;
  } else if ((mouseX <= 600) && (mouseY <= 150)) {
    reset_colors();
    rx[0][3]=0;
    gx[0][3]=255;
    bx[0][3]=0;
  } else { //if ((mouseX <= 750) && (mouseY <= 150))   {
    reset_colors();
    rx[0][4]=0;
    gx[0][4]=255;
    bx[0][4]=0;
  }


  // line 1
  if ((mouseX <= 150) && (mouseY <= 300) && (mouseY >= 150)) {
    reset_colors();
    rx[1][0]=0;
    gx[1][0]=255;
    bx[1][0]=0;
  } else if ((mouseX <= 300) && (mouseY <= 300) && (mouseY >= 150)) {
    reset_colors();
    rx[1][1]=0;
    gx[1][1]=255;
    bx[1][1]=0;
  } else if ((mouseX <= 450) && (mouseY <= 300) && (mouseY >= 150)) {
    reset_colors();
    rx[1][2]=0;
    gx[1][2]=255;
    bx[1][2]=0;
  } else if ((mouseX <= 600) && (mouseY <= 300) && (mouseY >= 150)) {
    reset_colors();
    rx[1][3]=0;
    gx[1][3]=255;
    bx[1][3]=0;
  } else if ((mouseX <= 750) && (mouseY <= 300) && (mouseY >= 150)) {
    reset_colors();
    rx[1][4]=0;
    gx[1][4]=255;
    bx[1][4]=0;
  }


  // line 2
  else if ((mouseX <= 150) && (mouseY <= 450) && (mouseY >= 300)) {
    reset_colors();
    rx[2][0]=0;
    gx[2][0]=255;
    bx[2][0]=0;
  } else if ((mouseX <= 300) && (mouseY <= 450) && (mouseY >= 300)) {
    reset_colors();
    rx[2][1]=0;
    gx[2][1]=255;
    bx[2][1]=0;
  } else if ((mouseX <= 450) && (mouseY <= 450) && (mouseY >= 300)) {
    reset_colors();
    rx[2][2]=0;
    gx[2][2]=255;
    bx[2][2]=0;
  } else if ((mouseX <= 600) && (mouseY <= 450) && (mouseY >= 300)) {
    reset_colors();
    rx[2][3]=0;
    gx[2][3]=255;
    bx[2][3]=0;
  } else if ((mouseX <= 750) && (mouseY <= 450) && (mouseY >= 300)) {
    reset_colors();
    rx[2][4]=0;
    gx[2][4]=255;
    bx[2][4]=0;
  }


  // line 3
  else if ((mouseX <= 150) && (mouseY <= 600) && (mouseY >= 450)) {
    reset_colors();
    rx[3][0]=0;
    gx[3][0]=255;
    bx[3][0]=0;
  } else if ((mouseX <= 300) && (mouseY <= 600) && (mouseY >= 450)) {
    reset_colors();
    rx[3][1]=0;
    gx[3][1]=255;
    bx[3][1]=0;
  } else if ((mouseX <= 450) && (mouseY <= 600) && (mouseY >= 450)) {
    reset_colors();
    rx[3][2]=0;
    gx[3][2]=255;
    bx[3][2]=0;
  } else if ((mouseX <= 600) && (mouseY <= 600) && (mouseY >= 450)) {
    reset_colors();
    rx[3][3]=0;
    gx[3][3]=255;
    bx[3][3]=0;
  } else if  ((mouseX <= 750) && (mouseY <= 600) && (mouseY >= 450)) {
    reset_colors();
    rx[3][4]=0;
    gx[3][4]=255;
    bx[3][4]=0;
  }
}

void reset_colors()
{
  for (int i=0; i<4; i++)
  {
    for (int j=0; j<5; j++)
    {
      rx[i][j]=(i+j)*20;
      gx[i][j]=(i+j);
      bx[i][j]=(i)*20;
    }
  }
}
