#include "config.h"
#include "models.h"
#include "lib.h"
#include "stepper.h"
#include "dcmotor.h"
#include "balance.h"
#include "brake_dcmotor.h"

char buf[BUF_SIZE];

StepperConfig stepper_j;
StepperConfig stepper_h;
StepperConfig stepper_v;
StepperConfig stepper_t;
StepperConfig stepper_a;
StepperConfig stepper_b;

StepperConfig* steppers[] = {&stepper_h, &stepper_v, &stepper_t, &stepper_a, &stepper_b, NULL};

MotorConfig gripper_1;

BrakeDCMotor gripper_3;

MotorConfig* grippers[] = {&gripper_1, NULL};

DCMotor* dc_motors[] = {&gripper_1, &gripper_3, NULL};

BrakeDCMotor* brake_grippers[] = {&gripper_3, NULL};

double alpha_radius;
double gripper_radius;
double user_coord_offset_z;
double user_coord_offset_x;
double gripper_side_offset;
double unscrew_start_angle;
double unscrew_end_angle;

const uint8_t scale_pin_dout = A5; // TODO: Generate this from Rails
const uint8_t scale_pin_slk = A9; // TODO: Generate this from Rails
long scale_offset; // TODO: Generate this from Rails
float scale_factor; // TODO: Generate this from Rails

Hx711Scale scale;

void setup() {

  Serial.begin(115200);

  gripper_1.id = '1';
  gripper_1.pin_dir = 4;
  gripper_1.pin_pwm = 5;
  gripper_1.pin_encoder = 32;
  gripper_1.reverse_motor_direction = true;
  gripper_1.setUnitsPerStep((0.186*25.4*14)/90.0, 8);
  pinMode(gripper_1.pin_dir, OUTPUT);
  pinMode(gripper_1.pin_pwm, OUTPUT);
  
  gripper_3.id = '3';
  gripper_3.pin_in1 = 59;
  gripper_3.pin_in2 = 64;
  gripper_3.pin_pwm = 44;
  gripper_3.reverse_motor_direction = false;
  pinMode(gripper_3.pin_pwm, OUTPUT);
  pinMode(gripper_3.pin_in1, OUTPUT);
  pinMode(gripper_3.pin_in2, OUTPUT);

  stepper_j.id = 'j';
  stepper_j.pin_dir = 8;
  stepper_j.pin_step = 8;
  stepper_j.pin_enable = 8;
  stepper_j.reverse_motor_direction = false;
  stepper_j.steps_per_unit = 200 * 2 * 16 / (360*12/61);
  stepper_j.min_delay = 500;
  stepper_j.max_delay = 10000;
  stepper_j.nominal_delay = 5000;
  stepper_j.reference_delay = 5000;
  stepper_j.percent_p = 0.3;

  stepper_h.id = 'h';
  stepper_h.pin_dir = 23;
  stepper_h.pin_step = 16;
  stepper_h.pin_enable = 17;
  stepper_h.reverse_motor_direction = true;
  stepper_h.steps_per_unit = 200 * 2 * 8 / (12.2244*3.1416);
  stepper_h.min_delay = 40;
  stepper_h.max_delay = 1000;
  stepper_h.nominal_delay = 200;
  stepper_h.reference_delay = 200;
  stepper_h.percent_p = 0.3;

  stepper_v.id = 'v';
  stepper_v.pin_dir = 35;
  stepper_v.pin_step = 31;
  stepper_v.pin_enable = 33;
  stepper_v.reverse_motor_direction = true;
  double unitPerTurnV = (2.625*25.4*3.1416 * 13/51);
  stepper_v.steps_per_unit = 200 * 2 * 32 / (unitPerTurnV);
  stepper_v.min_delay = 40;
  stepper_v.max_delay = 1000;
  stepper_v.nominal_delay = 200;
  stepper_v.reference_delay = 200;
  stepper_v.percent_p = 0.3;

  stepper_t.id = 't';
  stepper_t.pin_dir = 28;
  stepper_t.pin_step = 26;
  stepper_t.pin_enable = 24;
  stepper_t.reverse_motor_direction = false;
  stepper_t.steps_per_unit = 200 * 2 * 8 / (360*12/61);
  stepper_t.min_delay = 1000;
  stepper_t.max_delay = 1000;
  stepper_t.nominal_delay = 1000;
  stepper_t.reference_delay = 1000;
  stepper_t.percent_p = 0.4;

  stepper_a.id = 'a';
  stepper_a.pin_dir = 48;
  stepper_a.pin_step = 46;
  stepper_a.pin_enable = 62;
  stepper_a.reverse_motor_direction = true;
  stepper_a.steps_per_unit = 200 * 2 * 8 / (360*12/61);
  stepper_a.min_delay = 500;
  stepper_a.max_delay = 10000;
  stepper_a.nominal_delay = 1000;
  stepper_a.reference_delay = 2000;
  stepper_a.percent_p = 0.3;

  stepper_b.id = 'b';
  stepper_b.pin_dir = 61;
  stepper_b.pin_step = 60;
  stepper_b.pin_enable = 56;
  stepper_b.reverse_motor_direction = true;
  stepper_b.steps_per_unit = 200 * 2 * 8 / (360/60);
  stepper_b.min_delay = 500;
  stepper_b.max_delay = 10000;
  stepper_b.nominal_delay = 200;
  stepper_b.reference_delay = 1000;
  stepper_b.percent_p = 0.3;

  for (int i = 0; steppers[i] != NULL; i++) {
    
    pinMode(steppers[i]->pin_dir, OUTPUT);
    pinMode(steppers[i]->pin_step, OUTPUT);
    pinMode(steppers[i]->pin_enable, OUTPUT);
  
    digitalWrite(steppers[i]->pin_enable, LOW);  
  }

  for (int i = 0; dc_motors[i] != NULL; i++) {
    dc_motors[i]->stop();
  }

  pinMode(H_MIN_PIN, INPUT_PULLUP);
  pinMode(V_MIN_PIN, INPUT_PULLUP);
  
  //pinMode(LED_BUILTIN, OUTPUT);

  scale.pin_dout = scale_pin_dout;
  scale.pin_slk = scale_pin_slk;
  calibrateEmpty(scale);
};

void loop() {

  if (Serial.available()) {

    getInputLine(buf, BUF_SIZE);
    char cmd = buf[0];

    // ignore newline characters
    if (cmd == '\r' || cmd == '\n' || cmd == 0) return;

    Serial.print("echo: ");
    Serial.println(cmd);
    
    double nb;
    char* input = buf; input++;

    if (cmd == '#') { // Print the version
      Serial.println("#: slave 0.0.1");

    } else if (cmd == 'w') { // Get weight
      Serial.print("weight: ");
      Serial.println(getGram(scale), 1); // Print the gram value with one decimal precision
      
    } else if (cmd == 'c') { // Calibrate with a weight 
      if (parseNumber(&input, nb) < 0) {
        Serial.print("error: ");
        Serial.println("Invalid number given.");
        return;
      }
      calibrateWithWeight(scale, nb);

    } else if (cmd == 'h') { // Print the help
      Serial.println("#: version");
      Serial.println("w: get weight");
      Serial.println("c(float): calibrate with a given weight on the scale");
      Serial.println("y: calibrate empty");
      //Serial.println("e: calibrate empty");
      Serial.println("e: enable all motors");
      Serial.println("d: disable all motors");
      Serial.println(">: write variable");
      Serial.println("=: read variable");
      Serial.println("u: unscrew");
      Serial.println("mj(relative destination): move the stepper j to a relative destination");
      Serial.println("f: free/release the gripper");
      Serial.println("r(axis): reference the given axis");
      Serial.println("g(strengh): grab with a given strengh from 0 to 255");
      Serial.println("s: stop everything! and send back when it was stopped at");

    } else if (cmd == 'y') { // Calibrate empty
      calibrateEmpty(scale);

    } else if (cmd == 'r') { // Reference
      
      char axis = *input;
      if (axis == 'r') {
        referenceDCMotor(gripper_1); input++;
      } else {
        StepperConfig* stepper = parseStepper(&input, steppers);
        if (stepper == NULL) { Serial.println("error: Invalid reference. Not a motor."); return; }

        if (axis == 'h') {
          stepper_h.destination = -999999;
          move(&stepper_h, stepper_h.nominal_delay, referenceReachedH);
        } else if (axis == 'v') {
          stepper_v.destination = -999999;
          move(&stepper_v, stepper_v.reference_delay, referenceReachedV);
        }
        stepper->position_steps = 0;
      }
      
    
    } else if (cmd == 'e') { // Enable all motors
      for (int i = 0; steppers[i] != NULL; i++) {
        digitalWrite(steppers[i]->pin_enable, LOW);  
      }

    } else if (cmd == 'u') { // Unscrew

      double jar_x;
      double jar_z;
      if (parseNumber(&input, jar_x) < 0) {
        Serial.println("error: Invalid variable id."); return;
      }
      input++;
      if (parseNumber(&input, jar_z) < 0) {
        Serial.println("error: Invalid variable value. Not a number."); return;
      }

      for (double angle = unscrew_start_angle; angle < unscrew_end_angle; angle = angle + 0.02) {

        double gripper_without_side_offset_z = jar_z + cos((angle+90.0) / 180.0 * PI) * gripper_side_offset;
        double alpha_z = gripper_without_side_offset_z + cos((angle) / 180.0 * PI) * gripper_radius;
        double t = acos((user_coord_offset_z - alpha_z)/alpha_radius) * 180.0 / PI;
        double a = angle - t;
        if (a > 90.0 || a < -90.0) { // FIXME: Hardcoded min and max a
          t = -t;
          a = angle - t;
        }
          
        double gripper_without_side_offset_x = jar_x + sin((a+t+90.0) / 180.0 * PI) * gripper_side_offset;
        double alpha_x = gripper_without_side_offset_x + sin((a+t) / 180.0 * PI) * gripper_radius;
        double base_x = alpha_x + (sin(t / 180.0 * PI) * alpha_radius);
        double h = user_coord_offset_x - base_x;

        //double alpha_z = user_coord_offset_z - (cos(t / 180.0 * PI) * alpha_radius);
        //double a = -(180.0 - (acos((jar_z - alpha_z) / gripper_radius) * 180.0 / PI - t));

        //double alpha_x = jar_x + sin((a+t) / 180.0 * PI) * gripper_radius;
        //double base_x = alpha_x + (sin(t / 180.0 * PI) * alpha_radius);
        //double h = user_coord_offset_x - base_x;
        
        stepper_h.destination = h;
        stepper_a.destination = a;
        stepper_t.destination = t;

        //Serial.print("h: ");
        //Serial.println(h);
        //Serial.print("t: ");
        //Serial.println(t);
        //Serial.print("a: ");
        //Serial.println(a);
      
        if (move(&stepper_h, stepper_h.nominal_delay, askedToStop) < 0) {return;}
        if (move(&stepper_t, stepper_t.nominal_delay, askedToStop) < 0) {return;}
        if (move(&stepper_a, stepper_a.nominal_delay, askedToStop) < 0) {return;}
      }

    } else if (cmd == '>') { // Set variable
      if (parseNumber(&input, nb) < 0) {
        Serial.println("error: Invalid variable id."); return;
      }
      int id = nb;
      input++;
      if (parseNumber(&input, nb) < 0) {
        Serial.println("error: Invalid variable value. Not a number."); return;
      }

      // TODO: Générer ce code automatiquement à partir de ruby. Ainsi, ça serait certain
      // d'utiliser le même numéro, et ça serait plus facile à gérer avec l'UI.
      switch (id) {
        case 0:
          Serial.print("Setting variable $alpha_radius to ");
          alpha_radius = nb;
          break;
        case 1:
          Serial.print("Setting variable $gripper_radius to ");
          gripper_radius = nb;
          break;
        case 2:
          Serial.print("Setting variable user_coord_offset_z to ");
          user_coord_offset_z = nb;
          break;
        case 3:
          Serial.print("Setting variable user_coord_offset_x to ");
          user_coord_offset_x = nb;
          break;
        case 4:
          Serial.print("Setting variable gripper_side_offset to ");
          gripper_side_offset = nb;
          break;
        case 5:
          Serial.print("Setting variable scale.ratio to ");
          scale.ratio = nb;
          break;
        case 6:
          Serial.print("Setting variable unscrew_start_angle to ");
          unscrew_start_angle = nb;
          break;
        case 7:
          Serial.print("Setting variable unscrew_end_angle to ");
          unscrew_end_angle = nb;
          break;
        default:
          Serial.println("error: Unkown variable id."); return;
      }
      Serial.println(nb);

    } else if (cmd == 'd') { // Disable all motors
      for (int i = 0; steppers[i] != NULL; i++) {
        digitalWrite(steppers[i]->pin_enable, HIGH);  
      }

    } else if (cmd == '@') { // Disable all motors
      for (int i = 0; steppers[i] != NULL; i++) {
        Serial.print(steppers[i]->id);  
        Serial.print(": ");
        Serial.println(steppers[i]->position_steps / steppers[i]->steps_per_unit);  
      }

    } else if (cmd == 'm') { // Move

      char axis = *input;
      
      if (axis == 'r') {
        input++;
        if (parseNumber(&input, nb) < 0) {
          Serial.println("error: Invalid move destination. Not a number."); return;
        }
        gripper_1.destination = nb;
        moveDCMotor(gripper_1);
        
      } else {
        StepperConfig* stepper = parseStepper(&input, steppers);
        if (stepper == NULL) { Serial.println("error: Invalid move destination. Not a stepper."); return; }
        
        if (parseNumber(&input, nb) < 0) {
          Serial.println("error: Invalid move destination. Not a number."); return;
        }
        
        stepper->destination = nb;
        move(stepper, stepper->nominal_delay, askedToStop);
      }

    } else if (cmd == 'f') { // Release
      MotorConfig* motor = parseDCMotor(&input, grippers);
      if (motor == NULL) { Serial.println("error: Invalid gripper id."); return; }
      release(*motor);
    
    } else if (cmd == 'g') { // Grab
      MotorConfig* motor = parseDCMotor(&input, grippers);
      if (motor == NULL) { Serial.println("error: Invalid gripper id."); return; }
      if (parseNumber(&input, nb) < 0) {
        Serial.println("error: Invalid number given.");
        return;
      }
      grab(*motor, nb);

    } else if (cmd == 'p') { // Grab with brake dc motor
      BrakeDCMotor* motor = parseBrakeDCMotor(&input, brake_grippers);
      if (motor == NULL) { Serial.println("error: Invalid gripper id."); return; }
      if (parseNumber(&input, nb) < 0) {
        Serial.println("error: Invalid number given.");
        return;
      }
      brake_grab(*motor, nb);

    } else if (cmd == '+') {
      BrakeDCMotor* motor = parseBrakeDCMotor(&input, brake_grippers);
      if (motor == NULL) { Serial.println("error: Invalid gripper id."); return; }
      if (parseNumber(&input, nb) < 0) { Serial.println("error: Invalid number given."); return; }
      motor->turn(CW, nb);

    } else if (cmd == '-') {
      BrakeDCMotor* motor = parseBrakeDCMotor(&input, brake_grippers);
      if (motor == NULL) { Serial.println("error: Invalid gripper id."); return; }
      if (parseNumber(&input, nb) < 0) { Serial.println("error: Invalid number given."); return; }
      motor->turn(CCW, nb);

    } else if (cmd == 'q') { // Release with brake dc motor
      BrakeDCMotor* motor = parseBrakeDCMotor(&input, brake_grippers);
      if (motor == NULL) { Serial.println("error: Invalid gripper id."); return; }
      brake_release(*motor);

    } else if (cmd == 's' || cmd == 'S') {
      for (int i = 0; dc_motors[i] != NULL; i++) {
        dc_motors[i]->stop();
      }
    
    } else {
      Serial.print("error: Unkown command: ");
      Serial.println(cmd);
      return;
    }
    Serial.println("done");
  }

  //delay(100); // OPTIMIZE: Probably useless since it is busy wait I believe
}
