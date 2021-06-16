#ifndef _CONFIG_H
#define _CONFIG_H

#define GRIP_PIN_DIR 4
#define GRIP_PIN_PWM 5
#define GRIP_PIN_ENCODER 32
#define GRIP_RELEASE_STRENGTH 60 // From 0 to 255, 255 being 100% motor strength.
#define GRIP_REVERSE_DIR true

#define GRIP2_PIN_DIR 11
#define GRIP2_PIN_PWM 6
#define GRIP2_REVERSE_DIR true

#define ENCODER_PIN 32

#define H_STEP_PIN         16
#define H_DIR_PIN          23
#define H_ENABLE_PIN       17

#define V_STEP_PIN         31
#define V_DIR_PIN          35
#define V_ENABLE_PIN       33

#define H_MIN_PIN           3
//#define X_MAX_PIN           2
#define V_MIN_PIN          14
//#define Y_MAX_PIN          15

#define A_STEP_PIN         46
#define A_DIR_PIN          48
#define A_ENABLE_PIN       62

#define B_STEP_PIN         60
#define B_DIR_PIN          61
#define B_ENABLE_PIN       56
//#define Z_MIN_PIN          18
//#define Z_MAX_PIN          19

#define T_STEP_PIN         26
#define T_DIR_PIN          28
#define T_ENABLE_PIN       24

#define BUF_SIZE 52

#endif
