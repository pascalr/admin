#ifndef _LIB_H
#define _LIB_H

#include "models.h"
#include "config.h"

// Check if the time has wrapped around.
unsigned long timeDifference(unsigned long oldTime, unsigned long currentTime) {
  
  if (currentTime < oldTime) {
    unsigned long maxLong = 0; maxLong--;
    return maxLong - oldTime + currentTime;
  }
  return currentTime - oldTime;
}


bool askedToStop() {
  while (Serial.available() > 0) {
    int incomingByte = Serial.read();
    if (incomingByte < 0) {return false;}
    char cmd = (char) incomingByte;

    // stop
    if (cmd == 's' || cmd == 'S') {
      return true;
    }
  }
  return false;
}

bool referenceReachedH() {
  return digitalRead(H_MIN_PIN) == LOW || askedToStop();
}

bool referenceReachedV() {
  return digitalRead(V_MIN_PIN) == LOW || askedToStop();
}

void writeStopPosition() {
  // TODO
}

// Returns the number of bytes read.
// Arduino already has a function that does this, but it was so slow I don't know why.
int getInputLine(char* buf, int bufSize) {
  int i = 0;
  while (true) {
    if (Serial.available() > 0) {

      char ch = Serial.read();

      if (ch == '\n') break;
      if (i >= bufSize-1) break;
      buf[i] = ch;
      i++;
    }
    //delay(50); // OPTIMIZE: Probably useless since it is busy wait I believe
  }
  buf[i] = '\0';
  return i;
}

int parseNumber(char** input, double& n) {
  char* pEnd;
  n = strtod(*input, &pEnd);
  // If no number was found
  if (pEnd == *input) {return -1;}
  *input = pEnd;
  return 0;
}





#endif
