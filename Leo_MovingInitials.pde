#include <MeggyJrSimple.h>  // Required code, line 1 of 2.

void setup() {
  MeggyJrSimpleSetup();  // Required code, line 2 of 2.
}

int dir = 1;

struct Point {  // name for the class.
  int x;  // x coordinate.
  int y;  // y coordinate.
};

Point s1 = {2,6};
Point s2 = {2,5};  // points s1-s7 hold the coordinates of the initial.
Point s3 = {2,4};
Point s4 = {2,3};
Point s5 = {2,2};
Point s6 = {3,2};
Point s7 = {4,2};
Point s8 = {5,2};


Point initials[10] = {s1, s2, s3, s4, s5 ,s6, s7, s8};  // array inital holds the initial coordinates of the letter.



void loop() {
  drawInitial();
  shiftInitials();
  checkLimits();
  DisplaySlate();
  ClearSlate();
  delay(50);
}

void drawInitial() {
  for (int i = 0; i < 8; i++) {
    DrawPx(initials[i].x, initials[i].y, Red);  // draws contents of the array.
  }
}

void shiftInitials() {
  CheckButtonsPress();
  
  for (int i = 0; i < 8; i++) {
  if (Button_Up) {  // if up button is pressed, increase y by 1.
    initials[i].y = initials[i].y + 1;
  }
  if (Button_Down) {  // if down button is pressed, decrease y by 1.
    initials[i].y = initials[i].y - 1;
  }
  if (Button_Right) {  // if right button is pressed, increase x by 1.
    initials[i].x = initials[i].x + 1;
  }
  if (Button_Left) {  // if left button is pressed, decrease x by 1.
    initials[i].x = initials[i].x - 1; 
  }
  }  
}

void checkLimits() {
  for (int i = 0; i < 8; i++) {
  if (initials[i].x == -1) {  // initials wraps around from left to right.
    initials[i].x = 7;
  } 
  if (initials[i].x == 8) {  // initials wraps around from right to left.
    initials[i].x = 0;
  }
  if (initials[i].y == -1) {  // initial wraps around from bottom to top.  
    initials[i].y = 7;
  }
  if (initials[i].y == 8) {  // initial wraps around from top to bottom.
    initials[i].y = 0;
  }
  }
}



      
  
