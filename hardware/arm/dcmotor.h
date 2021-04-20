#ifndef _DCMOTOR_H
#define _DCMOTOR_H

MotorConfig* parseDCMotor(char** input, MotorConfig** motors) {
  for (int i = 0; motors[i] != NULL; i++) {
    if (motors[i]->id == **input) {
      (*input)++;
      return motors[i];
    }
  }
  return NULL;
}

void release(MotorConfig gripper) {
  digitalWrite(gripper.pin_dir, gripper.reverse_motor_direction ? LOW : HIGH);
  analogWrite(gripper.pin_pwm, GRIP_RELEASE_STRENGTH);
}

int isMotorStalled(MotorConfig &motor, bool &isStalled, bool isForward) {
  
  bool initialState = digitalRead(motor.pin_encoder);
  for (int i = 0; i < 2000; i++) {
    if (digitalRead(motor.pin_encoder) != initialState) {
      motor.position_steps += isForward ? 1 : -1;
      isStalled = false; return 1;
    }
    delayMicroseconds(50);
    if (askedToStop()) return -1;
  }
  isStalled = true; return 1;
}

void grab(MotorConfig &gripper, double strength) {
  digitalWrite(gripper.pin_dir, gripper.reverse_motor_direction ? HIGH : LOW);
  analogWrite(gripper.pin_pwm, strength);
  bool isStalled;
  while (!(isMotorStalled(gripper, isStalled, false) < 0 || isStalled)) {}
}

int moveDCMotor(MotorConfig &motor) {

  long destSteps = motor.destination/motor.getUnitsPerStep();

  bool isForward = destSteps > motor.position_steps;
  bool dir = destSteps > motor.position_steps ? HIGH : LOW;
  dir = motor.reverse_motor_direction ? !dir : dir;
  digitalWrite(motor.pin_dir, dir);
  analogWrite(motor.pin_pwm, GRIP_RELEASE_STRENGTH);

  long stepsNeeded = abs(destSteps - motor.position_steps);
  for (int i = 0; i < stepsNeeded; i++) {
    bool isStalled;
    if (isMotorStalled(motor, isStalled, isForward) < 0 || isStalled) {
      analogWrite(motor.pin_pwm, 0.0);
      return -1;
    }
  }
  analogWrite(motor.pin_pwm, 0.0);
  return 1;
}

int referenceDCMotor(MotorConfig &motor) {
  digitalWrite(motor.pin_dir, motor.reverse_motor_direction ? HIGH : LOW);
  analogWrite(motor.pin_pwm, GRIP_RELEASE_STRENGTH);
  bool isStalled;
  while (true) {
    if (isMotorStalled(motor, isStalled, false) < 0) {
      analogWrite(motor.pin_pwm, 0.0);
      return -1;
    }
    if (isStalled) {
      analogWrite(motor.pin_pwm, 0.0);
      motor.position_steps = 0;
      return 1;
    }
  }
}

#endif
