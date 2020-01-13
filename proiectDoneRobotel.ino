
#include <SoftwareSerial.h>
SoftwareSerial BTserial(2, 3); // RX | TX
#include <AFMotor.h>
#include <Servo.h>
AF_DCMotor motor1(1);
AF_DCMotor motor2(2);

char t;

void setup() {
BTserial.begin(9600);
Serial.begin(9600);           // set up Serial library at 9600 bps
motor1.setSpeed(250);
motor1.run(RELEASE);
motor2.setSpeed(250);
motor2.run(RELEASE);
}


void loop() {

if (BTserial.available())
    {  
        t = BTserial.read();
    }
if (t == 'F'){
motor1.setSpeed(150);
   motor1.run(BACKWARD);
   motor2.setSpeed(150);
   motor2.run(FORWARD);
} else if (t == 'B') {
   motor1.setSpeed(150);
   motor1.run(FORWARD);
   motor2.setSpeed(150);
   motor2.run(BACKWARD);
} else if (t == 'L') {
  motor1.setSpeed(250);
   motor1.run(BACKWARD);
   motor2.setSpeed(250);
   motor2.run(BACKWARD);
} else if (t == 'R') {
   motor1.setSpeed(250);             
   motor1.run(FORWARD);
   motor2.setSpeed(250);
   motor2.run(FORWARD);
} else if (t == 'S') {
   motor1.run(RELEASE);
   motor2.run(RELEASE);
}
}
