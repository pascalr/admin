//// OPTIMIZE: Use interrupts instead of askedToStop I believe
//// Relative movement. Move from zero to destination.
//// TODO: When stopped, write at what position.
//// Using percent per time, with a trapezoidal curve
//void moveWithAcceleration(StepperConfig stepper, double destination) {
//
//  bool dir = destination > 0 ? LOW : HIGH;
//  dir = stepper.reverse_motor_direction ? !dir : dir;
//  digitalWrite(stepper.pin_dir, dir);
//
//  double min_percent = (double) stepper.min_delay / (double) stepper.max_delay;
//  double percent = min_percent; // Start at the minimum percentage of max speed
//  int phaseNb = 1; // what phase the motor is in
//
//  bool isStepHigh = digitalRead(stepper.pin_step);
//
//  //unsigned long startTime = micros();
//  unsigned long timeSinceStart = 0;
//  double max_percent_reached = 0;
//  double time_started_decelerating = 0;
//  long distance_accelerating = 0;
//  double timeSinceStartS = 0;
//
//  double dest = abs(destination);
//      
//  //unsigned long dest = abs(destination) * stepper.steps_per_unit; // destination in steps
//  for (unsigned long pos = 0; pos < dest * stepper.steps_per_unit; pos++) {
//
//    if (askedToStop()) { writeStopPosition(); break; }
//
//    digitalWrite(stepper.pin_step, isStepHigh ? LOW : HIGH);
//    isStepHigh = !isStepHigh;
//    //double timeSinceStartS = timeDifference(startTime, micros()) / 1000000.0;
//
//    // Accelerating
//    if (phaseNb == 1) {
//
//      if (pos >= dest / 2.0) {
//        phaseNb = 3;
//        time_started_decelerating = timeSinceStartS;
//        //debug_time_finished_accelerating_s = timeSinceStartS;
//        max_percent_reached = percent;
//
//      } else {
//        percent = stepper.percent_p * timeSinceStartS;
//        if (percent >= 1.0) {
//          distance_accelerating = pos;
//          max_percent_reached = 1.0;
//          percent = 1.0;
//          phaseNb = 2;
//        }
//      }
//
//    // Constant speed
//    } else if (phaseNb == 2) {
//
//      if (pos > dest - distance_accelerating) {
//        phaseNb = 3;
//        time_started_decelerating = timeSinceStartS;
//        //debug_time_finished_accelerating_s = timeSinceStartS;
//      }
//
//    // Decelerating
//    } else {
//
//      percent = max_percent_reached - stepper.percent_p * (timeSinceStartS - time_started_decelerating);
//    }
//
//    long next_step_delay = (percent <= min_percent) ? stepper.max_delay : stepper.min_delay / percent;
//    delayMicroseconds(next_step_delay);
//    timeSinceStartS += next_step_delay/1000000.0;
//  }
//}
//
////void shake(Program& p, Motor* motor) {
////  
////  if (!motor) return;
////
////  unsigned long startTimeUs = p.getCurrentTime();
////  
////  unsigned long time = 0;
////  //unsigned long shakingTimeUs = 1000 * 1000; // WARNING: THIS DOES NOT WORK
////  //unsigned long shakingTimeUs = (unsigned long)1000 * (unsigned long)1000; // BUT THIS DOES
////  unsigned long shakingTimeUs = 2000000;
////
////  unsigned long lastShakeTime = 0;
////  unsigned long shakingIntervalUs = 100000;
////
////  bool forward = true;
////
////  while (time < shakingTimeUs) {
////    
////    if (askedToStop(p)) {
////      motor->stop();
////      break;
////    }
////
////    if (timeDifference(lastShakeTime, time) > shakingIntervalUs) {
////      //p.sleepMs(50); // Sleep a little so it is not too much of a big change to not loose steps.
////      motor->setMotorDirection(!motor->getMotorDirection());
////      lastShakeTime = time;
////    }
////
////    unsigned long now = p.getCurrentTime();
////    motor->run(now, SHAKE_SPEED_RPM);
////    time = timeDifference(startTimeUs, now);
////  }
////
////  motor->stop();
////}
