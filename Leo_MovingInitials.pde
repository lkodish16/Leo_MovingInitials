#include <MeggyJrSimple.h>  // Required code, line 1 of 2.

void setup() {
  MeggyJrSimpleSetup();  // Required code, line 2 of 2.
}

int dir = 1;
int count = 0;

struct Point {  // name for the class.
  int x;  // x coordinate.
  int y;  // y coordinate.
};

Point L1 = {2,6};
Point L2 = {2,5};  // points s1-s7 hold the coordinates of the initial.
Point L3 = {2,4};
Point L4 = {2,3};
Point L5 = {2,2};
Point L6 = {3,2};
Point L7 = {4,2};
Point L8 = {5,2};


Point initialsL[8] = {L1, L2, L3, L4, L5 , L6, L7, L8};  // array holds coordinates for L drawing.

Point K1 = {2,6};
Point K2 = {2,5};
Point K3 = {2,4};
Point K4 = {2,3};
Point K5 = {2,2};
Point K6 = {5,6};
Point K7 = {4,5};
Point K8 = {3,4};
Point K9 = {4,3};
Point K10 = {5,2};

Point initialsK[10] = {K1, K2, K3, K4, K5, K6, K7, K8, K9, K10};  // array holds coordinates for K drawing.



void loop() {
  drawL();
  shiftL();
  checkLimits();
  drawK(); 
  DisplaySlate();
  ClearSlate();
  delay(50);
}

void drawL() {
  for (int i = 0; i < 8; i++) {
    DrawPx(initialsL[i].x, initialsL[i].y, Red);  // draws contents of the array.
  }
}

void shiftL() {
  CheckButtonsPress();
  CheckButtonsDown();
  for (int i = 0; i < 8; i++) {
  if (Button_Up) {  // if up button is pressed, increase y by 1.
    initialsL[i].y = initialsL[i].y + 1;
  }
  if (Button_Down) {  // if down button is pressed, decrease y by 1.
    initialsL[i].y = initialsL[i].y - 1;
  }
  if (Button_Right) {  // if right button is pressed, increase x by 1.
    initialsL[i].x = initialsL[i].x + 1;
  }
  if (Button_Left) {  // if left button is pressed, decrease x by 1.
    initialsL[i].x = initialsL[i].x - 1; 
  }
  }  
}

void checkLimits() {
  for (int i = 0; i < 8; i++) {
  if (initialsL[i].x == -1) {  // initials wraps around from left to right.
    initialsL[i].x = 7;
  } 
  if (initialsL[i].x == 8) {  // initials wraps around from right to left.
    initialsL[i].x = 0;
  }
  if (initialsL[i].y == -1) {  // initial wraps around from bottom to top.  
    initialsL[i].y = 7;
  }
  if (initialsL[i].y == 8) {  // initial wraps around from top to bottom.
    initialsL[i].y = 0;
  }
  }
}

void drawK() {  // draws my other initial.
  if (Button_A) {
    count++; 
    }
    
  if (count % 2 != 0) {
    ClearSlate();
    for (int i = 0; i < 10; i++) {
      DrawPx(initialsK[i].x, initialsK[i].y, Blue);
      DisplaySlate();  
  }
}
}

void shiftK() {
  CheckButtonsPress();
  CheckButtonsDown();
  if (count % 2 != 0) {
    for (int i = 0; i < 8; i++) {
      if (Button_Up) {  // if up button is pressed, increase y by 1.
      initialsK[i].y = initialsK[i].y + 1;
      }
      if (Button_Down) {  // if down button is pressed, decrease y by 1.
      initialsK[i].y = initialsK[i].y - 1;
      }
      if (Button_Right) {  // if right button is pressed, increase x by 1.
      initialsK[i].x = initialsK[i].x + 1;
       }
      if (Button_Left) {  // if left button is pressed, decrease x by 1.
      initialsK[i].x = initialsK[i].x - 1; 
        }
     }  
  }
}
    
  
  

  



      
  
