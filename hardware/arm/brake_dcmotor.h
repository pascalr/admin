#ifndef _BRAKE_DCMOTOR_H
#define _BRAKE_DCMOTOR_H

// TODO: Add a safety of at least 0.1s before switching between forward and reverse

BrakeDCMotor* parseBrakeDCMotor(char** input, BrakeDCMotor** motors) {
  for (int i = 0; motors[i] != NULL; i++) {
    if (motors[i]->id == **input) {
      (*input)++;
      return motors[i];
    }
  }
  return NULL;
}
    
void BrakeDCMotor::stop() {
  analogWrite(pin_pwm, 0.0);
  digitalWrite(pin_in1, LOW);
  digitalWrite(pin_in2, LOW);
}

// Strength between 0 and 255, where 255 is full speed.
void BrakeDCMotor::turn(bool dir, double strength) {

  analogWrite(pin_pwm, strength);
  bool in1 = reverse_motor_direction ? LOW : HIGH;
  if (dir == CCW) { in1 = !in1; }
  digitalWrite(pin_in1, in1);
  digitalWrite(pin_in2, !in1);
}

// Strength between 0 and 255, where 255 is full speed.
void brake_grab(BrakeDCMotor &gripper, double strength) {

  gripper.turn(CW, strength);
  //bool isStalled;
  //while (!(isMotorStalled(gripper, isStalled, false) < 0 || isStalled)) {}
}

void brake_release(BrakeDCMotor &gripper) {

  analogWrite(gripper.pin_pwm, BRAKE_GRIPPER_RELEASE_STRENGTH);
  digitalWrite(gripper.pin_in1, gripper.reverse_motor_direction ? HIGH : LOW);
  digitalWrite(gripper.pin_in2, gripper.reverse_motor_direction ? LOW : HIGH);
  
  //digitalWrite(gripper.pin_dir, gripper.reverse_motor_direction ? HIGH : LOW);
  //analogWrite(gripper.pin_pwm, strength);
  //bool isStalled;
  //while (!(isMotorStalled(gripper, isStalled, false) < 0 || isStalled)) {}
}

#endif
