#ifndef _BALANCE_H
#define _BALANCE_H

// https://github.com/aguegu/ardulibs/tree/master/hx711 
//#include "hx711.h"

class Hx711Scale {
  public:
	  const uint8_t pin_dout;
	  const uint8_t pin_slk;
	  long offset;
	  float ratio;
};

void calibrateEmpty(Hx711Scale &scale) {
  scale.offset = averageValue(scale);
}

void calibrateWithWeight(Hx711Scale &scale, double weight, double offset) {
  scale.ratio = (averageValue(scale) - offset) / weight;
  Serial.print("ratio: ");
  Serial.println(scale.ratio);
}

void setupScale(Hx711Scale &scale) {
	pinMode(scale.pin_slk, OUTPUT);
	pinMode(scale.pin_dout, INPUT);

	digitalWrite(scale.pin_slk, HIGH);
	delayMicroseconds(100);
	digitalWrite(scale.pin_slk, LOW);
}

long getValue(Hx711Scale &scale) {

	byte data[3];

	while (digitalRead(scale.pin_dout))
		;

	for (byte j = 3; j--;)
	{
		for (char i = 8; i--;)
		{
			digitalWrite(scale.pin_slk, HIGH);
			bitWrite(data[j], i, digitalRead(scale.pin_dout));
			digitalWrite(scale.pin_slk, LOW);
		}
	}

	digitalWrite(scale.pin_slk, HIGH);
	digitalWrite(scale.pin_slk, LOW);

	data[2] ^= 0x80;

	return ((uint32_t) data[2] << 16) | ((uint32_t) data[1] << 8)
			| (uint32_t) data[0];
}

long averageValue(Hx711Scale &scale, byte times=32) {

	long sum = 0;
	for (byte i = 0; i < times; i++){
		sum += getValue();
	}
	return sum / times;
}

float getGram(Hx711Scale &scale, byte times=32) {

	long val = (averageValue(scale, times) - scale.offset);
	return (float) val / scale.ratio;
}

#endif
