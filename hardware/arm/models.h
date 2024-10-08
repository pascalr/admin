#ifndef _MODELS_H
#define _MODELS_H

class Motor {
  public:
    virtual void stop() {}

    long position_steps = 0; // Absolute position in steps
    double destination = 0; // Absolute destination in units
    char id;
    bool reverse_motor_direction = false;
};

class DCMotor : public Motor {
  void turn(bool dir, double strength);
};

class BrakeDCMotor : public DCMotor {
  public:
  
    int pin_in1;
    int pin_in2;
    int pin_pwm;

    void stop();
    void turn(bool dir, double strength);
    
    //int pin_encoder;
    //bool reverse_motor_direction;    
    //void setUnitsPerStep(double unitsPerTurn, int wheelNbHoles) {
    //  units_per_step = unitsPerTurn / wheelNbHoles;
    //}
    //double getUnitsPerStep() {
    //  return units_per_step;
    //}
    
  //private:
  
    //double units_per_step;
};

class MotorConfig : public DCMotor {
  public:
  
    int pin_dir;
    int pin_pwm;
    int pin_encoder;
      
    void stop() {
      analogWrite(pin_pwm, 0.0);
    }
        
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
