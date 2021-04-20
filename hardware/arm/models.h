#ifndef _MODELS_H
#define _MODELS_H

class Motor {
  public:
    long position_steps = 0; // Absolute position in steps
    double destination = 0; // Absolute destination in units
    char id;
};

class MotorConfig : public Motor {
  public:
  
    int pin_dir;
    int pin_pwm;
    int pin_encoder;

    bool reverse_motor_direction;
    
    void setUnitsPerStep(double unitsPerTurn, int wheelNbHoles) {
      units_per_step = unitsPerTurn / wheelNbHoles;
    }

    double getUnitsPerStep() {
      return units_per_step;
    }
    
  private:
  
    double units_per_step;
};

class StepperConfig : public Motor {
  public:    
    int pin_dir;
    int pin_step;
    int pin_enable;

    bool reverse_motor_direction;

    double steps_per_unit;

    int min_delay = 500;
    int max_delay = 10000;

    double percent_p = 0.4; // Acceleration

    int nominal_delay = 5000; // Used for constant speed
    int reference_delay = 5000;

    bool is_step_high = false;
    unsigned long last_step_time = 0;
};

#endif
