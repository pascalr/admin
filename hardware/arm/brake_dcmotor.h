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

void brake_stop(BrakeDCMotor &gripper) {
  analogWrite(gripper.pin_pwm, 0.0);
  digitalWrite(gripper.pin_in1, LOW);
  digitalWrite(gripper.pin_in2, LOW);
}

// Strength between 0 and 255, where 255 is full speed.
void brake_grab(BrakeDCMotor &gripper, double strength) {

  analogWrite(gripper.pin_pwm, strength);
  digitalWrite(gripper.pin_in1, gripper.reverse_motor_direction ? LOW : HIGH);
  digitalWrite(gripper.pin_in2, gripper.reverse_motor_direction ? HIGH : LOW);
  
  //digitalWrite(gripper.pin_dir, gripper.reverse_motor_direction ? HIGH : LOW);
  //analogWrite(gripper.pin_pwm, strength);
  //bool isStalled;
  //while (!(isMotorStalled(gripper, isStalled, false) < 0 || isStalled)) {}
}

#endif
