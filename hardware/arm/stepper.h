#ifndef _STEPPER_H
#define _STEPPER_H

StepperConfig* parseStepper(char** input, StepperConfig** steppers) {
  for (int i = 0; steppers[i] != NULL; i++) {
    if (steppers[i]->id == **input) {
      (*input)++;
      return steppers[i];
    }
  }
  return NULL;
}

// OPTIMIZE: Use interrupts instead of askedToStop I believe
// Move to absolute destination
int move(StepperConfig *stepper, long delay, bool (*stopCondition)() = askedToStop) {

  double destSteps = stepper->destination * stepper->steps_per_unit;
  
  bool going_forward = destSteps > stepper->position_steps;
  bool dir = going_forward ? LOW : HIGH;
  dir = stepper->reverse_motor_direction ? !dir : dir;
  digitalWrite(stepper->pin_dir, dir);

  unsigned long startTime = micros();
  
  while (going_forward ? stepper->position_steps < destSteps : stepper->position_steps > destSteps) {

    if (stopCondition()) {writeStopPosition(); return -1;}

    unsigned long timeSinceStartUs = timeDifference(startTime, micros());

    if (timeDifference(stepper->last_step_time, timeSinceStartUs) > delay) {
      digitalWrite(stepper->pin_step, stepper->is_step_high ? LOW : HIGH);
      stepper->is_step_high = !stepper->is_step_high;
      stepper->last_step_time = timeSinceStartUs;
      stepper->position_steps += going_forward ? 1 : -1;
    }
  }
  return 1;
}

#endif
